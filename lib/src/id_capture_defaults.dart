/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

// ignore: avoid_classes_with_only_static_members
class IdCaptureDefaults {
  static bool _isInitialized = false;
  static MethodChannel channel = MethodChannel("com.scandit.datacapture.id.capture.method/id_capture_defaults");
  static late IdCaptureOverlayDefaults _idCaptureOverlayDefaults;
  static late CameraSettingsDefaults _cameraSettingsDefaults;

  static IdCaptureOverlayDefaults get idCaptureOverlayDefaults => _idCaptureOverlayDefaults;

  static CameraSettingsDefaults get cameraSettingsDefaults => _cameraSettingsDefaults;

  static Future<void> initializeDefaults() async {
    if (_isInitialized) return;
    var result = await channel.invokeMethod("getDefaults");
    var json = jsonDecode(result as String);

    _cameraSettingsDefaults = CameraSettingsDefaults.fromJSON(json["RecommendedCameraSettings"]);
    _idCaptureOverlayDefaults = IdCaptureOverlayDefaults.fromJSON(json["IdCaptureOverlay"]);

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
