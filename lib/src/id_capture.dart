/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/base_controller.dart';

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

  final _modeId = Random().nextInt(0x7FFFFFFF);

  IdCapture._(DataCaptureContext? context, this._settings) {
    _controller = _IdCaptureListenerController(this);

    context?.setMode(this);
  }

  IdCapture(IdCaptureSettings settings) : this._(null, settings);

  @Deprecated('Use constructor IdCapture(IdCaptureSettings settings) instead.')
  IdCapture.forContext(DataCaptureContext context, IdCaptureSettings settings) : this._(context, settings);

  @Deprecated('Use createRecommendedCameraSettings() instead.')
  static CameraSettings get recommendedCameraSettings => createRecommendedCameraSettings();

  static CameraSettings createRecommendedCameraSettings() {
    var defaults = IdCaptureDefaults.cameraSettingsDefaults;
    return CameraSettings(
      defaults.preferredResolution,
      defaults.zoomFactor,
      defaults.focusRange,
      defaults.focusGestureStrategy,
      defaults.zoomGestureZoomFactor,
      properties: defaults.properties,
      shouldPreferSmoothAutoFocus: defaults.shouldPreferSmoothAutoFocus,
    );
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
      'modeId': _modeId,
    };
  }
}

class _IdCaptureListenerController extends BaseController {
  final EventChannel _eventChannel = const EventChannel(IdCaptureFunctionNames.eventsChannelName);
  final IdCapture _idCapture;
  StreamSubscription<dynamic>? _idCaptureSubscription;

  _IdCaptureListenerController(this._idCapture) : super(IdCaptureFunctionNames.methodsChannelName);

  void subscribeListeners() {
    methodChannel
        .invokeMethod(IdCaptureFunctionNames.addIdCaptureListenerName)
        .then((value) => _setupIdCaptureSubscription(), onError: onError);
  }

  Future<void> reset() {
    return methodChannel.invokeMethod<void>(IdCaptureFunctionNames.resetName).onError(onError);
  }

  void _setupIdCaptureSubscription() {
    _idCaptureSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (_idCapture._listeners.isEmpty) return;

      var eventJSON = jsonDecode(event);
      var eventName = eventJSON["event"] as String;
      if (eventName == IdCaptureListener._didCaptureId) {
        final capturedId = _parseCapturedId(eventJSON);
        _notifyDidCaptureId(capturedId).then((value) {
          methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidCaptureIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => developer.log(error));
        });
      } else if (eventName == IdCaptureListener._didRejectId) {
        CapturedId? capturedId = eventJSON["id"] != null ? _parseCapturedId(eventJSON) : null;
        var rejectionReson = RejectionReasonDeserializer.fromJSON(eventJSON['rejectionReason']);
        _notifyDidRejectId(capturedId, rejectionReson).then((value) {
          methodChannel
              .invokeMethod(IdCaptureFunctionNames.finishDidRejectIdName, _idCapture.isEnabled)
              // ignore: unnecessary_lambdas
              .then((value) => null, onError: (error) => developer.log(error));
        });
      }
    });
  }

  void unsubscribeListeners() {
    _idCaptureSubscription?.cancel();
    methodChannel
        .invokeMethod(IdCaptureFunctionNames.removeIdCaptureListenerName)
        .then((value) => null, onError: onError);
  }

  CapturedId _parseCapturedId(Map<String, dynamic> eventJSON) {
    final decodedId = jsonDecode(eventJSON["id"]);

    if (eventJSON["imageInfo"] != null) {
      final idImagesJson = eventJSON["imageInfo"] as Map<String, dynamic>;
      decodedId["imageInfo"] = idImagesJson;
    }

    return CapturedId.fromJSON(decodedId);
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

  void setModeEnabledState(bool newValue) {
    methodChannel
        .invokeMethod(IdCaptureFunctionNames.setModeEnabledState, newValue)
        .then((value) => null, onError: onError);
  }

  Future<void> applyNewSettings(IdCaptureSettings settings) {
    return methodChannel
        .invokeMethod(IdCaptureFunctionNames.applyIdCaptureModeSettings, jsonEncode(settings.toMap()))
        .then((value) => null, onError: onError);
  }

  Future<void> updateIdCaptureMode() {
    return methodChannel
        .invokeMethod(IdCaptureFunctionNames.updateIdCaptureMode, jsonEncode(_idCapture.toMap()))
        .then((value) => null, onError: onError);
  }

  Future<void> updateFeedback(IdCaptureFeedback feedback) {
    return methodChannel.invokeMethod(IdCaptureFunctionNames.updateFeedback, jsonEncode(feedback.toMap()));
  }
}
