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
import 'id_capture_session.dart';

abstract class IdCaptureListener {
  static const String _didCaptureId = "idCaptureListener-didCaptureId";
  static const String _didLocalizeId = "idCaptureListener-didLocalizeId";
  static const String _didFail = "idCaptureListener-didFail";
  static const String _didRejectId = "idCaptureListener-didRejectId";

  void didCaptureId(IdCapture idCapture, IdCaptureSession session);

  void didRejectId(IdCapture idCapture, IdCaptureSession session);

  void didFailWithError(IdCapture idCapture, IdCaptureError error, IdCaptureSession session);

  void didLocalizeId(IdCapture idCapture, IdCaptureSession session);
}

class IdCapture extends DataCaptureMode {
  late _IdCaptureListenerController _controller;

  bool _enabled = true;

  bool _isInCallback = false;

  final List<IdCaptureListener> _listeners = [];

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
    if (_listeners.isEmpty) {
      _controller.subscribeListeners();
    }
    if (_listeners.contains(listener)) {
      return;
    }
    _listeners.add(listener);
  }

  void removeListener(IdCaptureListener listener) {
    _listeners.remove(listener);
    if (_listeners.isEmpty) {
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

  _IdCaptureListenerController.forIdCapture(this._idCapture);

  void subscribeListeners() {
    _methodChannel
        .invokeMethod("addIdCaptureListener")
        .then((value) => _setupIdCaptureSubscription(), onError: _onError);
  }

  Future<void> reset() {
    return _methodChannel.invokeMethod<void>("reset").onError(_onError);
  }

  void _setupIdCaptureSubscription() {
    _idCaptureSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (_idCapture._listeners.isEmpty) return;

      var eventJSON = jsonDecode(event);
      var session = IdCaptureSession.fromJSON(jsonDecode(eventJSON["session"]));
      var eventName = eventJSON["event"] as String;
      if (eventName == IdCaptureListener._didCaptureId) {
        _notifyDidCaptureId(session);
        _methodChannel
            .invokeMethod("finishDidCaptureId", _idCapture.isEnabled)
            // ignore: unnecessary_lambdas
            .then((value) => null, onError: (error) => print(error));
      } else if (eventName == IdCaptureListener._didLocalizeId) {
        _notifyDidLocalizeId(session);
      } else if (eventName == IdCaptureListener._didRejectId) {
        _notifyDidRejectId(session);
      } else if (eventName == IdCaptureListener._didFail) {
        var error = IdCaptureError.fromJSON(eventJSON["error"]);
        _notifyDidFailWithError(error, session);
      }
    });
  }

  void unsubscribeListeners() {
    _idCaptureSubscription?.cancel();
    _methodChannel.invokeMethod("removeIdCaptureListener").then((value) => null, onError: _onError);
  }

  void _notifyDidFailWithError(IdCaptureError error, IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didFailWithError(_idCapture, error, session);
    }
    _idCapture._isInCallback = false;
  }

  void _notifyDidCaptureId(IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didCaptureId(_idCapture, session);
    }
    _idCapture._isInCallback = false;
  }

  void _notifyDidLocalizeId(IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didLocalizeId(_idCapture, session);
    }
    _idCapture._isInCallback = false;
  }

  void _notifyDidRejectId(IdCaptureSession session) {
    _idCapture._isInCallback = true;
    for (var listener in _idCapture._listeners) {
      listener.didRejectId(_idCapture, session);
    }
    _idCapture._isInCallback = false;
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
