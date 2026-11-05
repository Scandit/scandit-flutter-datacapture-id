/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/logging/logging_method_channel.dart';
import 'package:scandit_flutter_datacapture_id/src/id_layout.dart';

import 'function_names.dart';
import '../id_anonymization_mode.dart';
import 'duration_extensions.dart';
import '../generated/id_generated_defaults.dart';

// Picks the platform-split value of a generated default. Kept private: a
// small per-package helper, mirroring core's, so this package doesn't need a
// cross-package dependency just for this.
T _platformDefault<T>({required T android, required T ios}) => Platform.isIOS ? ios : android;

// Builds a Brush from a generated flat {fillColor, strokeColor, strokeWidth}
// default literal - the shape the wrappers actually emit. A missing key means
// "unset", i.e. fully transparent / zero width - matching the native
// getDefaults() snapshot at
// scripts/defaults_generator/defaults/generated/expected_defaults_*.json.
Brush _buildStaticBrush(Map<String, Object?> json) {
  final fillColor = ColorDeserializer.fromRgbaHex(json['fillColor'] as String? ?? '#00000000');
  final strokeColor = ColorDeserializer.fromRgbaHex(json['strokeColor'] as String? ?? '#00000000');
  final strokeWidth = (json['strokeWidth'] as num?)?.toDouble() ?? 0.0;
  return Brush(fillColor, strokeColor, strokeWidth);
}

// Builds a Feedback from a generated {vibration, sound} default literal.
// Mirrors IdCaptureFeedbackDefaults.feedbackFromJson's null-tolerant
// semantics but - unlike that method - tolerates an explicit `null` value
// for a present key (e.g. IdCaptureFeedbackGeneratedDefaults.idRejected is
// {'vibration': null, 'sound': null}), which feedbackFromJson's
// unconditional `as Map` cast would crash on.
Feedback _buildStaticFeedback(Map<String, Object?> json) {
  final vibrationJson = json['vibration'] as Map<String, Object?>?;
  final soundJson = json['sound'] as Map<String, Object?>?;

  Vibration? vibration;
  if (vibrationJson != null) {
    switch (vibrationJson['type']) {
      case 'selectionHaptic':
        vibration = Vibration.selectionHapticFeedback;
        break;
      case 'successHaptic':
        vibration = Vibration.successHapticFeedback;
        break;
      default:
        vibration = Vibration.defaultVibration;
    }
  }

  Sound? sound;
  if (soundJson != null) {
    sound = soundJson.containsKey('resource') ? Sound(soundJson['resource'] as String?) : Sound(null);
  }

  return Feedback(vibration, sound);
}

IdCaptureOverlayDefaults _buildStaticIdCaptureOverlayDefaults() {
  return IdCaptureOverlayDefaults(
    _buildStaticBrush(IdCaptureOverlayGeneratedDefaults.DefaultCapturedBrush),
    // Fill alpha is platform-split: native white(0.5f) serializes as #FFFFFF80
    // on Android and #FFFFFF7F on iOS. See id.json for the full note.
    _buildStaticBrush(_platformDefault(
      android: IdCaptureOverlayGeneratedDefaults.DefaultLocalizedBrushAndroid,
      ios: IdCaptureOverlayGeneratedDefaults.DefaultLocalizedBrushIos,
    )),
    _buildStaticBrush(_platformDefault(
      android: IdCaptureOverlayGeneratedDefaults.DefaultRejectedBrushAndroid,
      ios: IdCaptureOverlayGeneratedDefaults.DefaultRejectedBrushIos,
    )),
    IdLayoutStyleDeserializer.fromJSON(IdCaptureOverlayGeneratedDefaults.defaultIdLayoutStyle),
    IdLayoutLineStyleDeserializer.fromJSON(IdCaptureOverlayGeneratedDefaults.defaultIdLayoutLineStyle),
  );
}

IdCaptureSettingsDefaults _buildStaticIdCaptureSettingsDefaults() {
  return IdCaptureSettingsDefaults(
    IdAnonymizationModeDeserializer.fromJSON(IdCaptureSettingsGeneratedDefaults.anonymizationMode),
    IdCaptureSettingsGeneratedDefaults.rejectVoidedIds,
    IdCaptureSettingsGeneratedDefaults.decodeBackOfEuropeanDrivingLicense,
    IdCaptureSettingsGeneratedDefaults.rejectExpiredIds,
    // rejectIdsExpiringIn: the generated const is Object? and always null (the
    // fromJSON path only ever builds a Duration relative to DateTime.now(), so
    // there is no meaningful static value). Passed as a literal null rather
    // than `const as Duration?` so a future non-null generated value has to be
    // wired deliberately instead of throwing a _CastError at class-init time.
    null,
    IdCaptureSettingsGeneratedDefaults.rejectNotRealIdCompliant,
    IdCaptureSettingsGeneratedDefaults.rejectForgedAamvaBarcodes,
    IdCaptureSettingsGeneratedDefaults.rejectInconsistentData,
    // Generated const is Object? and always null - see rejectIdsExpiringIn above.
    null,
    IdCaptureSettingsGeneratedDefaults.anonymizeDefaultFields,
    IdCaptureSettingsGeneratedDefaults.rejectionTimeoutSeconds,
  );
}

IdCaptureFeedbackDefaults _buildStaticIdCaptureFeedbackDefaults() {
  final idCaptured = _platformDefault(
    android: IdCaptureFeedbackGeneratedDefaults.idCapturedAndroid,
    ios: IdCaptureFeedbackGeneratedDefaults.idCapturedIos,
  );
  final defaultSuccessSound = _platformDefault(
    android: IdCaptureFeedbackGeneratedDefaults.defaultSuccessSoundAndroid,
    ios: IdCaptureFeedbackGeneratedDefaults.defaultSuccessSoundIos,
  );
  final defaultFailureSound = _platformDefault(
    android: IdCaptureFeedbackGeneratedDefaults.defaultFailureSoundAndroid,
    ios: IdCaptureFeedbackGeneratedDefaults.defaultFailureSoundIos,
  );

  return IdCaptureFeedbackDefaults(
    _buildStaticFeedback(idCaptured),
    _buildStaticFeedback(IdCaptureFeedbackGeneratedDefaults.idRejected),
    Sound.fromJSON(defaultSuccessSound),
    Sound.fromJSON(defaultFailureSound),
  );
}

// ignore: avoid_classes_with_only_static_members
class IdCaptureDefaults {
  static bool _isInitialized = false;
  static MethodChannel channel = const LoggingMethodChannel(IdCaptureFunctionNames.methodsChannelName);

  // Statically sourced from generated/id_generated_defaults.dart - byte
  // identical to the native getDefaults() response, available immediately,
  // no method-channel round trip needed. See SDC-32174.
  static final IdCaptureOverlayDefaults _idCaptureOverlayDefaults = _buildStaticIdCaptureOverlayDefaults();
  static final IdCaptureSettingsDefaults _captureSettingsDefaults = _buildStaticIdCaptureSettingsDefaults();
  static final IdCaptureFeedbackDefaults _idCaptureFeedbackDefaults = _buildStaticIdCaptureFeedbackDefaults();

  // RecommendedCameraSettings is intentionally NOT staticized: the shared
  // Android wrapper (CameraSettingsDefaults.kt) hardcodes focusRange/
  // macroMode/torchLevel while iOS reads the real compiled
  // recommendedCameraSettings object, so a static value here can't be proven
  // equal to what native emits. Stays fully dynamic.
  static late CameraSettingsDefaults _cameraSettingsDefaults;

  static IdCaptureOverlayDefaults get idCaptureOverlayDefaults => _idCaptureOverlayDefaults;

  static CameraSettingsDefaults get cameraSettingsDefaults => _cameraSettingsDefaults;

  static IdCaptureSettingsDefaults get captureSettingsDefaults => _captureSettingsDefaults;

  static IdCaptureFeedbackDefaults get idCaptureFeedbackDefaults => _idCaptureFeedbackDefaults;

  static Future<void> initializeDefaults() async {
    if (_isInitialized) return;
    // Narrow endpoint: only RecommendedCameraSettings, the single residual key
    // read below. It is the only defaults endpoint - the full-blob getDefaults
    // was removed in SDC-32178.
    var result = await channel.invokeMethod("getDynamicDefaults");
    var json = jsonDecode(result as String);

    _cameraSettingsDefaults = CameraSettingsDefaults.fromJSON(json["RecommendedCameraSettings"]);

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
  final bool anonymizeDefaultFields;
  final int rejectionTimeoutSeconds;

  IdCaptureSettingsDefaults(
      this.anonymizationMode,
      this.rejectVoidedIds,
      this.decodeBackOfEuropeanDrivingLicense,
      this.rejectExpiredIds,
      this.rejectIdsExpiringIn,
      this.rejectNotRealIdCompliant,
      this.rejectForgedAamvaBarcodes,
      this.rejectInconsistentData,
      this.rejectHolderBelowAge,
      this.anonymizeDefaultFields,
      this.rejectionTimeoutSeconds);

  factory IdCaptureSettingsDefaults.fromJSON(Map<String, dynamic> json) {
    var anonymizationMode = IdAnonymizationModeDeserializer.fromJSON(json["anonymizationMode"] as String);

    var rejectIdsExpiringInJson = json["rejectIdsExpiringIn"] as Map<String, dynamic>?;

    return IdCaptureSettingsDefaults(
      anonymizationMode,
      json["rejectVoidedIds"] as bool,
      json["decodeBackOfEuropeanDrivingLicense"] as bool?,
      json["rejectExpiredIds"] as bool,
      rejectIdsExpiringInJson?.toDurationFrom(DateTime.now()),
      json["rejectNotRealIdCompliant"] as bool,
      json["rejectForgedAamvaBarcodes"] as bool,
      json["rejectInconsistentData"] as bool,
      json["rejectHolderBelowAge"] as int?,
      json["anonymizeDefaultFields"] as bool,
      json["rejectionTimeoutSeconds"] as int,
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
