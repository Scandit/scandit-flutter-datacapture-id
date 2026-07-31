/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

// THIS FILE IS GENERATED. DO NOT EDIT MANUALLY.
// Generator: scripts/bridge_generator/generate.py
// Schema: scripts/bridge_generator/schemas/id.json

import 'package:flutter/services.dart';

/// Generated Id method handler for Flutter.
/// Routes all Id method calls through a single executeId entry point.
class IdMethodHandler {
  final MethodChannel _methodChannel;

  IdMethodHandler(this._methodChannel);

  /// Single entry point for all Id operations.
  /// Routes to appropriate native command based on moduleName and methodName.
  Future<dynamic> executeId(String moduleName, String methodName, Map<String, dynamic> params) async {
    final arguments = {
      'moduleName': moduleName,
      'methodName': methodName,
      ...params,
    };
    return await _methodChannel.invokeMethod('executeId', arguments);
  }

  /// Resets the ID capture mode
  Future<void> resetIdCaptureMode({required int modeId}) async {
    final params = {
      'modeId': modeId,
    };
    return await executeId('IdCaptureModule', 'resetIdCaptureMode', params);
  }

  /// Sets the enabled state of the ID capture mode
  Future<void> setModeEnabledState({required int modeId, required bool enabled}) async {
    final params = {
      'modeId': modeId,
      'enabled': enabled,
    };
    return await executeId('IdCaptureModule', 'setModeEnabledState', params);
  }

  /// Updates the ID capture mode configuration
  Future<void> updateIdCaptureMode({required String modeJson, required int modeId}) async {
    final params = {
      'modeJson': modeJson,
      'modeId': modeId,
    };
    return await executeId('IdCaptureModule', 'updateIdCaptureMode', params);
  }

  /// Applies new settings to the ID capture mode
  Future<void> applyIdCaptureModeSettings({required String settingsJson, required int modeId}) async {
    final params = {
      'settingsJson': settingsJson,
      'modeId': modeId,
    };
    return await executeId('IdCaptureModule', 'applyIdCaptureModeSettings', params);
  }

  /// Updates the ID capture feedback configuration
  Future<void> updateFeedback({required String feedbackJson, required int modeId}) async {
    final params = {
      'feedbackJson': feedbackJson,
      'modeId': modeId,
    };
    return await executeId('IdCaptureModule', 'updateFeedback', params);
  }

  /// Updates the ID capture overlay configuration
  Future<void> updateIdCaptureOverlay({required String overlayJson}) async {
    final params = {
      'overlayJson': overlayJson,
    };
    return await executeId('IdCaptureModule', 'updateIdCaptureOverlay', params);
  }

  /// Finish callback for ID capture did capture event
  Future<void> finishDidCaptureCallback({required int modeId, required bool enabled}) async {
    final params = {
      'modeId': modeId,
      'enabled': enabled,
    };
    return await executeId('IdCaptureModule', 'finishDidCaptureCallback', params);
  }

  /// Finish callback for ID capture did reject event
  Future<void> finishDidRejectCallback({required int modeId, required bool enabled}) async {
    final params = {
      'modeId': modeId,
      'enabled': enabled,
    };
    return await executeId('IdCaptureModule', 'finishDidRejectCallback', params);
  }

  /// Register persistent event listener for ID capture events
  Future<void> addIdCaptureListener({required int modeId}) async {
    final params = {
      'modeId': modeId,
    };
    return await executeId('IdCaptureModule', 'addIdCaptureListener', params);
  }

  /// Unregister event listener for ID capture events
  Future<void> removeIdCaptureListener({required int modeId}) async {
    final params = {
      'modeId': modeId,
    };
    return await executeId('IdCaptureModule', 'removeIdCaptureListener', params);
  }
}
