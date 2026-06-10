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
import 'internal/function_names.dart';
import 'internal/id_capture_defaults.dart';

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
    _feedback.addListener(_onFeedbackChanged);
  }

  IdCapture(IdCaptureSettings settings) : this._(null, settings);

  void _onFeedbackChanged() {
    _controller.updateFeedback(_feedback);
  }

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
    _feedback.removeListener(_onFeedbackChanged);
    _feedback = newValue;
    _controller.updateFeedback(newValue);
    _feedback.addListener(_onFeedbackChanged);
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

  String? _externalTransactionId;

  String? get externalTransactionId => _externalTransactionId;

  set externalTransactionId(String? value) {
    _externalTransactionId = value;
    _controller.updateIdCaptureMode();
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
      'externalTransactionId': _externalTransactionId,
      'modeId': _modeId,
      'enabled': _enabled,
      'hasListeners': _listeners.isNotEmpty,
    };
  }
}

class _IdCaptureListenerController extends BaseController {
  final EventChannel _eventChannel = const EventChannel(IdCaptureFunctionNames.eventsChannelName);
  final IdCapture _idCapture;
  StreamSubscription<dynamic>? _idCaptureSubscription;

  _IdCaptureListenerController(this._idCapture) : super(IdCaptureFunctionNames.methodsChannelName);

  void subscribeListeners() {
    methodChannel.invokeMethod(IdCaptureFunctionNames.addIdCaptureListenerName, {"modeId": _idCapture._modeId}).then(
        (value) => _setupIdCaptureSubscription(),
        onError: onError);
  }

  Future<void> reset() {
    return methodChannel.invokeMethod<void>(IdCaptureFunctionNames.resetName, {
      "modeId": _idCapture._modeId,
    }).onError(onError);
  }

  void _setupIdCaptureSubscription() {
    _idCaptureSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      if (_idCapture._listeners.isEmpty) return;

      var eventJSON = jsonDecode(event);

      if (eventJSON["modeId"] != _idCapture._modeId) {
        return;
      }

      var eventName = eventJSON["event"] as String;
      if (eventName == IdCaptureListener._didCaptureId) {
        var capturedId = _parseCapturedId(eventJSON);
        _notifyDidCaptureId(capturedId).then((value) {
          methodChannel.invokeMethod(IdCaptureFunctionNames.finishDidCaptureIdName, {
            "modeId": _idCapture._modeId,
            "enabled": _idCapture.isEnabled,
          }).then((value) => null, onError: (error) => developer.log(error));
        });
      } else if (eventName == IdCaptureListener._didRejectId) {
        CapturedId? capturedId = eventJSON["id"] != null ? _parseCapturedId(eventJSON) : null;
        var rejectionReson = RejectionReasonDeserializer.fromJSON(eventJSON['rejectionReason']);
        _notifyDidRejectId(capturedId, rejectionReson).then((value) {
          methodChannel.invokeMethod(IdCaptureFunctionNames.finishDidRejectIdName, {
            "modeId": _idCapture._modeId,
            "enabled": _idCapture.isEnabled,
          }).then((value) => null, onError: (error) => developer.log(error));
        });
      }
    });
  }

  void unsubscribeListeners() {
    _idCaptureSubscription?.cancel();
    methodChannel.invokeMethod(IdCaptureFunctionNames.removeIdCaptureListenerName, {
      "modeId": _idCapture._modeId,
    }).then((value) => null, onError: onError);
  }

  CapturedId _parseCapturedId(Map<String, dynamic> eventJSON) {
    final decodedId = jsonDecode(eventJSON["id"]);

    if (eventJSON["imageInfo"] != null) {
      final idImagesJson = eventJSON["imageInfo"] as Map<String, dynamic>;
      decodedId["imageInfo"] = idImagesJson;
    }

    if (eventJSON["frontReviewImage"] != null) {
      final verificationResultJson = decodedId["verificationResult"] as Map<String, dynamic>;
      if (verificationResultJson["dataConsistencyResult"] != null) {
        final dataConsistencyResultJson = verificationResultJson["dataConsistencyResult"] as Map<String, dynamic>;
        dataConsistencyResultJson["frontReviewImage"] = eventJSON["frontReviewImage"];
      }
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
    methodChannel.invokeMethod(IdCaptureFunctionNames.setModeEnabledState, {
      "modeId": _idCapture._modeId,
      "enabled": newValue,
    }).then((value) => null, onError: onError);
  }

  Future<void> applyNewSettings(IdCaptureSettings settings) {
    return methodChannel.invokeMethod(IdCaptureFunctionNames.applyIdCaptureModeSettings, {
      "modeId": _idCapture._modeId,
      "settingsJson": jsonEncode(settings.toMap())
    }).then((value) => null, onError: onError);
  }

  Future<void> updateIdCaptureMode() {
    return methodChannel.invokeMethod(IdCaptureFunctionNames.updateIdCaptureMode, {
      "modeId": _idCapture._modeId,
      "modeJson": jsonEncode(_idCapture.toMap())
    }).then((value) => null, onError: onError);
  }

  Future<void> updateFeedback(IdCaptureFeedback feedback) {
    return methodChannel.invokeMethod(IdCaptureFunctionNames.updateFeedback, {
      "modeId": _idCapture._modeId,
      "feedbackJson": jsonEncode(feedback.toMap())
    }).then((value) => null, onError: onError);
  }
}
