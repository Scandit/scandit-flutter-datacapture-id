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
import 'function_names.dart';
import 'id_capture_defaults.dart';

abstract class IdCaptureListener {
  static const String _didCaptureId = "IdCaptureListener.didCaptureId";
  static const String _didLocalizeId = "IdCaptureListener.didLocalizeId";
  static const String _didRejectId = "IdCaptureListener.didRejectId";
  static const String _didTimeout = "IdCaptureListener.didTimeout";

  void didCaptureId(IdCapture idCapture, IdCaptureSession session);

  void didRejectId(IdCapture idCapture, IdCaptureSession session);

  @Deprecated(
      "This method is no longer executed by the listener. See didRejectId for scenarios previously reported by this callback.")
  void didFailWithError(IdCapture idCapture, IdCaptureError error, IdCaptureSession session);

  void didLocalizeId(IdCapture idCapture, IdCaptureSession session);

  void didTimedOut(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());
}

abstract class IdCaptureAdvancedListener {
  void didCaptureId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  void didRejectId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  @Deprecated(
      "This method is no longer executed by the listener. See didRejectId for scenarios previously reported by this callback.")
  void didFailWithError(
      IdCapture idCapture, IdCaptureError error, IdCaptureSession session, Future<FrameData> getFrameData());

  void didLocalizeId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  void didTimedOut(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());
}

abstract class IdCaptureAdvancedAsyncListener {
  Future<void> didCaptureId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  Future<void> didRejectId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  Future<void> didTimedOut(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());

  Future<void> didLocalizeId(IdCapture idCapture, IdCaptureSession session, Future<FrameData> getFrameData());
}

class IdCapture extends DataCaptureMode {
  late _IdCaptureListenerController _controller;

  bool _enabled = true;

  bool _isInCallback = false;

  final List<IdCaptureListener> _listeners = [];

  final List<IdCaptureAdvancedListener> _advancedListeners = [];

  final List<IdCaptureAdvancedAsyncListener> _advancedAsyncListeners = [];

  IdCaptureSettings _settings;

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
        properties: defaults.properties, shouldPreferSmoothAutoFocus: defaults.shouldPreferSmoothAutoFocus);
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

  void addAdvancedAsyncListener(IdCaptureAdvancedAsyncListener listener) {
    _checkAndSubscribeListeners();
    if (_advancedAsyncListeners.contains(listener)) {
      return;
    }
    _advancedAsyncListeners.add(listener);
  }

  void _checkAndSubscribeListeners() {
    if (_listeners.isEmpty && _advancedListeners.isEmpty && _advancedAsyncListeners.isEmpty) {
      _controller.subscribeListeners();
    }

    if (_advancedAsyncListeners.isEmpty) {
      _controller.addAsyncListener();
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

  void removeAdvancedAsyncListener(IdCaptureAdvancedAsyncListener listener) {
    _advancedAsyncListeners.remove(listener);
    _checkAndUnsubscribeListeners();
  }

  void _checkAndUnsubscribeListeners() {
    if (_listeners.isEmpty && _advancedListeners.isEmpty && _advancedAsyncListeners.isEmpty) {
      _controller.unsubscribeListeners();
    }
    if (_advancedAsyncListeners.isEmpty) {
      _controller.removeAsyncListener();
    }
  }

  Future<void> reset() {
    return _controller.reset();
  }

  Future<void> applySettings(IdCaptureSettings settings) {
    _settings = settings;
    return didChange();
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
  final EventChannel _eventChannel = const EventChannel(IdCaptureFunctionNames.eventsChannelName);
  final MethodChannel _methodChannel = MethodChannel(IdCaptureFunctionNames.methodsChannelName);
  final IdCapture _idCapture;
  StreamSubscription<dynamic>? _idCaptureSubscription;

  _IdCaptureListenerController.forIdCapture(this._idCapture);

  void subscribeListeners() {
    _methodChannel
        .invokeMethod(IdCaptureFunctionNames.addIdCaptureListenerName)
        .then((value) => _setupIdCaptureSubscription(), onError: _onError);
  }

  Future<void> reset() {
    return _methodChannel.invokeMethod<void>(IdCaptureFunctionNames.resetName).onError(_onError);
  }

  void _setupIdCaptureSubscription() {
    _idCaptureSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (_idCapture._listeners.isEmpty &&
          _idCapture._advancedListeners.isEmpty &&
          _idCapture._advancedAsyncListeners.isEmpty) return;

      var eventJSON = jsonDecode(event);
      var session = IdCaptureSession.fromJSON(jsonDecode(eventJSON["session"]));
      var eventName = eventJSON["event"] as String;
      if (eventName == IdCaptureListener._didCaptureId) {
        _notifyDidCaptureId(session).then((value) {
          _methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidCaptureIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => print(error));
        });
      } else if (eventName == IdCaptureListener._didLocalizeId) {
        _notifyDidLocalizeId(session).then((value) {
          _methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidLocalizeIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => print(error));
        });
      } else if (eventName == IdCaptureListener._didRejectId) {
        _notifyDidRejectId(session).then((value) {
          _methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidRejectIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => print(error));
        });
      } else if (eventName == IdCaptureListener._didTimeout) {
        _notifyDidTimeout(session).then((value) {
          _methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidTimeoutName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => print(error));
        });
      }
    });
  }

  void unsubscribeListeners() {
    _idCaptureSubscription?.cancel();
    _methodChannel
        .invokeMethod(IdCaptureFunctionNames.removeIdCaptureListenerName)
        .then((value) => null, onError: _onError);
  }

  Future<void> _notifyDidCaptureId(IdCaptureSession session) async {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didCaptureId(_idCapture, session);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didCaptureId(_idCapture, session, _getLastFrameData);
    }
    for (var listener in _idCapture._advancedAsyncListeners) {
      await listener.didCaptureId(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  Future<void> _notifyDidLocalizeId(IdCaptureSession session) async {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didLocalizeId(_idCapture, session);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didLocalizeId(_idCapture, session, _getLastFrameData);
    }
    for (var listener in _idCapture._advancedAsyncListeners) {
      await listener.didLocalizeId(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  Future<void> _notifyDidRejectId(IdCaptureSession session) async {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didRejectId(_idCapture, session);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didRejectId(_idCapture, session, _getLastFrameData);
    }
    for (var listener in _idCapture._advancedAsyncListeners) {
      await listener.didRejectId(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  Future<void> _notifyDidTimeout(IdCaptureSession session) async {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didTimedOut(_idCapture, session, _getLastFrameData);
    }
    for (var listener in _idCapture._advancedListeners) {
      listener.didTimedOut(_idCapture, session, _getLastFrameData);
    }
    for (var listener in _idCapture._advancedAsyncListeners) {
      await listener.didTimedOut(_idCapture, session, _getLastFrameData);
    }
    _idCapture._isInCallback = false;
  }

  Future<FrameData> _getLastFrameData() {
    return _methodChannel.invokeMethod(IdCaptureFunctionNames.getLastFrameDataName).then((value) => getFrom(value));
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

  void addAsyncListener() {
    _methodChannel
        .invokeMethod(IdCaptureFunctionNames.addIdCaptureAsyncListener)
        .then((value) => _setupIdCaptureSubscription(), onError: _onError);
  }

  void removeAsyncListener() {
    _methodChannel
        .invokeMethod(IdCaptureFunctionNames.removeIdCaptureAsyncListener)
        .then((value) => _setupIdCaptureSubscription(), onError: _onError);
  }
}
