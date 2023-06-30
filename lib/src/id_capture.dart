/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import '../scandit_flutter_datacapture_id.dart';
import 'id_capture_defaults.dart';

abstract class IdCaptureListener {
  static const String _didCaptureId = "idCaptureListener-didCaptureId";
  static const String _didLocalizeId = "idCaptureListener-didLocalizeId";
  static const String _didRejectId = "idCaptureListener-didRejectId";

  void didCaptureId(IdCapture idCapture, IdCaptureSession session);

  void didRejectId(IdCapture idCapture, IdCaptureSession session);

  @Deprecated(
      "This method is no longer executed by the listener. See didRejectId for scenarios previously reported by this callback.")
  void didFailWithError(IdCapture idCapture, IdCaptureError error, IdCaptureSession session);

  void didLocalizeId(IdCapture idCapture, IdCaptureSession session);
}

abstract class IdCaptureAdvancedListener {
  void didCaptureId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  void didRejectId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  void didFailWithError(
      IdCapture idCapture, IdCaptureError error, IdCaptureSession session, Future<FrameData> getFrameData());

  void didLocalizeId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());
}

class IdCapture extends DataCaptureMode {
  late _IdCaptureListenerController _controller;

  bool _enabled = true;

  bool _isInCallback = false;

  final List<IdCaptureListener> _listeners = [];

  final List<IdCaptureAdvancedListener> _advancedListeners = [];

  final IdCaptureSettings _settings;

  IdCapture._(DataCaptureContext? context, this._settings) {
    _controller = _IdCaptureListenerController.forIdCapture(this);

    context?.addMode(this);
  }

  IdCapture.forContext(DataCaptureContext context, IdCaptureSettings settings) : this._(context, settings);

  static CameraSettings get recommendedCameraSettings => _recommendedCameraSettings();

  static CameraSettings _recommendedCameraSettings() {
    var defaults = IdCaptureDefaults.cameraSettingsDefaults;
    return CameraSettings(defaults.preferredResolution, defaults.zoomFactor, defaults.focusRange,
        defaults.focusGestureStrategy, defaults.zoomGestureZoomFactor,
        shouldPreferSmoothAutoFocus: defaults.shouldPreferSmoothAutoFocus);
  }

  @override
  DataCaptureContext? get context => super.context;

  @override
  bool get isEnabled => _enabled;

  @override
  set isEnabled(bool newValue) {
    _enabled = newValue;
    if (_isInCallback) {
      return;
    }
    didChange();
  }

  void addListener(IdCaptureListener listener) {
    _checkAndSubscribeListeners();
    if (_listeners.contains(listener)) {
      return;
    }
    _listeners.add(listener);
  }

  void addAdvancedListener(IdCaptureAdvancedListener listener) {
    _checkAndSubscribeListeners();
    if (_advancedListeners.contains(listener)) {
      return;
    }
    _advancedListeners.add(listener);
  }

  void _checkAndSubscribeListeners() {
    if (_listeners.isEmpty && _advancedListeners.isEmpty) {
      _controller.subscribeListeners();
    }
  }

  void removeListener(IdCaptureListener listener) {
    _listeners.remove(listener);
    _checkAndUnsubscribeListeners();
  }

  void removeAdvancedListener(IdCaptureAdvancedListener listener) {
    _advancedListeners.remove(listener);
    _checkAndUnsubscribeListeners();
  }

  void _checkAndUnsubscribeListeners() {
    if (_listeners.isEmpty && _advancedListeners.isEmpty) {
      _controller.unsubscribeListeners();
    }
  }

  Future<void> reset() {
    return _controller.reset();
  }

  Future<void> didChange() {
    if (context != null) {
      return context!.update();
    }
    return Future.value();
  }

  @override
  Map<String, dynamic> toMap() {
    return {'type': 'idCapture', 'enabled': _enabled, "settings": _settings.toMap()};
  }
}

class _IdCaptureListenerController {
  final EventChannel _eventChannel = const EventChannel("com.scandit.datacapture.id.capture.event/id_capture_listener");
  final MethodChannel _methodChannel = MethodChannel("com.scandit.datacapture.id.capture.method/id_capture_listener");
  final IdCapture _idCapture;
  StreamSubscription<dynamic>? _idCaptureSubscription;
  static const String _getLastFrameDataName = 'getLastFrameData';
  static const String _removeIdCaptureListenerName = 'removeIdCaptureListener';
  static const String _addIdCaptureListenerName = 'addIdCaptureListener';
  static const String _resetName = 'reset';
  static const String _finishDidCaptureIdName = 'finishDidCaptureId';
  static const String _finishDidLocalizeIdName = 'finishDidLocalizeId';
  static const String _finishDidRejectIdName = 'finishDidRejectId';

  _IdCaptureListenerController.forIdCapture(this._idCapture);

  void subscribeListeners() {
    _methodChannel
        .invokeMethod(_addIdCaptureListenerName)
        .then((value) => _setupIdCaptureSubscription(), onError: _onError);
  }

  Future<void> reset() {
    return _methodChannel.invokeMethod<void>(_resetName).onError(_onError);
  }

  void _setupIdCaptureSubscription() {
    _idCaptureSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (_idCapture._listeners.isEmpty && _idCapture._advancedListeners.isEmpty) return;

      var eventJSON = jsonDecode(event);
      var session = IdCaptureSession.fromJSON(jsonDecode(eventJSON["session"]));
      var eventName = eventJSON["event"] as String;
      if (eventName == IdCaptureListener._didCaptureId) {
        _notifyDidCaptureId(session);
        _methodChannel
            .invokeMethod(_finishDidCaptureIdName, _idCapture.isEnabled)
            // ignore: unnecessary_lambdas
            .then((value) => null, onError: (error) => print(error));
      } else if (eventName == IdCaptureListener._didLocalizeId) {
        _notifyDidLocalizeId(session);
        _methodChannel
            .invokeMethod(_finishDidLocalizeIdName, _idCapture.isEnabled)
            // ignore: unnecessary_lambdas
            .then((value) => null, onError: (error) => print(error));
      } else if (eventName == IdCaptureListener._didRejectId) {
        _notifyDidRejectId(session);
        _methodChannel
            .invokeMethod(_finishDidRejectIdName, _idCapture.isEnabled)
            // ignore: unnecessary_lambdas
            .then((value) => null, onError: (error) => print(error));
      }
    });
  }

  void unsubscribeListeners() {
    _idCaptureSubscription?.cancel();
    _methodChannel.invokeMethod(_removeIdCaptureListenerName).then((value) => null, onError: _onError);
  }

  void _notifyDidCaptureId(IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didCaptureId(_idCapture, session);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didCaptureId(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  void _notifyDidLocalizeId(IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didLocalizeId(_idCapture, session);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didLocalizeId(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  void _notifyDidRejectId(IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didRejectId(_idCapture, session);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didRejectId(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  Future<FrameData> _getLastFrameData() {
    return _methodChannel
        .invokeMethod(_getLastFrameDataName)
        .then((value) => getFrom(value as String), onError: _onError);
  }

  DefaultFrameData getFrom(String response) {
    final decoded = jsonDecode(response);
    return DefaultFrameData.fromJSON(decoded);
  }

  void _onError(Object? error, StackTrace? stackTrace) {
    if (error == null) return;
    print(error);

    if (stackTrace != null) {
      print(stackTrace);
    }

    throw error;
  }
}
