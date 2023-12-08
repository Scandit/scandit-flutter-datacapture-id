/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'function_names.dart';
import 'id_anonymization_mode.dart';

// ignore: avoid_classes_with_only_static_members
class IdCaptureDefaults {
  static bool _isInitialized = false;
  static MethodChannel channel = MethodChannel(IdCaptureFunctionNames.methodsChannelName);
  static late IdCaptureOverlayDefaults _idCaptureOverlayDefaults;
  static late CameraSettingsDefaults _cameraSettingsDefaults;
  static late IdCaptureSettingsDefaults _captureSettingsDefaults;

  static IdCaptureOverlayDefaults get idCaptureOverlayDefaults => _idCaptureOverlayDefaults;

  static CameraSettingsDefaults get cameraSettingsDefaults => _cameraSettingsDefaults;

  static IdCaptureSettingsDefaults get captureSettingsDefaults => _captureSettingsDefaults;

  static Future<void> initializeDefaults() async {
    if (_isInitialized) return;
    var result = await channel.invokeMethod("getDefaults");
    var json = jsonDecode(result as String);

    _cameraSettingsDefaults = CameraSettingsDefaults.fromJSON(json["RecommendedCameraSettings"]);
    _idCaptureOverlayDefaults = IdCaptureOverlayDefaults.fromJSON(json["IdCaptureOverlay"]);
    _captureSettingsDefaults = IdCaptureSettingsDefaults.fromJSON(json["IdCaptureSettings"]);

    _isInitialized = true;
  }
}

class IdCaptureOverlayDefaults {
  final Brush defaultCapturedBrush;
  final Brush defaultLocalizedBrush;
  final Brush defaultRejectedBrush;

  IdCaptureOverlayDefaults(this.defaultCapturedBrush, this.defaultLocalizedBrush, this.defaultRejectedBrush);

  factory IdCaptureOverlayDefaults.fromJSON(Map<String, dynamic> json) {
    var defaultCapturedBrush = BrushDefaults.fromJSON(json["DefaultCapturedBrush"] as Map<String, dynamic>).toBrush();
    var defaultLocalizedBrush = BrushDefaults.fromJSON(json["DefaultLocalizedBrush"] as Map<String, dynamic>).toBrush();
    var defaultRejectedBrush = BrushDefaults.fromJSON(json["DefaultRejectedBrush"] as Map<String, dynamic>).toBrush();
    return IdCaptureOverlayDefaults(defaultCapturedBrush, defaultLocalizedBrush, defaultRejectedBrush);
  }
}

class IdCaptureSettingsDefaults {
  final IdAnonymizationMode anonymizationMode;

  IdCaptureSettingsDefaults(this.anonymizationMode);

  factory IdCaptureSettingsDefaults.fromJSON(Map<String, dynamic> json) {
    var anonymizationMode = IdAnonymizationModeDeserializer.fromJSON(json["anonymizationMode"] as String);
    return IdCaptureSettingsDefaults(anonymizationMode);
  }
}
