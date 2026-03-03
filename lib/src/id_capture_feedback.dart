/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/function_names.dart';
import 'package:scandit_flutter_datacapture_id/src/id_capture_defaults.dart';

class IdCaptureFeedback implements Serializable {
  late _IdCaptureFeedbackController _controller;

  IdCaptureFeedback() {
    _controller = _IdCaptureFeedbackController(this);
  }

  Feedback _idCaptured = IdCaptureDefaults.idCaptureFeedbackDefaults.idCaptured;

  Feedback get idCaptured => _idCaptured;

  set idCaptured(Feedback newValue) {
    _idCaptured = newValue;
    _update();
  }

  Feedback _idRejected = IdCaptureDefaults.idCaptureFeedbackDefaults.idRejected;

  Feedback get idRejected => _idRejected;

  set idRejected(Feedback newValue) {
    _idRejected = newValue;
    _update();
  }

  Feedback _idCaptureTimeout = IdCaptureDefaults.idCaptureFeedbackDefaults.idCaptureTimeout;

  Feedback get idCaptureTimeout => _idCaptureTimeout;

  set idCaptureTimeout(Feedback newValue) {
    _idCaptureTimeout = newValue;
    _update();
  }

  void _update() {
    _controller.updateFeedback();
  }

  static IdCaptureFeedback get defaultFeedback => IdCaptureFeedback();

  @override
  Map<String, dynamic> toMap() {
    return {
      'idCaptured': idCaptured.toMap(),
      'idRejected': idRejected.toMap(),
      'idCaptureTimeout': idCaptureTimeout.toMap(),
    };
  }
}

class _IdCaptureFeedbackController {
  final MethodChannel _methodChannel = MethodChannel(IdCaptureFunctionNames.methodsChannelName);
  final IdCaptureFeedback _feedback;

  _IdCaptureFeedbackController(this._feedback);

  Future<void> updateFeedback() {
    return _methodChannel.invokeMethod(IdCaptureFunctionNames.updateFeedback, jsonEncode(_feedback.toMap()));
  }
}
