/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/id_layout.dart';

import 'function_names.dart';
import '../id_anonymization_mode.dart';
import 'duration_extensions.dart';

// ignore: avoid_classes_with_only_static_members
class IdCaptureDefaults {
  static bool _isInitialized = false;
  static MethodChannel channel = const MethodChannel(IdCaptureFunctionNames.methodsChannelName);
  static late IdCaptureOverlayDefaults _idCaptureOverlayDefaults;
  static late CameraSettingsDefaults _cameraSettingsDefaults;
  static late IdCaptureSettingsDefaults _captureSettingsDefaults;
  static late IdCaptureFeedbackDefaults _idCaptureFeedbackDefaults;

  static IdCaptureOverlayDefaults get idCaptureOverlayDefaults => _idCaptureOverlayDefaults;

  static CameraSettingsDefaults get cameraSettingsDefaults => _cameraSettingsDefaults;

  static IdCaptureSettingsDefaults get captureSettingsDefaults => _captureSettingsDefaults;

  static IdCaptureFeedbackDefaults get idCaptureFeedbackDefaults => _idCaptureFeedbackDefaults;

  static Future<void> initializeDefaults() async {
    if (_isInitialized) return;
    var result = await channel.invokeMethod("getDefaults");
    var json = jsonDecode(result as String);

    _cameraSettingsDefaults = CameraSettingsDefaults.fromJSON(json["RecommendedCameraSettings"]);
    _idCaptureOverlayDefaults = IdCaptureOverlayDefaults.fromJSON(json["IdCaptureOverlay"]);
    _captureSettingsDefaults = IdCaptureSettingsDefaults.fromJSON(json["IdCaptureSettings"]);
    _idCaptureFeedbackDefaults = IdCaptureFeedbackDefaults.fromJSON(json);

    _isInitialized = true;
  }
}

class IdCaptureOverlayDefaults {
  final Brush defaultCapturedBrush;
  final Brush defaultLocalizedBrush;
  final Brush defaultRejectedBrush;
  final IdLayoutStyle idLayoutStyle;
  final IdLayoutLineStyle idLayoutLineStyle;

  IdCaptureOverlayDefaults(this.defaultCapturedBrush, this.defaultLocalizedBrush, this.defaultRejectedBrush,
      this.idLayoutStyle, this.idLayoutLineStyle);

  factory IdCaptureOverlayDefaults.fromJSON(Map<String, dynamic> json) {
    var defaultCapturedBrush = BrushDefaults.fromJSON(json["DefaultCapturedBrush"] as Map<String, dynamic>).toBrush();
    var defaultLocalizedBrush = BrushDefaults.fromJSON(json["DefaultLocalizedBrush"] as Map<String, dynamic>).toBrush();
    var defaultRejectedBrush = BrushDefaults.fromJSON(json["DefaultRejectedBrush"] as Map<String, dynamic>).toBrush();
    var idLayoutStyle = IdLayoutStyleDeserializer.fromJSON(json["defaultIdLayoutStyle"] as String);
    var idLayoutLineStyle = IdLayoutLineStyleDeserializer.fromJSON(json["defaultIdLayoutLineStyle"] as String);
    return IdCaptureOverlayDefaults(
        defaultCapturedBrush, defaultLocalizedBrush, defaultRejectedBrush, idLayoutStyle, idLayoutLineStyle);
  }
}

class IdCaptureSettingsDefaults {
  final IdAnonymizationMode anonymizationMode;
  final bool rejectVoidedIds;
  final bool? decodeBackOfEuropeanDrivingLicense;
  final bool rejectExpiredIds;
  final Duration? rejectIdsExpiringIn;
  final bool rejectNotRealIdCompliant;
  final bool rejectForgedAamvaBarcodes;
  final bool rejectInconsistentData;
  final int? rejectHolderBelowAge;

  IdCaptureSettingsDefaults(
      this.anonymizationMode,
      this.rejectVoidedIds,
      this.decodeBackOfEuropeanDrivingLicense,
      this.rejectExpiredIds,
      this.rejectIdsExpiringIn,
      this.rejectNotRealIdCompliant,
      this.rejectForgedAamvaBarcodes,
      this.rejectInconsistentData,
      this.rejectHolderBelowAge);

  factory IdCaptureSettingsDefaults.fromJSON(Map<String, dynamic> json) {
    var anonymizationMode = IdAnonymizationModeDeserializer.fromJSON(json["anonymizationMode"] as String);

    var rejectIdsExpiringInJson = json["rejectIdsExpiringIn"] as Map<String, dynamic>?;

    return IdCaptureSettingsDefaults(
      anonymizationMode,
      json["rejectVoidedIds"] as bool,
      json["decodeBackOfEuropeDrivingLicense"] as bool?,
      json["rejectExpiredIds"] as bool,
      rejectIdsExpiringInJson?.toDurationFrom(DateTime.now()),
      json["rejectNotRealIdCompliant"] as bool,
      json["rejectForgedAamvaBarcodes"] as bool,
      json["rejectInconsistentData"] as bool,
      json["rejectHolderBelowAge"] as int?,
    );
  }
}

class IdCaptureFeedbackDefaults {
  final Feedback idCaptured;
  final Feedback idRejected;
  final Sound defaultSuccessSound;
  final Sound defaultFailureSound;

  IdCaptureFeedbackDefaults(this.idCaptured, this.idRejected, this.defaultSuccessSound, this.defaultFailureSound);

  factory IdCaptureFeedbackDefaults.fromJSON(Map<String, dynamic> json) {
    final feedbackJson = jsonDecode(json["IdCaptureFeedback"] as String);
    final defaultSuccessSound = Sound.fromJSON(jsonDecode(json['defaultSuccessSound']));
    final defaultFailureSound = Sound.fromJSON(jsonDecode(json['defaultFailureSound']));

    return IdCaptureFeedbackDefaults(
      feedbackFromJson(feedbackJson, 'idCaptured'),
      feedbackFromJson(feedbackJson, 'idRejected'),
      defaultSuccessSound,
      defaultFailureSound,
    );
  }

  static Feedback feedbackFromJson(Map<String, dynamic> json, String key) {
    var feedbackJson = json[key];

    Sound? feedbackSound;
    Vibration? feedbackVibration;

    if (feedbackJson.containsKey('sound')) {
      var soundMap = feedbackJson['sound'] as Map;
      if (soundMap.isNotEmpty && soundMap.containsKey('resource')) {
        feedbackSound = Sound(soundMap['resource']);
      } else {
        feedbackSound = Sound(null);
      }
    }
    if (feedbackJson.containsKey('vibration')) {
      var vibrationMap = feedbackJson['vibration'] as Map;
      if (vibrationMap.isNotEmpty && vibrationMap.containsKey('type')) {
        var vibrationType = vibrationMap['type'];
        switch (vibrationType) {
          case 'selectionHaptic':
            feedbackVibration = Vibration.selectionHapticFeedback;
            break;
          case 'successHaptic':
            feedbackVibration = Vibration.successHapticFeedback;
            break;
          default:
            feedbackVibration = Vibration.defaultVibration;
        }
      } else {
        feedbackVibration = Vibration.defaultVibration;
      }
    }
    return Feedback(feedbackVibration, feedbackSound);
  }
}
