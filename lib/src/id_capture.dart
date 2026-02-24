/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/rejection_reson.dart';

import '../scandit_flutter_datacapture_id.dart';
import 'function_names.dart';
import 'id_capture_defaults.dart';

abstract class IdCaptureListener {
  static const String _didCaptureId = "IdCaptureListener.didCaptureId";
  static const String _didRejectId = "IdCaptureListener.didRejectId";

  Future<void> didCaptureId(IdCapture idCapture, CapturedId capturedId);

  Future<void> didRejectId(IdCapture idCapture, CapturedId? rejectedId, RejectionReason reason);
}

class IdCapture extends DataCaptureMode {
  late _IdCaptureListenerController _controller;

  bool _enabled = true;

  final List<IdCaptureListener> _listeners = [];

  IdCaptureSettings _settings;

  IdCaptureFeedback _feedback = IdCaptureFeedback.defaultFeedback;

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
  // ignore: unnecessary_overrides
  DataCaptureContext? get context => super.context;

  @override
  bool get isEnabled => _enabled;

  @override
  set isEnabled(bool newValue) {
    _enabled = newValue;
    _controller.setModeEnabledState(newValue);
  }

  IdCaptureFeedback get feedback => _feedback;

  set feedback(IdCaptureFeedback newValue) {
    _feedback = newValue;
    _controller.updateFeedback(newValue);
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

  Future<void> applySettings(IdCaptureSettings settings) {
    _settings = settings;
    return _controller.applyNewSettings(settings);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': 'idCapture',
      "settings": _settings.toMap(),
      'feedback': _feedback.toMap(),
    };
  }
}

class _IdCaptureListenerController {
  final EventChannel _eventChannel = const EventChannel(IdCaptureFunctionNames.eventsChannelName);
  final MethodChannel _methodChannel = const MethodChannel(IdCaptureFunctionNames.methodsChannelName);
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
      if (_idCapture._listeners.isEmpty) return;

      var eventJSON = jsonDecode(event);
      var eventName = eventJSON["event"] as String;
      if (eventName == IdCaptureListener._didCaptureId) {
        var capturedId = CapturedId.fromJSON(jsonDecode(eventJSON["id"]));
        _notifyDidCaptureId(capturedId).then((value) {
          _methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidCaptureIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => log(error));
        });
      } else if (eventName == IdCaptureListener._didRejectId) {
        CapturedId? capturedId;
        if (eventJSON["id"] != null) {
          capturedId = CapturedId.fromJSON(jsonDecode(eventJSON["id"]));
        }
        var rejectionReson = RejectionReasonDeserializer.fromJSON(eventJSON['rejectionReason']);
        _notifyDidRejectId(capturedId, rejectionReson).then((value) {
          _methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidRejectIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => log(error));
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

  Future<void> _notifyDidCaptureId(CapturedId capturedId) async {
    for (var listener in _idCapture._listeners) {
      await listener.didCaptureId(_idCapture, capturedId);
    }
  }

  Future<void> _notifyDidRejectId(CapturedId? capturedId, RejectionReason reason) async {
    for (var listener in _idCapture._listeners) {
      await listener.didRejectId(_idCapture, capturedId, reason);
    }
  }

  void _onError(Object? error, StackTrace? stackTrace) {
    if (error == null) return;
    throw error;
  }

  void setModeEnabledState(bool newValue) {
    _methodChannel
        .invokeMethod(IdCaptureFunctionNames.setModeEnabledState, newValue)
        .then((value) => null, onError: _onError);
  }

  Future<void> applyNewSettings(IdCaptureSettings settings) {
    return _methodChannel
        .invokeMethod(IdCaptureFunctionNames.applyIdCaptureModeSettings, jsonEncode(settings.toMap()))
        .then((value) => null, onError: _onError);
  }

  Future<void> updateIdCaptureMode() {
    return _methodChannel
        .invokeMethod(IdCaptureFunctionNames.updateIdCaptureMode, jsonEncode(_idCapture.toMap()))
        .then((value) => null, onError: _onError);
  }

  Future<void> updateFeedback(IdCaptureFeedback feedback) {
    return _methodChannel.invokeMethod(IdCaptureFunctionNames.updateFeedback, jsonEncode(feedback.toMap()));
  }
}
