/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

// THIS FILE IS GENERATED. DO NOT EDIT MANUALLY.
// Generator: scripts/bridge_generator/generate.py
// Schema: scripts/bridge_generator/schemas/id.json
//
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// Wire-format names (schema property/enum-value strings, e.g.
// `number_of_mandatory_instances`, `royal_mail_4state`) are preserved
// verbatim as Dart identifiers for fidelity with the JSON payload; they are
// not renamed to lowerCamelCase.
//
// Typed classes + throwing fromJson/toJson derived from the serialization
// JSON schemas referenced by this module's bridge params. No runtime
// dependency: validation is hand-rolled below, not json_serializable/built_value.
//
// fromJson enforces only the JSON Schema keywords expressible without a
// schema engine: required, type, enum, string const, additionalProperties,
// null-ness, and root-level oneOf (dispatched on the discriminator to the
// matching variant's fromJson).
// NOT enforced -- a payload violating one of these still parses:
//   pattern, minimum/maximum, minLength/maxLength, multipleOf, and
//   property-level oneOf of more than one non-null variant (those
//   properties are typed Object? and left unvalidated).
//
// Each plain object class also gets a top-level `buildX` function: a
// shallow-typed, validation-free map builder for outbound (Dart -> native)
// payloads. It never parses or throws.
//
// THE BUILDER CONTRACT (stated once here; each buildX carries a one-line
// pointer back to it rather than repeating this block 300+ times).
//
// Outbound payloads are deliberately NOT runtime-validated. The generated
// `fromJson` enforces `additionalProperties: false`, so validating outbound
// would turn the next property added to a public model into a customer-facing
// throw. Compile-time named parameters give the shape guarantee instead.
//
// Emit rule -- "key absent" and "key present and null" are DIFFERENT
// instructions to the deserializers, so the builder reproduces exactly what
// the caller asked for and nothing more:
//   - required                -> always written (omitting it would make
//                                `fromJson` throw "missing required property").
//   - optional, non-nullable  -> omitted when null; null means "not set".
//   - optional + nullable     -> written IF AND ONLY IF the caller passed it,
//                                including when what they passed was null.
//
// That last case is why those parameters are typed `Object?` with an `_unset`
// default instead of their schema type: Dart cannot otherwise tell "passed
// null" from "not passed", and the difference is load-bearing. The schema
// declares null a valid value for these (core/data_capture_view.json documents
// `focusGesture` as "Set to null to disable", and the C++ side branches on
// `containsNull` before falling back to the current value for an absent key),
// so writing the key when the caller stayed silent is just as wrong as
// dropping one they set. A blanket "always write" did exactly that and
// disabled every Android DataCaptureView by adding `parentId: null`, which
// `DataCaptureViewCreationData.kt` reads with `has()` + `getInt()`.
//
// Consequence worth knowing: the generated class's own `toJson()` omits an
// optional+nullable key when null, while `buildX` preserves the caller's
// explicit null. The asymmetry is intended -- `toJson` round-trips a parsed
// object (inbound), `buildX` expresses a caller's intent (outbound) -- so
// `fromJson(buildX(k: null)).toJson()` drops `k`.
//
// Nested `$ref`/array-of-`$ref` properties are typed shallowly
// (`Object?`/`List<Object?>`, not the generated nested class): those classes
// duplicate the hand-written public models (e.g. Brush, Color, Viewfinder)
// that callers already hold an already-serialized map for, so the builder
// accepts that map directly instead of requiring the generated type.

/// Marker for "this optional+nullable argument was not passed", so a builder
/// can tell that apart from an explicit `null`. See the emit rule above.
class _Unset {
  const _Unset();
}

const Object _unset = _Unset();

/// The ID capture mode.
class IdCapture {
  final String type;
  final IdCaptureSettings? settings;
  final bool? enabled;
  final IdCaptureFeedback? feedback;
  final String? externalTransactionId;
  final int? modeId;
  final int? parentId;
  final bool? hasListeners;

  const IdCapture({
    required this.type,
    this.settings,
    this.enabled,
    this.feedback,
    this.externalTransactionId,
    this.modeId,
    this.parentId,
    this.hasListeners,
  });

  factory IdCapture.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('IdCapture: expected a Map');
    }
    const allowedKeys = <String>{
      'type',
      'settings',
      'enabled',
      'feedback',
      'externalTransactionId',
      'modeId',
      'parentId',
      'hasListeners',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("IdCapture: unknown property '$key'");
      }
    }
    final hasType = raw.containsKey('type');
    if (!hasType) {
      throw FormatException("IdCapture.type: missing required property");
    }
    final typeRaw = raw['type'];
    String? typeValue;
    if (hasType && typeRaw != null) {
      if (typeRaw is! String || !const <String>['idCapture'].contains(typeRaw)) {
        throw FormatException("IdCapture.type: unknown enum value '$typeRaw'");
      }
      typeValue = typeRaw;
    } else if (hasType && typeRaw == null) {
      throw FormatException('IdCapture.type: null is not allowed');
    }
    final hasSettings = raw.containsKey('settings');
    final settingsRaw = raw['settings'];
    IdCaptureSettings? settingsValue;
    if (hasSettings && settingsRaw != null) {
      settingsValue = IdCaptureSettings.fromJson(settingsRaw);
    } else if (hasSettings && settingsRaw == null) {
      throw FormatException('IdCapture.settings: null is not allowed');
    }
    final hasEnabled = raw.containsKey('enabled');
    final enabledRaw = raw['enabled'];
    bool? enabledValue;
    if (hasEnabled && enabledRaw != null) {
      if (enabledRaw is! bool) {
        throw FormatException('IdCapture.enabled: expected a bool');
      }
      enabledValue = enabledRaw;
    } else if (hasEnabled && enabledRaw == null) {
      throw FormatException('IdCapture.enabled: null is not allowed');
    }
    final hasFeedback = raw.containsKey('feedback');
    final feedbackRaw = raw['feedback'];
    IdCaptureFeedback? feedbackValue;
    if (hasFeedback && feedbackRaw != null) {
      feedbackValue = IdCaptureFeedback.fromJson(feedbackRaw);
    } else if (hasFeedback && feedbackRaw == null) {
      throw FormatException('IdCapture.feedback: null is not allowed');
    }
    final hasExternalTransactionId = raw.containsKey('externalTransactionId');
    final externalTransactionIdRaw = raw['externalTransactionId'];
    String? externalTransactionIdValue;
    if (hasExternalTransactionId && externalTransactionIdRaw != null) {
      if (externalTransactionIdRaw is! String) {
        throw FormatException('IdCapture.externalTransactionId: expected a String');
      }
      externalTransactionIdValue = externalTransactionIdRaw;
    }
    final hasModeId = raw.containsKey('modeId');
    final modeIdRaw = raw['modeId'];
    int? modeIdValue;
    if (hasModeId && modeIdRaw != null) {
      if (modeIdRaw is! num) {
        throw FormatException('IdCapture.modeId: expected a number');
      }
      if (modeIdRaw != modeIdRaw.toInt()) {
        throw FormatException('IdCapture.modeId: expected an integer');
      }
      modeIdValue = modeIdRaw.toInt();
    } else if (hasModeId && modeIdRaw == null) {
      throw FormatException('IdCapture.modeId: null is not allowed');
    }
    final hasParentId = raw.containsKey('parentId');
    final parentIdRaw = raw['parentId'];
    int? parentIdValue;
    if (hasParentId && parentIdRaw != null) {
      if (parentIdRaw is! num) {
        throw FormatException('IdCapture.parentId: expected a number');
      }
      if (parentIdRaw != parentIdRaw.toInt()) {
        throw FormatException('IdCapture.parentId: expected an integer');
      }
      parentIdValue = parentIdRaw.toInt();
    }
    final hasHasListeners = raw.containsKey('hasListeners');
    final hasListenersRaw = raw['hasListeners'];
    bool? hasListenersValue;
    if (hasHasListeners && hasListenersRaw != null) {
      if (hasListenersRaw is! bool) {
        throw FormatException('IdCapture.hasListeners: expected a bool');
      }
      hasListenersValue = hasListenersRaw;
    } else if (hasHasListeners && hasListenersRaw == null) {
      throw FormatException('IdCapture.hasListeners: null is not allowed');
    }
    return IdCapture(
      type: typeValue!,
      settings: settingsValue,
      enabled: enabledValue,
      feedback: feedbackValue,
      externalTransactionId: externalTransactionIdValue,
      modeId: modeIdValue,
      parentId: parentIdValue,
      hasListeners: hasListenersValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['type'] = type;
    if (settings != null) {
      map['settings'] = settings!.toJson();
    }
    if (enabled != null) {
      map['enabled'] = enabled;
    }
    if (feedback != null) {
      map['feedback'] = feedback!.toJson();
    }
    if (externalTransactionId != null) {
      map['externalTransactionId'] = externalTransactionId;
    }
    if (modeId != null) {
      map['modeId'] = modeId;
    }
    if (parentId != null) {
      map['parentId'] = parentId;
    }
    if (hasListeners != null) {
      map['hasListeners'] = hasListeners;
    }
    return map;
  }
}

/// Typed builder for the `IdCapture` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildIdCapture({
  required String type,
  Object? settings,
  bool? enabled,
  Object? feedback,
  Object? externalTransactionId = _unset,
  int? modeId,
  Object? parentId = _unset,
  bool? hasListeners,
}) {
  final map = <String, Object?>{};
  map['type'] = type;
  if (settings != null) {
    map['settings'] = settings;
  }
  if (enabled != null) {
    map['enabled'] = enabled;
  }
  if (feedback != null) {
    map['feedback'] = feedback;
  }
  if (!identical(externalTransactionId, _unset)) {
    map['externalTransactionId'] = externalTransactionId;
  }
  if (modeId != null) {
    map['modeId'] = modeId;
  }
  if (!identical(parentId, _unset)) {
    map['parentId'] = parentId;
  }
  if (hasListeners != null) {
    map['hasListeners'] = hasListeners;
  }
  return map;
}

/// Settings for the ID capture mode.
class IdCaptureSettings {
  final ImageToResultSettings? imageToResult;
  final String? anonymizationMode;
  final bool? rejectVoidedIds;
  final bool? rejectExpiredIds;
  final bool? rejectForgedAamvaBarcodes;
  final bool? rejectNotRealIdCompliant;
  final bool? rejectInconsistentData;
  final int? rejectHolderBelowAge;
  final List<String>? rejectPassportTypes;
  final Duration? rejectIdsExpiringIn;
  final bool? decodeBackOfEuropeanDrivingLicense;
  final List<Document>? acceptedDocuments;
  final List<Document>? rejectedDocuments;
  final bool? notifyOnSideCapture;
  final ScannerType? scanner;
  final int? rejectionTimeoutSeconds;
  final String? captureTrigger;
  final Object? anonymizationMap;
  final bool? anonymizeDefaultFields;

  const IdCaptureSettings({
    this.imageToResult,
    this.anonymizationMode,
    this.rejectVoidedIds,
    this.rejectExpiredIds,
    this.rejectForgedAamvaBarcodes,
    this.rejectNotRealIdCompliant,
    this.rejectInconsistentData,
    this.rejectHolderBelowAge,
    this.rejectPassportTypes,
    this.rejectIdsExpiringIn,
    this.decodeBackOfEuropeanDrivingLicense,
    this.acceptedDocuments,
    this.rejectedDocuments,
    this.notifyOnSideCapture,
    this.scanner,
    this.rejectionTimeoutSeconds,
    this.captureTrigger,
    this.anonymizationMap,
    this.anonymizeDefaultFields,
  });

  factory IdCaptureSettings.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('IdCaptureSettings: expected a Map');
    }
    const allowedKeys = <String>{
      'licenseKey',
      'licensee',
      'imageToResult',
      'anonymizationMode',
      'rejectVoidedIds',
      'rejectExpiredIds',
      'rejectForgedAamvaBarcodes',
      'rejectNotRealIdCompliant',
      'rejectInconsistentData',
      'rejectHolderBelowAge',
      'rejectPassportTypes',
      'rejectIdsExpiringIn',
      'decodeBackOfEuropeanDrivingLicense',
      'acceptedDocuments',
      'rejectedDocuments',
      'notifyOnSideCapture',
      'scanner',
      'rejectionTimeoutSeconds',
      'captureTrigger',
      'anonymizationMap',
      'anonymizeDefaultFields',
      'properties',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("IdCaptureSettings: unknown property '$key'");
      }
    }
    final hasImageToResult = raw.containsKey('imageToResult');
    final imageToResultRaw = raw['imageToResult'];
    ImageToResultSettings? imageToResultValue;
    if (hasImageToResult && imageToResultRaw != null) {
      imageToResultValue = ImageToResultSettings.fromJson(imageToResultRaw);
    } else if (hasImageToResult && imageToResultRaw == null) {
      throw FormatException('IdCaptureSettings.imageToResult: null is not allowed');
    }
    final hasAnonymizationMode = raw.containsKey('anonymizationMode');
    final anonymizationModeRaw = raw['anonymizationMode'];
    String? anonymizationModeValue;
    if (hasAnonymizationMode && anonymizationModeRaw != null) {
      if (anonymizationModeRaw is! String ||
          !const <String>['none', 'fieldsOnly', 'imagesOnly', 'fieldsAndImages'].contains(anonymizationModeRaw)) {
        throw FormatException("IdCaptureSettings.anonymizationMode: unknown enum value '$anonymizationModeRaw'");
      }
      anonymizationModeValue = anonymizationModeRaw;
    } else if (hasAnonymizationMode && anonymizationModeRaw == null) {
      throw FormatException('IdCaptureSettings.anonymizationMode: null is not allowed');
    }
    final hasRejectVoidedIds = raw.containsKey('rejectVoidedIds');
    final rejectVoidedIdsRaw = raw['rejectVoidedIds'];
    bool? rejectVoidedIdsValue;
    if (hasRejectVoidedIds && rejectVoidedIdsRaw != null) {
      if (rejectVoidedIdsRaw is! bool) {
        throw FormatException('IdCaptureSettings.rejectVoidedIds: expected a bool');
      }
      rejectVoidedIdsValue = rejectVoidedIdsRaw;
    } else if (hasRejectVoidedIds && rejectVoidedIdsRaw == null) {
      throw FormatException('IdCaptureSettings.rejectVoidedIds: null is not allowed');
    }
    final hasRejectExpiredIds = raw.containsKey('rejectExpiredIds');
    final rejectExpiredIdsRaw = raw['rejectExpiredIds'];
    bool? rejectExpiredIdsValue;
    if (hasRejectExpiredIds && rejectExpiredIdsRaw != null) {
      if (rejectExpiredIdsRaw is! bool) {
        throw FormatException('IdCaptureSettings.rejectExpiredIds: expected a bool');
      }
      rejectExpiredIdsValue = rejectExpiredIdsRaw;
    } else if (hasRejectExpiredIds && rejectExpiredIdsRaw == null) {
      throw FormatException('IdCaptureSettings.rejectExpiredIds: null is not allowed');
    }
    final hasRejectForgedAamvaBarcodes = raw.containsKey('rejectForgedAamvaBarcodes');
    final rejectForgedAamvaBarcodesRaw = raw['rejectForgedAamvaBarcodes'];
    bool? rejectForgedAamvaBarcodesValue;
    if (hasRejectForgedAamvaBarcodes && rejectForgedAamvaBarcodesRaw != null) {
      if (rejectForgedAamvaBarcodesRaw is! bool) {
        throw FormatException('IdCaptureSettings.rejectForgedAamvaBarcodes: expected a bool');
      }
      rejectForgedAamvaBarcodesValue = rejectForgedAamvaBarcodesRaw;
    } else if (hasRejectForgedAamvaBarcodes && rejectForgedAamvaBarcodesRaw == null) {
      throw FormatException('IdCaptureSettings.rejectForgedAamvaBarcodes: null is not allowed');
    }
    final hasRejectNotRealIdCompliant = raw.containsKey('rejectNotRealIdCompliant');
    final rejectNotRealIdCompliantRaw = raw['rejectNotRealIdCompliant'];
    bool? rejectNotRealIdCompliantValue;
    if (hasRejectNotRealIdCompliant && rejectNotRealIdCompliantRaw != null) {
      if (rejectNotRealIdCompliantRaw is! bool) {
        throw FormatException('IdCaptureSettings.rejectNotRealIdCompliant: expected a bool');
      }
      rejectNotRealIdCompliantValue = rejectNotRealIdCompliantRaw;
    } else if (hasRejectNotRealIdCompliant && rejectNotRealIdCompliantRaw == null) {
      throw FormatException('IdCaptureSettings.rejectNotRealIdCompliant: null is not allowed');
    }
    final hasRejectInconsistentData = raw.containsKey('rejectInconsistentData');
    final rejectInconsistentDataRaw = raw['rejectInconsistentData'];
    bool? rejectInconsistentDataValue;
    if (hasRejectInconsistentData && rejectInconsistentDataRaw != null) {
      if (rejectInconsistentDataRaw is! bool) {
        throw FormatException('IdCaptureSettings.rejectInconsistentData: expected a bool');
      }
      rejectInconsistentDataValue = rejectInconsistentDataRaw;
    } else if (hasRejectInconsistentData && rejectInconsistentDataRaw == null) {
      throw FormatException('IdCaptureSettings.rejectInconsistentData: null is not allowed');
    }
    final hasRejectHolderBelowAge = raw.containsKey('rejectHolderBelowAge');
    final rejectHolderBelowAgeRaw = raw['rejectHolderBelowAge'];
    int? rejectHolderBelowAgeValue;
    if (hasRejectHolderBelowAge && rejectHolderBelowAgeRaw != null) {
      if (rejectHolderBelowAgeRaw is! num) {
        throw FormatException('IdCaptureSettings.rejectHolderBelowAge: expected a number');
      }
      if (rejectHolderBelowAgeRaw != rejectHolderBelowAgeRaw.toInt()) {
        throw FormatException('IdCaptureSettings.rejectHolderBelowAge: expected an integer');
      }
      rejectHolderBelowAgeValue = rejectHolderBelowAgeRaw.toInt();
    }
    final hasRejectPassportTypes = raw.containsKey('rejectPassportTypes');
    final rejectPassportTypesRaw = raw['rejectPassportTypes'];
    List<String>? rejectPassportTypesValue;
    if (hasRejectPassportTypes && rejectPassportTypesRaw != null) {
      if (rejectPassportTypesRaw is! List) {
        throw FormatException('IdCaptureSettings.rejectPassportTypes: expected a List');
      }
      for (final item in rejectPassportTypesRaw) {
        if (item is! String ||
            !const <String>[
              'national',
              'emergency',
              'diplomatic',
              'official',
              'refugee',
              'alien',
              'stateless',
              'laissezPasser',
              'military',
              'seafarer',
              'emergencyTravelDocument',
              'unknown'
            ].contains(item)) {
          throw FormatException("IdCaptureSettings.rejectPassportTypes: unknown enum value '$item'");
        }
      }
      rejectPassportTypesValue = rejectPassportTypesRaw.cast<String>();
    } else if (hasRejectPassportTypes && rejectPassportTypesRaw == null) {
      throw FormatException('IdCaptureSettings.rejectPassportTypes: null is not allowed');
    }
    final hasRejectIdsExpiringIn = raw.containsKey('rejectIdsExpiringIn');
    final rejectIdsExpiringInRaw = raw['rejectIdsExpiringIn'];
    Duration? rejectIdsExpiringInValue;
    if (hasRejectIdsExpiringIn && rejectIdsExpiringInRaw != null) {
      rejectIdsExpiringInValue = Duration.fromJson(rejectIdsExpiringInRaw);
    }
    final hasDecodeBackOfEuropeanDrivingLicense = raw.containsKey('decodeBackOfEuropeanDrivingLicense');
    final decodeBackOfEuropeanDrivingLicenseRaw = raw['decodeBackOfEuropeanDrivingLicense'];
    bool? decodeBackOfEuropeanDrivingLicenseValue;
    if (hasDecodeBackOfEuropeanDrivingLicense && decodeBackOfEuropeanDrivingLicenseRaw != null) {
      if (decodeBackOfEuropeanDrivingLicenseRaw is! bool) {
        throw FormatException('IdCaptureSettings.decodeBackOfEuropeanDrivingLicense: expected a bool');
      }
      decodeBackOfEuropeanDrivingLicenseValue = decodeBackOfEuropeanDrivingLicenseRaw;
    } else if (hasDecodeBackOfEuropeanDrivingLicense && decodeBackOfEuropeanDrivingLicenseRaw == null) {
      throw FormatException('IdCaptureSettings.decodeBackOfEuropeanDrivingLicense: null is not allowed');
    }
    final hasAcceptedDocuments = raw.containsKey('acceptedDocuments');
    final acceptedDocumentsRaw = raw['acceptedDocuments'];
    List<Document>? acceptedDocumentsValue;
    if (hasAcceptedDocuments && acceptedDocumentsRaw != null) {
      if (acceptedDocumentsRaw is! List) {
        throw FormatException('IdCaptureSettings.acceptedDocuments: expected a List');
      }
      acceptedDocumentsValue = acceptedDocumentsRaw.map((item) => Document.fromJson(item)).toList();
    } else if (hasAcceptedDocuments && acceptedDocumentsRaw == null) {
      throw FormatException('IdCaptureSettings.acceptedDocuments: null is not allowed');
    }
    final hasRejectedDocuments = raw.containsKey('rejectedDocuments');
    final rejectedDocumentsRaw = raw['rejectedDocuments'];
    List<Document>? rejectedDocumentsValue;
    if (hasRejectedDocuments && rejectedDocumentsRaw != null) {
      if (rejectedDocumentsRaw is! List) {
        throw FormatException('IdCaptureSettings.rejectedDocuments: expected a List');
      }
      rejectedDocumentsValue = rejectedDocumentsRaw.map((item) => Document.fromJson(item)).toList();
    } else if (hasRejectedDocuments && rejectedDocumentsRaw == null) {
      throw FormatException('IdCaptureSettings.rejectedDocuments: null is not allowed');
    }
    final hasNotifyOnSideCapture = raw.containsKey('notifyOnSideCapture');
    final notifyOnSideCaptureRaw = raw['notifyOnSideCapture'];
    bool? notifyOnSideCaptureValue;
    if (hasNotifyOnSideCapture && notifyOnSideCaptureRaw != null) {
      if (notifyOnSideCaptureRaw is! bool) {
        throw FormatException('IdCaptureSettings.notifyOnSideCapture: expected a bool');
      }
      notifyOnSideCaptureValue = notifyOnSideCaptureRaw;
    } else if (hasNotifyOnSideCapture && notifyOnSideCaptureRaw == null) {
      throw FormatException('IdCaptureSettings.notifyOnSideCapture: null is not allowed');
    }
    final hasScanner = raw.containsKey('scanner');
    final scannerRaw = raw['scanner'];
    ScannerType? scannerValue;
    if (hasScanner && scannerRaw != null) {
      scannerValue = ScannerType.fromJson(scannerRaw);
    } else if (hasScanner && scannerRaw == null) {
      throw FormatException('IdCaptureSettings.scanner: null is not allowed');
    }
    final hasRejectionTimeoutSeconds = raw.containsKey('rejectionTimeoutSeconds');
    final rejectionTimeoutSecondsRaw = raw['rejectionTimeoutSeconds'];
    int? rejectionTimeoutSecondsValue;
    if (hasRejectionTimeoutSeconds && rejectionTimeoutSecondsRaw != null) {
      if (rejectionTimeoutSecondsRaw is! num) {
        throw FormatException('IdCaptureSettings.rejectionTimeoutSeconds: expected a number');
      }
      if (rejectionTimeoutSecondsRaw != rejectionTimeoutSecondsRaw.toInt()) {
        throw FormatException('IdCaptureSettings.rejectionTimeoutSeconds: expected an integer');
      }
      rejectionTimeoutSecondsValue = rejectionTimeoutSecondsRaw.toInt();
    } else if (hasRejectionTimeoutSeconds && rejectionTimeoutSecondsRaw == null) {
      throw FormatException('IdCaptureSettings.rejectionTimeoutSeconds: null is not allowed');
    }
    final hasCaptureTrigger = raw.containsKey('captureTrigger');
    final captureTriggerRaw = raw['captureTrigger'];
    String? captureTriggerValue;
    if (hasCaptureTrigger && captureTriggerRaw != null) {
      if (captureTriggerRaw is! String || !const <String>['auto', 'buttonTap'].contains(captureTriggerRaw)) {
        throw FormatException("IdCaptureSettings.captureTrigger: unknown enum value '$captureTriggerRaw'");
      }
      captureTriggerValue = captureTriggerRaw;
    } else if (hasCaptureTrigger && captureTriggerRaw == null) {
      throw FormatException('IdCaptureSettings.captureTrigger: null is not allowed');
    }
    final hasAnonymizationMap = raw.containsKey('anonymizationMap');
    final anonymizationMapRaw = raw['anonymizationMap'];
    Object? anonymizationMapValue;
    if (hasAnonymizationMap && anonymizationMapRaw != null) {
      anonymizationMapValue = anonymizationMapRaw;
    } else if (hasAnonymizationMap && anonymizationMapRaw == null) {
      throw FormatException('IdCaptureSettings.anonymizationMap: null is not allowed');
    }
    final hasAnonymizeDefaultFields = raw.containsKey('anonymizeDefaultFields');
    final anonymizeDefaultFieldsRaw = raw['anonymizeDefaultFields'];
    bool? anonymizeDefaultFieldsValue;
    if (hasAnonymizeDefaultFields && anonymizeDefaultFieldsRaw != null) {
      if (anonymizeDefaultFieldsRaw is! bool) {
        throw FormatException('IdCaptureSettings.anonymizeDefaultFields: expected a bool');
      }
      anonymizeDefaultFieldsValue = anonymizeDefaultFieldsRaw;
    } else if (hasAnonymizeDefaultFields && anonymizeDefaultFieldsRaw == null) {
      throw FormatException('IdCaptureSettings.anonymizeDefaultFields: null is not allowed');
    }
    return IdCaptureSettings(
      imageToResult: imageToResultValue,
      anonymizationMode: anonymizationModeValue,
      rejectVoidedIds: rejectVoidedIdsValue,
      rejectExpiredIds: rejectExpiredIdsValue,
      rejectForgedAamvaBarcodes: rejectForgedAamvaBarcodesValue,
      rejectNotRealIdCompliant: rejectNotRealIdCompliantValue,
      rejectInconsistentData: rejectInconsistentDataValue,
      rejectHolderBelowAge: rejectHolderBelowAgeValue,
      rejectPassportTypes: rejectPassportTypesValue,
      rejectIdsExpiringIn: rejectIdsExpiringInValue,
      decodeBackOfEuropeanDrivingLicense: decodeBackOfEuropeanDrivingLicenseValue,
      acceptedDocuments: acceptedDocumentsValue,
      rejectedDocuments: rejectedDocumentsValue,
      notifyOnSideCapture: notifyOnSideCaptureValue,
      scanner: scannerValue,
      rejectionTimeoutSeconds: rejectionTimeoutSecondsValue,
      captureTrigger: captureTriggerValue,
      anonymizationMap: anonymizationMapValue,
      anonymizeDefaultFields: anonymizeDefaultFieldsValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (imageToResult != null) {
      map['imageToResult'] = imageToResult!.toJson();
    }
    if (anonymizationMode != null) {
      map['anonymizationMode'] = anonymizationMode;
    }
    if (rejectVoidedIds != null) {
      map['rejectVoidedIds'] = rejectVoidedIds;
    }
    if (rejectExpiredIds != null) {
      map['rejectExpiredIds'] = rejectExpiredIds;
    }
    if (rejectForgedAamvaBarcodes != null) {
      map['rejectForgedAamvaBarcodes'] = rejectForgedAamvaBarcodes;
    }
    if (rejectNotRealIdCompliant != null) {
      map['rejectNotRealIdCompliant'] = rejectNotRealIdCompliant;
    }
    if (rejectInconsistentData != null) {
      map['rejectInconsistentData'] = rejectInconsistentData;
    }
    if (rejectHolderBelowAge != null) {
      map['rejectHolderBelowAge'] = rejectHolderBelowAge;
    }
    if (rejectPassportTypes != null) {
      map['rejectPassportTypes'] = rejectPassportTypes;
    }
    if (rejectIdsExpiringIn != null) {
      map['rejectIdsExpiringIn'] = rejectIdsExpiringIn!.toJson();
    }
    if (decodeBackOfEuropeanDrivingLicense != null) {
      map['decodeBackOfEuropeanDrivingLicense'] = decodeBackOfEuropeanDrivingLicense;
    }
    if (acceptedDocuments != null) {
      map['acceptedDocuments'] = acceptedDocuments!.map((item) => item.toJson()).toList();
    }
    if (rejectedDocuments != null) {
      map['rejectedDocuments'] = rejectedDocuments!.map((item) => item.toJson()).toList();
    }
    if (notifyOnSideCapture != null) {
      map['notifyOnSideCapture'] = notifyOnSideCapture;
    }
    if (scanner != null) {
      map['scanner'] = scanner!.toJson();
    }
    if (rejectionTimeoutSeconds != null) {
      map['rejectionTimeoutSeconds'] = rejectionTimeoutSeconds;
    }
    if (captureTrigger != null) {
      map['captureTrigger'] = captureTrigger;
    }
    if (anonymizationMap != null) {
      map['anonymizationMap'] = anonymizationMap;
    }
    if (anonymizeDefaultFields != null) {
      map['anonymizeDefaultFields'] = anonymizeDefaultFields;
    }
    return map;
  }
}

/// Typed builder for the `IdCaptureSettings` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildIdCaptureSettings({
  Object? imageToResult,
  String? anonymizationMode,
  bool? rejectVoidedIds,
  bool? rejectExpiredIds,
  bool? rejectForgedAamvaBarcodes,
  bool? rejectNotRealIdCompliant,
  bool? rejectInconsistentData,
  Object? rejectHolderBelowAge = _unset,
  List<String>? rejectPassportTypes,
  Object? rejectIdsExpiringIn = _unset,
  bool? decodeBackOfEuropeanDrivingLicense,
  List<Object?>? acceptedDocuments,
  List<Object?>? rejectedDocuments,
  bool? notifyOnSideCapture,
  Object? scanner,
  int? rejectionTimeoutSeconds,
  String? captureTrigger,
  Object? anonymizationMap,
  bool? anonymizeDefaultFields,
}) {
  final map = <String, Object?>{};
  if (imageToResult != null) {
    map['imageToResult'] = imageToResult;
  }
  if (anonymizationMode != null) {
    map['anonymizationMode'] = anonymizationMode;
  }
  if (rejectVoidedIds != null) {
    map['rejectVoidedIds'] = rejectVoidedIds;
  }
  if (rejectExpiredIds != null) {
    map['rejectExpiredIds'] = rejectExpiredIds;
  }
  if (rejectForgedAamvaBarcodes != null) {
    map['rejectForgedAamvaBarcodes'] = rejectForgedAamvaBarcodes;
  }
  if (rejectNotRealIdCompliant != null) {
    map['rejectNotRealIdCompliant'] = rejectNotRealIdCompliant;
  }
  if (rejectInconsistentData != null) {
    map['rejectInconsistentData'] = rejectInconsistentData;
  }
  if (!identical(rejectHolderBelowAge, _unset)) {
    map['rejectHolderBelowAge'] = rejectHolderBelowAge;
  }
  if (rejectPassportTypes != null) {
    map['rejectPassportTypes'] = rejectPassportTypes;
  }
  if (!identical(rejectIdsExpiringIn, _unset)) {
    map['rejectIdsExpiringIn'] = rejectIdsExpiringIn;
  }
  if (decodeBackOfEuropeanDrivingLicense != null) {
    map['decodeBackOfEuropeanDrivingLicense'] = decodeBackOfEuropeanDrivingLicense;
  }
  if (acceptedDocuments != null) {
    map['acceptedDocuments'] = acceptedDocuments;
  }
  if (rejectedDocuments != null) {
    map['rejectedDocuments'] = rejectedDocuments;
  }
  if (notifyOnSideCapture != null) {
    map['notifyOnSideCapture'] = notifyOnSideCapture;
  }
  if (scanner != null) {
    map['scanner'] = scanner;
  }
  if (rejectionTimeoutSeconds != null) {
    map['rejectionTimeoutSeconds'] = rejectionTimeoutSeconds;
  }
  if (captureTrigger != null) {
    map['captureTrigger'] = captureTrigger;
  }
  if (anonymizationMap != null) {
    map['anonymizationMap'] = anonymizationMap;
  }
  if (anonymizeDefaultFields != null) {
    map['anonymizeDefaultFields'] = anonymizeDefaultFields;
  }
  return map;
}

/// Settings controlling which images are included in the captured ID result.
class ImageToResultSettings {
  final bool? face;
  final bool? croppedDocument;
  final bool? frame;

  const ImageToResultSettings({
    this.face,
    this.croppedDocument,
    this.frame,
  });

  factory ImageToResultSettings.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('ImageToResultSettings: expected a Map');
    }
    const allowedKeys = <String>{
      'face',
      'croppedDocument',
      'frame',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("ImageToResultSettings: unknown property '$key'");
      }
    }
    final hasFace = raw.containsKey('face');
    final faceRaw = raw['face'];
    bool? faceValue;
    if (hasFace && faceRaw != null) {
      if (faceRaw is! bool) {
        throw FormatException('ImageToResultSettings.face: expected a bool');
      }
      faceValue = faceRaw;
    } else if (hasFace && faceRaw == null) {
      throw FormatException('ImageToResultSettings.face: null is not allowed');
    }
    final hasCroppedDocument = raw.containsKey('croppedDocument');
    final croppedDocumentRaw = raw['croppedDocument'];
    bool? croppedDocumentValue;
    if (hasCroppedDocument && croppedDocumentRaw != null) {
      if (croppedDocumentRaw is! bool) {
        throw FormatException('ImageToResultSettings.croppedDocument: expected a bool');
      }
      croppedDocumentValue = croppedDocumentRaw;
    } else if (hasCroppedDocument && croppedDocumentRaw == null) {
      throw FormatException('ImageToResultSettings.croppedDocument: null is not allowed');
    }
    final hasFrame = raw.containsKey('frame');
    final frameRaw = raw['frame'];
    bool? frameValue;
    if (hasFrame && frameRaw != null) {
      if (frameRaw is! bool) {
        throw FormatException('ImageToResultSettings.frame: expected a bool');
      }
      frameValue = frameRaw;
    } else if (hasFrame && frameRaw == null) {
      throw FormatException('ImageToResultSettings.frame: null is not allowed');
    }
    return ImageToResultSettings(
      face: faceValue,
      croppedDocument: croppedDocumentValue,
      frame: frameValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (face != null) {
      map['face'] = face;
    }
    if (croppedDocument != null) {
      map['croppedDocument'] = croppedDocument;
    }
    if (frame != null) {
      map['frame'] = frame;
    }
    return map;
  }
}

/// Typed builder for the `ImageToResultSettings` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildImageToResultSettings({
  bool? face,
  bool? croppedDocument,
  bool? frame,
}) {
  final map = <String, Object?>{};
  if (face != null) {
    map['face'] = face;
  }
  if (croppedDocument != null) {
    map['croppedDocument'] = croppedDocument;
  }
  if (frame != null) {
    map['frame'] = frame;
  }
  return map;
}

/// A duration expressed in days, months, and years.
class Duration {
  final int? days;
  final int? months;
  final int? years;

  const Duration({
    this.days,
    this.months,
    this.years,
  });

  factory Duration.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Duration: expected a Map');
    }
    const allowedKeys = <String>{
      'days',
      'months',
      'years',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Duration: unknown property '$key'");
      }
    }
    final hasDays = raw.containsKey('days');
    final daysRaw = raw['days'];
    int? daysValue;
    if (hasDays && daysRaw != null) {
      if (daysRaw is! num) {
        throw FormatException('Duration.days: expected a number');
      }
      if (daysRaw != daysRaw.toInt()) {
        throw FormatException('Duration.days: expected an integer');
      }
      daysValue = daysRaw.toInt();
    } else if (hasDays && daysRaw == null) {
      throw FormatException('Duration.days: null is not allowed');
    }
    final hasMonths = raw.containsKey('months');
    final monthsRaw = raw['months'];
    int? monthsValue;
    if (hasMonths && monthsRaw != null) {
      if (monthsRaw is! num) {
        throw FormatException('Duration.months: expected a number');
      }
      if (monthsRaw != monthsRaw.toInt()) {
        throw FormatException('Duration.months: expected an integer');
      }
      monthsValue = monthsRaw.toInt();
    } else if (hasMonths && monthsRaw == null) {
      throw FormatException('Duration.months: null is not allowed');
    }
    final hasYears = raw.containsKey('years');
    final yearsRaw = raw['years'];
    int? yearsValue;
    if (hasYears && yearsRaw != null) {
      if (yearsRaw is! num) {
        throw FormatException('Duration.years: expected a number');
      }
      if (yearsRaw != yearsRaw.toInt()) {
        throw FormatException('Duration.years: expected an integer');
      }
      yearsValue = yearsRaw.toInt();
    } else if (hasYears && yearsRaw == null) {
      throw FormatException('Duration.years: null is not allowed');
    }
    return Duration(
      days: daysValue,
      months: monthsValue,
      years: yearsValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (days != null) {
      map['days'] = days;
    }
    if (months != null) {
      map['months'] = months;
    }
    if (years != null) {
      map['years'] = years;
    }
    return map;
  }
}

/// Typed builder for the `Duration` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildDuration({
  int? days,
  int? months,
  int? years,
}) {
  final map = <String, Object?>{};
  if (days != null) {
    map['days'] = days;
  }
  if (months != null) {
    map['months'] = months;
  }
  if (years != null) {
    map['years'] = years;
  }
  return map;
}

/// Describes an identity document type accepted or rejected by ID capture.
class Document {
  final IdCaptureDocumentType? documentType;
  final String? documentSubtype;
  final String? region;

  const Document({
    this.documentType,
    this.documentSubtype,
    this.region,
  });

  factory Document.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Document: expected a Map');
    }
    const allowedKeys = <String>{
      'documentType',
      'documentSubtype',
      'region',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Document: unknown property '$key'");
      }
    }
    final hasDocumentType = raw.containsKey('documentType');
    final documentTypeRaw = raw['documentType'];
    IdCaptureDocumentType? documentTypeValue;
    if (hasDocumentType && documentTypeRaw != null) {
      documentTypeValue = (documentTypeRaw is! String
          ? (throw FormatException('Document.documentType: expected a String for IdCaptureDocumentType'))
          : IdCaptureDocumentType.fromJSON(documentTypeRaw));
    } else if (hasDocumentType && documentTypeRaw == null) {
      throw FormatException('Document.documentType: null is not allowed');
    }
    final hasDocumentSubtype = raw.containsKey('documentSubtype');
    final documentSubtypeRaw = raw['documentSubtype'];
    String? documentSubtypeValue;
    if (hasDocumentSubtype && documentSubtypeRaw != null) {
      if (documentSubtypeRaw is! String) {
        throw FormatException('Document.documentSubtype: expected a String');
      }
      documentSubtypeValue = documentSubtypeRaw;
    }
    final hasRegion = raw.containsKey('region');
    final regionRaw = raw['region'];
    String? regionValue;
    if (hasRegion && regionRaw != null) {
      if (regionRaw is! String) {
        throw FormatException('Document.region: expected a String');
      }
      regionValue = regionRaw;
    }
    return Document(
      documentType: documentTypeValue,
      documentSubtype: documentSubtypeValue,
      region: regionValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (documentType != null) {
      map['documentType'] = documentType!.toJson();
    }
    if (documentSubtype != null) {
      map['documentSubtype'] = documentSubtype;
    }
    if (region != null) {
      map['region'] = region;
    }
    return map;
  }
}

/// Typed builder for the `Document` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildDocument({
  Object? documentType,
  Object? documentSubtype = _unset,
  Object? region = _unset,
}) {
  final map = <String, Object?>{};
  if (documentType != null) {
    map['documentType'] = documentType;
  }
  if (!identical(documentSubtype, _unset)) {
    map['documentSubtype'] = documentSubtype;
  }
  if (!identical(region, _unset)) {
    map['region'] = region;
  }
  return map;
}

/// The type of identity document to capture.
enum IdCaptureDocumentType {
  driverLicense('driverLicense'),
  idCard('idCard'),
  passport('passport'),
  visaIcao('visaIcao'),
  residencePermit('residencePermit'),
  healthInsuranceCard('healthInsuranceCard'),
  regionSpecific('regionSpecific'),
  visaLetter('visaLetter');

  const IdCaptureDocumentType(this.jsonValue);

  final String jsonValue;

  static IdCaptureDocumentType fromJSON(String jsonValue) {
    for (final value in IdCaptureDocumentType.values) {
      if (value.jsonValue == jsonValue) {
        return value;
      }
    }
    throw FormatException("IdCaptureDocumentType: unknown enum value '$jsonValue'");
  }

  String toJson() => jsonValue;
}

/// Configuration for the scanner type used in ID capture.
class ScannerType {
  final PhysicalDocumentScanner? physicalDocument;
  final MobileDocumentScanner? mobileDocument;
  final bool? allowCloudScanning;

  const ScannerType({
    this.physicalDocument,
    this.mobileDocument,
    this.allowCloudScanning,
  });

  factory ScannerType.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('ScannerType: expected a Map');
    }
    const allowedKeys = <String>{
      'physicalDocument',
      'mobileDocument',
      'allowCloudScanning',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("ScannerType: unknown property '$key'");
      }
    }
    final hasPhysicalDocument = raw.containsKey('physicalDocument');
    final physicalDocumentRaw = raw['physicalDocument'];
    PhysicalDocumentScanner? physicalDocumentValue;
    if (hasPhysicalDocument && physicalDocumentRaw != null) {
      physicalDocumentValue = PhysicalDocumentScanner.fromJson(physicalDocumentRaw);
    }
    final hasMobileDocument = raw.containsKey('mobileDocument');
    final mobileDocumentRaw = raw['mobileDocument'];
    MobileDocumentScanner? mobileDocumentValue;
    if (hasMobileDocument && mobileDocumentRaw != null) {
      mobileDocumentValue = MobileDocumentScanner.fromJson(mobileDocumentRaw);
    }
    final hasAllowCloudScanning = raw.containsKey('allowCloudScanning');
    final allowCloudScanningRaw = raw['allowCloudScanning'];
    bool? allowCloudScanningValue;
    if (hasAllowCloudScanning && allowCloudScanningRaw != null) {
      if (allowCloudScanningRaw is! bool) {
        throw FormatException('ScannerType.allowCloudScanning: expected a bool');
      }
      allowCloudScanningValue = allowCloudScanningRaw;
    } else if (hasAllowCloudScanning && allowCloudScanningRaw == null) {
      throw FormatException('ScannerType.allowCloudScanning: null is not allowed');
    }
    return ScannerType(
      physicalDocument: physicalDocumentValue,
      mobileDocument: mobileDocumentValue,
      allowCloudScanning: allowCloudScanningValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (physicalDocument != null) {
      map['physicalDocument'] = physicalDocument!.toJson();
    }
    if (mobileDocument != null) {
      map['mobileDocument'] = mobileDocument!.toJson();
    }
    if (allowCloudScanning != null) {
      map['allowCloudScanning'] = allowCloudScanning;
    }
    return map;
  }
}

/// Typed builder for the `ScannerType` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildScannerType({
  Object? physicalDocument = _unset,
  Object? mobileDocument = _unset,
  bool? allowCloudScanning,
}) {
  final map = <String, Object?>{};
  if (!identical(physicalDocument, _unset)) {
    map['physicalDocument'] = physicalDocument;
  }
  if (!identical(mobileDocument, _unset)) {
    map['mobileDocument'] = mobileDocument;
  }
  if (allowCloudScanning != null) {
    map['allowCloudScanning'] = allowCloudScanning;
  }
  return map;
}

/// Configuration for scanning physical identity documents.
class PhysicalDocumentScanner {
  final bool isFull;
  final ScannerTypeOptions options;

  const PhysicalDocumentScanner({
    required this.isFull,
    required this.options,
  });

  factory PhysicalDocumentScanner.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('PhysicalDocumentScanner: expected a Map');
    }
    const allowedKeys = <String>{
      'type',
      'isFull',
      'options',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("PhysicalDocumentScanner: unknown property '$key'");
      }
    }
    final hasIsFull = raw.containsKey('isFull');
    if (!hasIsFull) {
      throw FormatException("PhysicalDocumentScanner.isFull: missing required property");
    }
    final isFullRaw = raw['isFull'];
    bool? isFullValue;
    if (hasIsFull && isFullRaw != null) {
      if (isFullRaw is! bool) {
        throw FormatException('PhysicalDocumentScanner.isFull: expected a bool');
      }
      isFullValue = isFullRaw;
    } else if (hasIsFull && isFullRaw == null) {
      throw FormatException('PhysicalDocumentScanner.isFull: null is not allowed');
    }
    final hasOptions = raw.containsKey('options');
    if (!hasOptions) {
      throw FormatException("PhysicalDocumentScanner.options: missing required property");
    }
    final optionsRaw = raw['options'];
    ScannerTypeOptions? optionsValue;
    if (hasOptions && optionsRaw != null) {
      optionsValue = ScannerTypeOptions.fromJson(optionsRaw);
    } else if (hasOptions && optionsRaw == null) {
      throw FormatException('PhysicalDocumentScanner.options: null is not allowed');
    }
    return PhysicalDocumentScanner(
      isFull: isFullValue!,
      options: optionsValue!,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['isFull'] = isFull;
    map['options'] = options.toJson();
    return map;
  }
}

/// Typed builder for the `PhysicalDocumentScanner` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildPhysicalDocumentScanner({
  required bool isFull,
  required Object options,
}) {
  final map = <String, Object?>{};
  map['isFull'] = isFull;
  map['options'] = options;
  return map;
}

/// Options controlling which scanning technologies are enabled.
class ScannerTypeOptions {
  final bool barcode;
  final bool machineReadableZone;
  final bool visualInspectionZone;
  final bool? freeFormText;
  final bool? manipulationCheck;

  const ScannerTypeOptions({
    required this.barcode,
    required this.machineReadableZone,
    required this.visualInspectionZone,
    this.freeFormText,
    this.manipulationCheck,
  });

  factory ScannerTypeOptions.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('ScannerTypeOptions: expected a Map');
    }
    const allowedKeys = <String>{
      'barcode',
      'machineReadableZone',
      'visualInspectionZone',
      'freeFormText',
      'manipulationCheck',
      'soloZone',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("ScannerTypeOptions: unknown property '$key'");
      }
    }
    final hasBarcode = raw.containsKey('barcode');
    if (!hasBarcode) {
      throw FormatException("ScannerTypeOptions.barcode: missing required property");
    }
    final barcodeRaw = raw['barcode'];
    bool? barcodeValue;
    if (hasBarcode && barcodeRaw != null) {
      if (barcodeRaw is! bool) {
        throw FormatException('ScannerTypeOptions.barcode: expected a bool');
      }
      barcodeValue = barcodeRaw;
    } else if (hasBarcode && barcodeRaw == null) {
      throw FormatException('ScannerTypeOptions.barcode: null is not allowed');
    }
    final hasMachineReadableZone = raw.containsKey('machineReadableZone');
    if (!hasMachineReadableZone) {
      throw FormatException("ScannerTypeOptions.machineReadableZone: missing required property");
    }
    final machineReadableZoneRaw = raw['machineReadableZone'];
    bool? machineReadableZoneValue;
    if (hasMachineReadableZone && machineReadableZoneRaw != null) {
      if (machineReadableZoneRaw is! bool) {
        throw FormatException('ScannerTypeOptions.machineReadableZone: expected a bool');
      }
      machineReadableZoneValue = machineReadableZoneRaw;
    } else if (hasMachineReadableZone && machineReadableZoneRaw == null) {
      throw FormatException('ScannerTypeOptions.machineReadableZone: null is not allowed');
    }
    final hasVisualInspectionZone = raw.containsKey('visualInspectionZone');
    if (!hasVisualInspectionZone) {
      throw FormatException("ScannerTypeOptions.visualInspectionZone: missing required property");
    }
    final visualInspectionZoneRaw = raw['visualInspectionZone'];
    bool? visualInspectionZoneValue;
    if (hasVisualInspectionZone && visualInspectionZoneRaw != null) {
      if (visualInspectionZoneRaw is! bool) {
        throw FormatException('ScannerTypeOptions.visualInspectionZone: expected a bool');
      }
      visualInspectionZoneValue = visualInspectionZoneRaw;
    } else if (hasVisualInspectionZone && visualInspectionZoneRaw == null) {
      throw FormatException('ScannerTypeOptions.visualInspectionZone: null is not allowed');
    }
    final hasFreeFormText = raw.containsKey('freeFormText');
    final freeFormTextRaw = raw['freeFormText'];
    bool? freeFormTextValue;
    if (hasFreeFormText && freeFormTextRaw != null) {
      if (freeFormTextRaw is! bool) {
        throw FormatException('ScannerTypeOptions.freeFormText: expected a bool');
      }
      freeFormTextValue = freeFormTextRaw;
    } else if (hasFreeFormText && freeFormTextRaw == null) {
      throw FormatException('ScannerTypeOptions.freeFormText: null is not allowed');
    }
    final hasManipulationCheck = raw.containsKey('manipulationCheck');
    final manipulationCheckRaw = raw['manipulationCheck'];
    bool? manipulationCheckValue;
    if (hasManipulationCheck && manipulationCheckRaw != null) {
      if (manipulationCheckRaw is! bool) {
        throw FormatException('ScannerTypeOptions.manipulationCheck: expected a bool');
      }
      manipulationCheckValue = manipulationCheckRaw;
    } else if (hasManipulationCheck && manipulationCheckRaw == null) {
      throw FormatException('ScannerTypeOptions.manipulationCheck: null is not allowed');
    }
    return ScannerTypeOptions(
      barcode: barcodeValue!,
      machineReadableZone: machineReadableZoneValue!,
      visualInspectionZone: visualInspectionZoneValue!,
      freeFormText: freeFormTextValue,
      manipulationCheck: manipulationCheckValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['barcode'] = barcode;
    map['machineReadableZone'] = machineReadableZone;
    map['visualInspectionZone'] = visualInspectionZone;
    if (freeFormText != null) {
      map['freeFormText'] = freeFormText;
    }
    if (manipulationCheck != null) {
      map['manipulationCheck'] = manipulationCheck;
    }
    return map;
  }
}

/// Typed builder for the `ScannerTypeOptions` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildScannerTypeOptions({
  required bool barcode,
  required bool machineReadableZone,
  required bool visualInspectionZone,
  bool? freeFormText,
  bool? manipulationCheck,
}) {
  final map = <String, Object?>{};
  map['barcode'] = barcode;
  map['machineReadableZone'] = machineReadableZone;
  map['visualInspectionZone'] = visualInspectionZone;
  if (freeFormText != null) {
    map['freeFormText'] = freeFormText;
  }
  if (manipulationCheck != null) {
    map['manipulationCheck'] = manipulationCheck;
  }
  return map;
}

/// Configuration for scanning mobile identity documents.
class MobileDocumentScanner {
  final bool? iso180135;
  final bool? ocr;
  final List<MobileDocumentScannerElementsToRetainItem>? elementsToRetain;

  const MobileDocumentScanner({
    this.iso180135,
    this.ocr,
    this.elementsToRetain,
  });

  factory MobileDocumentScanner.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('MobileDocumentScanner: expected a Map');
    }
    const allowedKeys = <String>{
      'iso180135',
      'ocr',
      'elementsToRetain',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("MobileDocumentScanner: unknown property '$key'");
      }
    }
    final hasIso180135 = raw.containsKey('iso180135');
    final iso180135Raw = raw['iso180135'];
    bool? iso180135Value;
    if (hasIso180135 && iso180135Raw != null) {
      if (iso180135Raw is! bool) {
        throw FormatException('MobileDocumentScanner.iso180135: expected a bool');
      }
      iso180135Value = iso180135Raw;
    } else if (hasIso180135 && iso180135Raw == null) {
      throw FormatException('MobileDocumentScanner.iso180135: null is not allowed');
    }
    final hasOcr = raw.containsKey('ocr');
    final ocrRaw = raw['ocr'];
    bool? ocrValue;
    if (hasOcr && ocrRaw != null) {
      if (ocrRaw is! bool) {
        throw FormatException('MobileDocumentScanner.ocr: expected a bool');
      }
      ocrValue = ocrRaw;
    } else if (hasOcr && ocrRaw == null) {
      throw FormatException('MobileDocumentScanner.ocr: null is not allowed');
    }
    final hasElementsToRetain = raw.containsKey('elementsToRetain');
    final elementsToRetainRaw = raw['elementsToRetain'];
    List<MobileDocumentScannerElementsToRetainItem>? elementsToRetainValue;
    if (hasElementsToRetain && elementsToRetainRaw != null) {
      if (elementsToRetainRaw is! List) {
        throw FormatException('MobileDocumentScanner.elementsToRetain: expected a List');
      }
      elementsToRetainValue =
          elementsToRetainRaw.map((item) => MobileDocumentScannerElementsToRetainItem.fromJson(item)).toList();
    } else if (hasElementsToRetain && elementsToRetainRaw == null) {
      throw FormatException('MobileDocumentScanner.elementsToRetain: null is not allowed');
    }
    return MobileDocumentScanner(
      iso180135: iso180135Value,
      ocr: ocrValue,
      elementsToRetain: elementsToRetainValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (iso180135 != null) {
      map['iso180135'] = iso180135;
    }
    if (ocr != null) {
      map['ocr'] = ocr;
    }
    if (elementsToRetain != null) {
      map['elementsToRetain'] = elementsToRetain!.map((item) => item.toJson()).toList();
    }
    return map;
  }
}

/// Typed builder for the `MobileDocumentScanner` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildMobileDocumentScanner({
  bool? iso180135,
  bool? ocr,
  List<Object?>? elementsToRetain,
}) {
  final map = <String, Object?>{};
  if (iso180135 != null) {
    map['iso180135'] = iso180135;
  }
  if (ocr != null) {
    map['ocr'] = ocr;
  }
  if (elementsToRetain != null) {
    map['elementsToRetain'] = elementsToRetain;
  }
  return map;
}

///
class MobileDocumentScannerElementsToRetainItem {
  final String namespace;
  final String field;

  const MobileDocumentScannerElementsToRetainItem({
    required this.namespace,
    required this.field,
  });

  factory MobileDocumentScannerElementsToRetainItem.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('MobileDocumentScannerElementsToRetainItem: expected a Map');
    }
    const allowedKeys = <String>{
      'namespace',
      'field',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("MobileDocumentScannerElementsToRetainItem: unknown property '$key'");
      }
    }
    final hasNamespace = raw.containsKey('namespace');
    if (!hasNamespace) {
      throw FormatException("MobileDocumentScannerElementsToRetainItem.namespace: missing required property");
    }
    final namespaceRaw = raw['namespace'];
    String? namespaceValue;
    if (hasNamespace && namespaceRaw != null) {
      if (namespaceRaw is! String) {
        throw FormatException('MobileDocumentScannerElementsToRetainItem.namespace: expected a String');
      }
      namespaceValue = namespaceRaw;
    } else if (hasNamespace && namespaceRaw == null) {
      throw FormatException('MobileDocumentScannerElementsToRetainItem.namespace: null is not allowed');
    }
    final hasField = raw.containsKey('field');
    if (!hasField) {
      throw FormatException("MobileDocumentScannerElementsToRetainItem.field: missing required property");
    }
    final fieldRaw = raw['field'];
    String? fieldValue;
    if (hasField && fieldRaw != null) {
      if (fieldRaw is! String) {
        throw FormatException('MobileDocumentScannerElementsToRetainItem.field: expected a String');
      }
      fieldValue = fieldRaw;
    } else if (hasField && fieldRaw == null) {
      throw FormatException('MobileDocumentScannerElementsToRetainItem.field: null is not allowed');
    }
    return MobileDocumentScannerElementsToRetainItem(
      namespace: namespaceValue!,
      field: fieldValue!,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['namespace'] = namespace;
    map['field'] = field;
    return map;
  }
}

/// Typed builder for the `MobileDocumentScannerElementsToRetainItem` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildMobileDocumentScannerElementsToRetainItem({
  required String namespace,
  required String field,
}) {
  final map = <String, Object?>{};
  map['namespace'] = namespace;
  map['field'] = field;
  return map;
}

/// Feedback configuration for ID capture events.
class IdCaptureFeedback {
  final Feedback? idCaptured;
  final Feedback? idRejected;

  const IdCaptureFeedback({
    this.idCaptured,
    this.idRejected,
  });

  factory IdCaptureFeedback.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('IdCaptureFeedback: expected a Map');
    }
    const allowedKeys = <String>{
      'idCaptured',
      'idRejected',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("IdCaptureFeedback: unknown property '$key'");
      }
    }
    final hasIdCaptured = raw.containsKey('idCaptured');
    final idCapturedRaw = raw['idCaptured'];
    Feedback? idCapturedValue;
    if (hasIdCaptured && idCapturedRaw != null) {
      idCapturedValue = Feedback.fromJson(idCapturedRaw);
    } else if (hasIdCaptured && idCapturedRaw == null) {
      throw FormatException('IdCaptureFeedback.idCaptured: null is not allowed');
    }
    final hasIdRejected = raw.containsKey('idRejected');
    final idRejectedRaw = raw['idRejected'];
    Feedback? idRejectedValue;
    if (hasIdRejected && idRejectedRaw != null) {
      idRejectedValue = Feedback.fromJson(idRejectedRaw);
    } else if (hasIdRejected && idRejectedRaw == null) {
      throw FormatException('IdCaptureFeedback.idRejected: null is not allowed');
    }
    return IdCaptureFeedback(
      idCaptured: idCapturedValue,
      idRejected: idRejectedValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (idCaptured != null) {
      map['idCaptured'] = idCaptured!.toJson();
    }
    if (idRejected != null) {
      map['idRejected'] = idRejected!.toJson();
    }
    return map;
  }
}

/// Typed builder for the `IdCaptureFeedback` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildIdCaptureFeedback({
  Object? idCaptured,
  Object? idRejected,
}) {
  final map = <String, Object?>{};
  if (idCaptured != null) {
    map['idCaptured'] = idCaptured;
  }
  if (idRejected != null) {
    map['idRejected'] = idRejected;
  }
  return map;
}

/// Audio and haptic feedback for scan events.
class Feedback {
  final Sound? sound;
  final Vibration? vibration;

  const Feedback({
    this.sound,
    this.vibration,
  });

  factory Feedback.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Feedback: expected a Map');
    }
    const allowedKeys = <String>{
      'sound',
      'vibration',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Feedback: unknown property '$key'");
      }
    }
    final hasSound = raw.containsKey('sound');
    final soundRaw = raw['sound'];
    Sound? soundValue;
    if (hasSound && soundRaw != null) {
      soundValue = Sound.fromJson(soundRaw);
    }
    final hasVibration = raw.containsKey('vibration');
    final vibrationRaw = raw['vibration'];
    Vibration? vibrationValue;
    if (hasVibration && vibrationRaw != null) {
      vibrationValue = Vibration.fromJson(vibrationRaw);
    }
    return Feedback(
      sound: soundValue,
      vibration: vibrationValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (sound != null) {
      map['sound'] = sound!.toJson();
    }
    if (vibration != null) {
      map['vibration'] = vibration!.toJson();
    }
    return map;
  }
}

/// Typed builder for the `Feedback` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildFeedback({
  Object? sound = _unset,
  Object? vibration = _unset,
}) {
  final map = <String, Object?>{};
  if (!identical(sound, _unset)) {
    map['sound'] = sound;
  }
  if (!identical(vibration, _unset)) {
    map['vibration'] = vibration;
  }
  return map;
}

///
class Sound {
  final String? resource;

  const Sound({
    this.resource,
  });

  factory Sound.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Sound: expected a Map');
    }
    const allowedKeys = <String>{
      'resource',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Sound: unknown property '$key'");
      }
    }
    final hasResource = raw.containsKey('resource');
    final resourceRaw = raw['resource'];
    String? resourceValue;
    if (hasResource && resourceRaw != null) {
      if (resourceRaw is! String) {
        throw FormatException('Sound.resource: expected a String');
      }
      resourceValue = resourceRaw;
    } else if (hasResource && resourceRaw == null) {
      throw FormatException('Sound.resource: null is not allowed');
    }
    return Sound(
      resource: resourceValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (resource != null) {
      map['resource'] = resource;
    }
    return map;
  }
}

/// Typed builder for the `Sound` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildSound({
  String? resource,
}) {
  final map = <String, Object?>{};
  if (resource != null) {
    map['resource'] = resource;
  }
  return map;
}

///
class Vibration {
  final String? type;
  final List<int>? timings;
  final List<int>? amplitudes;

  const Vibration({
    this.type,
    this.timings,
    this.amplitudes,
  });

  factory Vibration.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Vibration: expected a Map');
    }
    const allowedKeys = <String>{
      'type',
      'timings',
      'amplitudes',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Vibration: unknown property '$key'");
      }
    }
    final hasType = raw.containsKey('type');
    final typeRaw = raw['type'];
    String? typeValue;
    if (hasType && typeRaw != null) {
      if (typeRaw is! String ||
          !const <String>[
            'default',
            'selectionHaptic',
            'successHaptic',
            'impactHaptic',
            'impactHapticLight',
            'failureHaptic',
            'waveForm'
          ].contains(typeRaw)) {
        throw FormatException("Vibration.type: unknown enum value '$typeRaw'");
      }
      typeValue = typeRaw;
    } else if (hasType && typeRaw == null) {
      throw FormatException('Vibration.type: null is not allowed');
    }
    final hasTimings = raw.containsKey('timings');
    final timingsRaw = raw['timings'];
    List<int>? timingsValue;
    if (hasTimings && timingsRaw != null) {
      if (timingsRaw is! List) {
        throw FormatException('Vibration.timings: expected a List');
      }
      for (final item in timingsRaw) {
        if (item is! num) {
          throw FormatException('Vibration.timings: expected a List of num');
        }
        if (item != item.toInt()) {
          throw FormatException('Vibration.timings: expected a List of integers');
        }
      }
      timingsValue = timingsRaw.map((item) => (item as num).toInt()).toList();
    } else if (hasTimings && timingsRaw == null) {
      throw FormatException('Vibration.timings: null is not allowed');
    }
    final hasAmplitudes = raw.containsKey('amplitudes');
    final amplitudesRaw = raw['amplitudes'];
    List<int>? amplitudesValue;
    if (hasAmplitudes && amplitudesRaw != null) {
      if (amplitudesRaw is! List) {
        throw FormatException('Vibration.amplitudes: expected a List');
      }
      for (final item in amplitudesRaw) {
        if (item is! num) {
          throw FormatException('Vibration.amplitudes: expected a List of num');
        }
        if (item != item.toInt()) {
          throw FormatException('Vibration.amplitudes: expected a List of integers');
        }
      }
      amplitudesValue = amplitudesRaw.map((item) => (item as num).toInt()).toList();
    } else if (hasAmplitudes && amplitudesRaw == null) {
      throw FormatException('Vibration.amplitudes: null is not allowed');
    }
    return Vibration(
      type: typeValue,
      timings: timingsValue,
      amplitudes: amplitudesValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (type != null) {
      map['type'] = type;
    }
    if (timings != null) {
      map['timings'] = timings;
    }
    if (amplitudes != null) {
      map['amplitudes'] = amplitudes;
    }
    return map;
  }
}

/// Typed builder for the `Vibration` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildVibration({
  String? type,
  List<int>? timings,
  List<int>? amplitudes,
}) {
  final map = <String, Object?>{};
  if (type != null) {
    map['type'] = type;
  }
  if (timings != null) {
    map['timings'] = timings;
  }
  if (amplitudes != null) {
    map['amplitudes'] = amplitudes;
  }
  return map;
}

/// The overlay for ID capture, rendering a viewfinder adapted to the document layout.
class IdCaptureOverlay {
  final String type;
  final String? idLayout;
  final String? idLayoutStyle;
  final String? idLayoutLineStyle;
  final Brush? capturedBrush;
  final Brush? localizedBrush;
  final Brush? rejectedBrush;
  final bool? showTextHints;
  final String? textHintPosition;
  final String? frontSideTextHint;
  final String? backSideTextHint;
  final String? moveCloserTextHint;
  final String? moveFurtherAwayTextHint;
  final String? tapShutterToScanTextHint;
  final String? lookingForDocumentTextHint;
  final String? holdStillTextHint;
  final int? modeId;

  const IdCaptureOverlay({
    required this.type,
    this.idLayout,
    this.idLayoutStyle,
    this.idLayoutLineStyle,
    this.capturedBrush,
    this.localizedBrush,
    this.rejectedBrush,
    this.showTextHints,
    this.textHintPosition,
    this.frontSideTextHint,
    this.backSideTextHint,
    this.moveCloserTextHint,
    this.moveFurtherAwayTextHint,
    this.tapShutterToScanTextHint,
    this.lookingForDocumentTextHint,
    this.holdStillTextHint,
    this.modeId,
  });

  factory IdCaptureOverlay.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('IdCaptureOverlay: expected a Map');
    }
    const allowedKeys = <String>{
      'type',
      'idLayout',
      'idLayoutStyle',
      'idLayoutLineStyle',
      'capturedBrush',
      'localizedBrush',
      'rejectedBrush',
      'showTextHints',
      'textHintPosition',
      'frontSideTextHint',
      'backSideTextHint',
      'moveCloserTextHint',
      'moveFurtherAwayTextHint',
      'tapShutterToScanTextHint',
      'lookingForDocumentTextHint',
      'holdStillTextHint',
      'modeId',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("IdCaptureOverlay: unknown property '$key'");
      }
    }
    final hasType = raw.containsKey('type');
    if (!hasType) {
      throw FormatException("IdCaptureOverlay.type: missing required property");
    }
    final typeRaw = raw['type'];
    String? typeValue;
    if (hasType && typeRaw != null) {
      if (typeRaw is! String || !const <String>['idCapture'].contains(typeRaw)) {
        throw FormatException("IdCaptureOverlay.type: unknown enum value '$typeRaw'");
      }
      typeValue = typeRaw;
    } else if (hasType && typeRaw == null) {
      throw FormatException('IdCaptureOverlay.type: null is not allowed');
    }
    final hasIdLayout = raw.containsKey('idLayout');
    final idLayoutRaw = raw['idLayout'];
    String? idLayoutValue;
    if (hasIdLayout && idLayoutRaw != null) {
      if (idLayoutRaw is! String ||
          !const <String>['td1', 'td2', 'td3', 'mrvA', 'viz', 'pdf417', 'auto', 'none'].contains(idLayoutRaw)) {
        throw FormatException("IdCaptureOverlay.idLayout: unknown enum value '$idLayoutRaw'");
      }
      idLayoutValue = idLayoutRaw;
    } else if (hasIdLayout && idLayoutRaw == null) {
      throw FormatException('IdCaptureOverlay.idLayout: null is not allowed');
    }
    final hasIdLayoutStyle = raw.containsKey('idLayoutStyle');
    final idLayoutStyleRaw = raw['idLayoutStyle'];
    String? idLayoutStyleValue;
    if (hasIdLayoutStyle && idLayoutStyleRaw != null) {
      if (idLayoutStyleRaw is! String || !const <String>['rounded', 'square'].contains(idLayoutStyleRaw)) {
        throw FormatException("IdCaptureOverlay.idLayoutStyle: unknown enum value '$idLayoutStyleRaw'");
      }
      idLayoutStyleValue = idLayoutStyleRaw;
    } else if (hasIdLayoutStyle && idLayoutStyleRaw == null) {
      throw FormatException('IdCaptureOverlay.idLayoutStyle: null is not allowed');
    }
    final hasIdLayoutLineStyle = raw.containsKey('idLayoutLineStyle');
    final idLayoutLineStyleRaw = raw['idLayoutLineStyle'];
    String? idLayoutLineStyleValue;
    if (hasIdLayoutLineStyle && idLayoutLineStyleRaw != null) {
      if (idLayoutLineStyleRaw is! String || !const <String>['light', 'bold'].contains(idLayoutLineStyleRaw)) {
        throw FormatException("IdCaptureOverlay.idLayoutLineStyle: unknown enum value '$idLayoutLineStyleRaw'");
      }
      idLayoutLineStyleValue = idLayoutLineStyleRaw;
    } else if (hasIdLayoutLineStyle && idLayoutLineStyleRaw == null) {
      throw FormatException('IdCaptureOverlay.idLayoutLineStyle: null is not allowed');
    }
    final hasCapturedBrush = raw.containsKey('capturedBrush');
    final capturedBrushRaw = raw['capturedBrush'];
    Brush? capturedBrushValue;
    if (hasCapturedBrush && capturedBrushRaw != null) {
      capturedBrushValue = Brush.fromJson(capturedBrushRaw);
    } else if (hasCapturedBrush && capturedBrushRaw == null) {
      throw FormatException('IdCaptureOverlay.capturedBrush: null is not allowed');
    }
    final hasLocalizedBrush = raw.containsKey('localizedBrush');
    final localizedBrushRaw = raw['localizedBrush'];
    Brush? localizedBrushValue;
    if (hasLocalizedBrush && localizedBrushRaw != null) {
      localizedBrushValue = Brush.fromJson(localizedBrushRaw);
    } else if (hasLocalizedBrush && localizedBrushRaw == null) {
      throw FormatException('IdCaptureOverlay.localizedBrush: null is not allowed');
    }
    final hasRejectedBrush = raw.containsKey('rejectedBrush');
    final rejectedBrushRaw = raw['rejectedBrush'];
    Brush? rejectedBrushValue;
    if (hasRejectedBrush && rejectedBrushRaw != null) {
      rejectedBrushValue = Brush.fromJson(rejectedBrushRaw);
    } else if (hasRejectedBrush && rejectedBrushRaw == null) {
      throw FormatException('IdCaptureOverlay.rejectedBrush: null is not allowed');
    }
    final hasShowTextHints = raw.containsKey('showTextHints');
    final showTextHintsRaw = raw['showTextHints'];
    bool? showTextHintsValue;
    if (hasShowTextHints && showTextHintsRaw != null) {
      if (showTextHintsRaw is! bool) {
        throw FormatException('IdCaptureOverlay.showTextHints: expected a bool');
      }
      showTextHintsValue = showTextHintsRaw;
    } else if (hasShowTextHints && showTextHintsRaw == null) {
      throw FormatException('IdCaptureOverlay.showTextHints: null is not allowed');
    }
    final hasTextHintPosition = raw.containsKey('textHintPosition');
    final textHintPositionRaw = raw['textHintPosition'];
    String? textHintPositionValue;
    if (hasTextHintPosition && textHintPositionRaw != null) {
      if (textHintPositionRaw is! String ||
          !const <String>['aboveViewfinder', 'belowViewfinder'].contains(textHintPositionRaw)) {
        throw FormatException("IdCaptureOverlay.textHintPosition: unknown enum value '$textHintPositionRaw'");
      }
      textHintPositionValue = textHintPositionRaw;
    } else if (hasTextHintPosition && textHintPositionRaw == null) {
      throw FormatException('IdCaptureOverlay.textHintPosition: null is not allowed');
    }
    final hasFrontSideTextHint = raw.containsKey('frontSideTextHint');
    final frontSideTextHintRaw = raw['frontSideTextHint'];
    String? frontSideTextHintValue;
    if (hasFrontSideTextHint && frontSideTextHintRaw != null) {
      if (frontSideTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.frontSideTextHint: expected a String');
      }
      frontSideTextHintValue = frontSideTextHintRaw;
    }
    final hasBackSideTextHint = raw.containsKey('backSideTextHint');
    final backSideTextHintRaw = raw['backSideTextHint'];
    String? backSideTextHintValue;
    if (hasBackSideTextHint && backSideTextHintRaw != null) {
      if (backSideTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.backSideTextHint: expected a String');
      }
      backSideTextHintValue = backSideTextHintRaw;
    }
    final hasMoveCloserTextHint = raw.containsKey('moveCloserTextHint');
    final moveCloserTextHintRaw = raw['moveCloserTextHint'];
    String? moveCloserTextHintValue;
    if (hasMoveCloserTextHint && moveCloserTextHintRaw != null) {
      if (moveCloserTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.moveCloserTextHint: expected a String');
      }
      moveCloserTextHintValue = moveCloserTextHintRaw;
    } else if (hasMoveCloserTextHint && moveCloserTextHintRaw == null) {
      throw FormatException('IdCaptureOverlay.moveCloserTextHint: null is not allowed');
    }
    final hasMoveFurtherAwayTextHint = raw.containsKey('moveFurtherAwayTextHint');
    final moveFurtherAwayTextHintRaw = raw['moveFurtherAwayTextHint'];
    String? moveFurtherAwayTextHintValue;
    if (hasMoveFurtherAwayTextHint && moveFurtherAwayTextHintRaw != null) {
      if (moveFurtherAwayTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.moveFurtherAwayTextHint: expected a String');
      }
      moveFurtherAwayTextHintValue = moveFurtherAwayTextHintRaw;
    } else if (hasMoveFurtherAwayTextHint && moveFurtherAwayTextHintRaw == null) {
      throw FormatException('IdCaptureOverlay.moveFurtherAwayTextHint: null is not allowed');
    }
    final hasTapShutterToScanTextHint = raw.containsKey('tapShutterToScanTextHint');
    final tapShutterToScanTextHintRaw = raw['tapShutterToScanTextHint'];
    String? tapShutterToScanTextHintValue;
    if (hasTapShutterToScanTextHint && tapShutterToScanTextHintRaw != null) {
      if (tapShutterToScanTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.tapShutterToScanTextHint: expected a String');
      }
      tapShutterToScanTextHintValue = tapShutterToScanTextHintRaw;
    } else if (hasTapShutterToScanTextHint && tapShutterToScanTextHintRaw == null) {
      throw FormatException('IdCaptureOverlay.tapShutterToScanTextHint: null is not allowed');
    }
    final hasLookingForDocumentTextHint = raw.containsKey('lookingForDocumentTextHint');
    final lookingForDocumentTextHintRaw = raw['lookingForDocumentTextHint'];
    String? lookingForDocumentTextHintValue;
    if (hasLookingForDocumentTextHint && lookingForDocumentTextHintRaw != null) {
      if (lookingForDocumentTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.lookingForDocumentTextHint: expected a String');
      }
      lookingForDocumentTextHintValue = lookingForDocumentTextHintRaw;
    } else if (hasLookingForDocumentTextHint && lookingForDocumentTextHintRaw == null) {
      throw FormatException('IdCaptureOverlay.lookingForDocumentTextHint: null is not allowed');
    }
    final hasHoldStillTextHint = raw.containsKey('holdStillTextHint');
    final holdStillTextHintRaw = raw['holdStillTextHint'];
    String? holdStillTextHintValue;
    if (hasHoldStillTextHint && holdStillTextHintRaw != null) {
      if (holdStillTextHintRaw is! String) {
        throw FormatException('IdCaptureOverlay.holdStillTextHint: expected a String');
      }
      holdStillTextHintValue = holdStillTextHintRaw;
    } else if (hasHoldStillTextHint && holdStillTextHintRaw == null) {
      throw FormatException('IdCaptureOverlay.holdStillTextHint: null is not allowed');
    }
    final hasModeId = raw.containsKey('modeId');
    final modeIdRaw = raw['modeId'];
    int? modeIdValue;
    if (hasModeId && modeIdRaw != null) {
      if (modeIdRaw is! num) {
        throw FormatException('IdCaptureOverlay.modeId: expected a number');
      }
      if (modeIdRaw != modeIdRaw.toInt()) {
        throw FormatException('IdCaptureOverlay.modeId: expected an integer');
      }
      modeIdValue = modeIdRaw.toInt();
    } else if (hasModeId && modeIdRaw == null) {
      throw FormatException('IdCaptureOverlay.modeId: null is not allowed');
    }
    return IdCaptureOverlay(
      type: typeValue!,
      idLayout: idLayoutValue,
      idLayoutStyle: idLayoutStyleValue,
      idLayoutLineStyle: idLayoutLineStyleValue,
      capturedBrush: capturedBrushValue,
      localizedBrush: localizedBrushValue,
      rejectedBrush: rejectedBrushValue,
      showTextHints: showTextHintsValue,
      textHintPosition: textHintPositionValue,
      frontSideTextHint: frontSideTextHintValue,
      backSideTextHint: backSideTextHintValue,
      moveCloserTextHint: moveCloserTextHintValue,
      moveFurtherAwayTextHint: moveFurtherAwayTextHintValue,
      tapShutterToScanTextHint: tapShutterToScanTextHintValue,
      lookingForDocumentTextHint: lookingForDocumentTextHintValue,
      holdStillTextHint: holdStillTextHintValue,
      modeId: modeIdValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['type'] = type;
    if (idLayout != null) {
      map['idLayout'] = idLayout;
    }
    if (idLayoutStyle != null) {
      map['idLayoutStyle'] = idLayoutStyle;
    }
    if (idLayoutLineStyle != null) {
      map['idLayoutLineStyle'] = idLayoutLineStyle;
    }
    if (capturedBrush != null) {
      map['capturedBrush'] = capturedBrush!.toJson();
    }
    if (localizedBrush != null) {
      map['localizedBrush'] = localizedBrush!.toJson();
    }
    if (rejectedBrush != null) {
      map['rejectedBrush'] = rejectedBrush!.toJson();
    }
    if (showTextHints != null) {
      map['showTextHints'] = showTextHints;
    }
    if (textHintPosition != null) {
      map['textHintPosition'] = textHintPosition;
    }
    if (frontSideTextHint != null) {
      map['frontSideTextHint'] = frontSideTextHint;
    }
    if (backSideTextHint != null) {
      map['backSideTextHint'] = backSideTextHint;
    }
    if (moveCloserTextHint != null) {
      map['moveCloserTextHint'] = moveCloserTextHint;
    }
    if (moveFurtherAwayTextHint != null) {
      map['moveFurtherAwayTextHint'] = moveFurtherAwayTextHint;
    }
    if (tapShutterToScanTextHint != null) {
      map['tapShutterToScanTextHint'] = tapShutterToScanTextHint;
    }
    if (lookingForDocumentTextHint != null) {
      map['lookingForDocumentTextHint'] = lookingForDocumentTextHint;
    }
    if (holdStillTextHint != null) {
      map['holdStillTextHint'] = holdStillTextHint;
    }
    if (modeId != null) {
      map['modeId'] = modeId;
    }
    return map;
  }
}

/// Typed builder for the `IdCaptureOverlay` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildIdCaptureOverlay({
  required String type,
  String? idLayout,
  String? idLayoutStyle,
  String? idLayoutLineStyle,
  Object? capturedBrush,
  Object? localizedBrush,
  Object? rejectedBrush,
  bool? showTextHints,
  String? textHintPosition,
  Object? frontSideTextHint = _unset,
  Object? backSideTextHint = _unset,
  String? moveCloserTextHint,
  String? moveFurtherAwayTextHint,
  String? tapShutterToScanTextHint,
  String? lookingForDocumentTextHint,
  String? holdStillTextHint,
  int? modeId,
}) {
  final map = <String, Object?>{};
  map['type'] = type;
  if (idLayout != null) {
    map['idLayout'] = idLayout;
  }
  if (idLayoutStyle != null) {
    map['idLayoutStyle'] = idLayoutStyle;
  }
  if (idLayoutLineStyle != null) {
    map['idLayoutLineStyle'] = idLayoutLineStyle;
  }
  if (capturedBrush != null) {
    map['capturedBrush'] = capturedBrush;
  }
  if (localizedBrush != null) {
    map['localizedBrush'] = localizedBrush;
  }
  if (rejectedBrush != null) {
    map['rejectedBrush'] = rejectedBrush;
  }
  if (showTextHints != null) {
    map['showTextHints'] = showTextHints;
  }
  if (textHintPosition != null) {
    map['textHintPosition'] = textHintPosition;
  }
  if (!identical(frontSideTextHint, _unset)) {
    map['frontSideTextHint'] = frontSideTextHint;
  }
  if (!identical(backSideTextHint, _unset)) {
    map['backSideTextHint'] = backSideTextHint;
  }
  if (moveCloserTextHint != null) {
    map['moveCloserTextHint'] = moveCloserTextHint;
  }
  if (moveFurtherAwayTextHint != null) {
    map['moveFurtherAwayTextHint'] = moveFurtherAwayTextHint;
  }
  if (tapShutterToScanTextHint != null) {
    map['tapShutterToScanTextHint'] = tapShutterToScanTextHint;
  }
  if (lookingForDocumentTextHint != null) {
    map['lookingForDocumentTextHint'] = lookingForDocumentTextHint;
  }
  if (holdStillTextHint != null) {
    map['holdStillTextHint'] = holdStillTextHint;
  }
  if (modeId != null) {
    map['modeId'] = modeId;
  }
  return map;
}

/// A brush defining fill and stroke appearance.
class Brush {
  final Fill? fill;
  final Stroke? stroke;

  const Brush({
    this.fill,
    this.stroke,
  });

  factory Brush.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Brush: expected a Map');
    }
    const allowedKeys = <String>{
      'fill',
      'stroke',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Brush: unknown property '$key'");
      }
    }
    final hasFill = raw.containsKey('fill');
    final fillRaw = raw['fill'];
    Fill? fillValue;
    if (hasFill && fillRaw != null) {
      fillValue = Fill.fromJson(fillRaw);
    } else if (hasFill && fillRaw == null) {
      throw FormatException('Brush.fill: null is not allowed');
    }
    final hasStroke = raw.containsKey('stroke');
    final strokeRaw = raw['stroke'];
    Stroke? strokeValue;
    if (hasStroke && strokeRaw != null) {
      strokeValue = Stroke.fromJson(strokeRaw);
    } else if (hasStroke && strokeRaw == null) {
      throw FormatException('Brush.stroke: null is not allowed');
    }
    return Brush(
      fill: fillValue,
      stroke: strokeValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (fill != null) {
      map['fill'] = fill!.toJson();
    }
    if (stroke != null) {
      map['stroke'] = stroke!.toJson();
    }
    return map;
  }
}

/// Typed builder for the `Brush` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildBrush({
  Object? fill,
  Object? stroke,
}) {
  final map = <String, Object?>{};
  if (fill != null) {
    map['fill'] = fill;
  }
  if (stroke != null) {
    map['stroke'] = stroke;
  }
  return map;
}

///
class Fill {
  final Color? color;

  const Fill({
    this.color,
  });

  factory Fill.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Fill: expected a Map');
    }
    const allowedKeys = <String>{
      'color',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Fill: unknown property '$key'");
      }
    }
    final hasColor = raw.containsKey('color');
    final colorRaw = raw['color'];
    Color? colorValue;
    if (hasColor && colorRaw != null) {
      colorValue = parseColor(colorRaw);
    } else if (hasColor && colorRaw == null) {
      throw FormatException('Fill.color: null is not allowed');
    }
    return Fill(
      color: colorValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (color != null) {
      map['color'] = color;
    }
    return map;
  }
}

/// Typed builder for the `Fill` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildFill({
  Color? color,
}) {
  final map = <String, Object?>{};
  if (color != null) {
    map['color'] = color;
  }
  return map;
}

/// A color expressed as a hex string with an optional # prefix. Accepted formats: RGB, RGBA, RRGGBB, RRGGBBAA (case-insensitive).
typedef Color = String;

Color parseColor(Object? raw) {
  if (raw is! String) {
    throw FormatException('Color: expected a String');
  }
  return raw;
}

///
class Stroke {
  final Color? color;
  final double? width;

  const Stroke({
    this.color,
    this.width,
  });

  factory Stroke.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('Stroke: expected a Map');
    }
    const allowedKeys = <String>{
      'color',
      'width',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("Stroke: unknown property '$key'");
      }
    }
    final hasColor = raw.containsKey('color');
    final colorRaw = raw['color'];
    Color? colorValue;
    if (hasColor && colorRaw != null) {
      colorValue = parseColor(colorRaw);
    } else if (hasColor && colorRaw == null) {
      throw FormatException('Stroke.color: null is not allowed');
    }
    final hasWidth = raw.containsKey('width');
    final widthRaw = raw['width'];
    double? widthValue;
    if (hasWidth && widthRaw != null) {
      if (widthRaw is! num) {
        throw FormatException('Stroke.width: expected a number');
      }
      widthValue = widthRaw.toDouble();
    } else if (hasWidth && widthRaw == null) {
      throw FormatException('Stroke.width: null is not allowed');
    }
    return Stroke(
      color: colorValue,
      width: widthValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (color != null) {
      map['color'] = color;
    }
    if (width != null) {
      map['width'] = width;
    }
    return map;
  }
}

/// Typed builder for the `Stroke` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildStroke({
  Color? color,
  double? width,
}) {
  final map = <String, Object?>{};
  if (color != null) {
    map['color'] = color;
  }
  if (width != null) {
    map['width'] = width;
  }
  return map;
}

/// Notifies the listener that IdCapture captured a document.
class IdCaptureListenerDidCaptureId {
  final String id;
  final ImageInfo? imageInfo;
  final String? frontReviewImage;
  final int modeId;
  final String event;

  const IdCaptureListenerDidCaptureId({
    required this.id,
    this.imageInfo,
    this.frontReviewImage,
    required this.modeId,
    required this.event,
  });

  factory IdCaptureListenerDidCaptureId.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('IdCaptureListenerDidCaptureId: expected a Map');
    }
    const allowedKeys = <String>{
      'id',
      'imageInfo',
      'frontReviewImage',
      'modeId',
      'event',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("IdCaptureListenerDidCaptureId: unknown property '$key'");
      }
    }
    final hasId = raw.containsKey('id');
    if (!hasId) {
      throw FormatException("IdCaptureListenerDidCaptureId.id: missing required property");
    }
    final idRaw = raw['id'];
    String? idValue;
    if (hasId && idRaw != null) {
      if (idRaw is! String) {
        throw FormatException('IdCaptureListenerDidCaptureId.id: expected a String');
      }
      idValue = idRaw;
    } else if (hasId && idRaw == null) {
      throw FormatException('IdCaptureListenerDidCaptureId.id: null is not allowed');
    }
    final hasImageInfo = raw.containsKey('imageInfo');
    final imageInfoRaw = raw['imageInfo'];
    ImageInfo? imageInfoValue;
    if (hasImageInfo && imageInfoRaw != null) {
      imageInfoValue = ImageInfo.fromJson(imageInfoRaw);
    } else if (hasImageInfo && imageInfoRaw == null) {
      throw FormatException('IdCaptureListenerDidCaptureId.imageInfo: null is not allowed');
    }
    final hasFrontReviewImage = raw.containsKey('frontReviewImage');
    final frontReviewImageRaw = raw['frontReviewImage'];
    String? frontReviewImageValue;
    if (hasFrontReviewImage && frontReviewImageRaw != null) {
      if (frontReviewImageRaw is! String) {
        throw FormatException('IdCaptureListenerDidCaptureId.frontReviewImage: expected a String');
      }
      frontReviewImageValue = frontReviewImageRaw;
    }
    final hasModeId = raw.containsKey('modeId');
    if (!hasModeId) {
      throw FormatException("IdCaptureListenerDidCaptureId.modeId: missing required property");
    }
    final modeIdRaw = raw['modeId'];
    int? modeIdValue;
    if (hasModeId && modeIdRaw != null) {
      if (modeIdRaw is! num) {
        throw FormatException('IdCaptureListenerDidCaptureId.modeId: expected a number');
      }
      if (modeIdRaw != modeIdRaw.toInt()) {
        throw FormatException('IdCaptureListenerDidCaptureId.modeId: expected an integer');
      }
      modeIdValue = modeIdRaw.toInt();
    } else if (hasModeId && modeIdRaw == null) {
      throw FormatException('IdCaptureListenerDidCaptureId.modeId: null is not allowed');
    }
    final hasEvent = raw.containsKey('event');
    if (!hasEvent) {
      throw FormatException("IdCaptureListenerDidCaptureId.event: missing required property");
    }
    final eventRaw = raw['event'];
    String? eventValue;
    if (hasEvent && eventRaw != null) {
      if (eventRaw is! String || !const <String>['IdCaptureListener.didCaptureId'].contains(eventRaw)) {
        throw FormatException("IdCaptureListenerDidCaptureId.event: unknown enum value '$eventRaw'");
      }
      eventValue = eventRaw;
    } else if (hasEvent && eventRaw == null) {
      throw FormatException('IdCaptureListenerDidCaptureId.event: null is not allowed');
    }
    return IdCaptureListenerDidCaptureId(
      id: idValue!,
      imageInfo: imageInfoValue,
      frontReviewImage: frontReviewImageValue,
      modeId: modeIdValue!,
      event: eventValue!,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['id'] = id;
    if (imageInfo != null) {
      map['imageInfo'] = imageInfo!.toJson();
    }
    if (frontReviewImage != null) {
      map['frontReviewImage'] = frontReviewImage;
    }
    map['modeId'] = modeId;
    map['event'] = event;
    return map;
  }
}

/// Typed builder for the `IdCaptureListenerDidCaptureId` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildIdCaptureListenerDidCaptureId({
  required String id,
  Object? imageInfo,
  Object? frontReviewImage = _unset,
  required int modeId,
  required String event,
}) {
  final map = <String, Object?>{};
  map['id'] = id;
  if (imageInfo != null) {
    map['imageInfo'] = imageInfo;
  }
  if (!identical(frontReviewImage, _unset)) {
    map['frontReviewImage'] = frontReviewImage;
  }
  map['modeId'] = modeId;
  map['event'] = event;
  return map;
}

/// Base64-encoded images captured from an identity document, grouped by side.
class ImageInfo {
  final SideImages? front;
  final SideImages? back;

  const ImageInfo({
    this.front,
    this.back,
  });

  factory ImageInfo.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('ImageInfo: expected a Map');
    }
    const allowedKeys = <String>{
      'front',
      'back',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("ImageInfo: unknown property '$key'");
      }
    }
    final hasFront = raw.containsKey('front');
    final frontRaw = raw['front'];
    SideImages? frontValue;
    if (hasFront && frontRaw != null) {
      frontValue = SideImages.fromJson(frontRaw);
    } else if (hasFront && frontRaw == null) {
      throw FormatException('ImageInfo.front: null is not allowed');
    }
    final hasBack = raw.containsKey('back');
    final backRaw = raw['back'];
    SideImages? backValue;
    if (hasBack && backRaw != null) {
      backValue = SideImages.fromJson(backRaw);
    } else if (hasBack && backRaw == null) {
      throw FormatException('ImageInfo.back: null is not allowed');
    }
    return ImageInfo(
      front: frontValue,
      back: backValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (front != null) {
      map['front'] = front!.toJson();
    }
    if (back != null) {
      map['back'] = back!.toJson();
    }
    return map;
  }
}

/// Typed builder for the `ImageInfo` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildImageInfo({
  Object? front,
  Object? back,
}) {
  final map = <String, Object?>{};
  if (front != null) {
    map['front'] = front;
  }
  if (back != null) {
    map['back'] = back;
  }
  return map;
}

///
class SideImages {
  final String? face;
  final String? croppedDocument;
  final String? frame;

  const SideImages({
    this.face,
    this.croppedDocument,
    this.frame,
  });

  factory SideImages.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('SideImages: expected a Map');
    }
    const allowedKeys = <String>{
      'face',
      'croppedDocument',
      'frame',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("SideImages: unknown property '$key'");
      }
    }
    final hasFace = raw.containsKey('face');
    final faceRaw = raw['face'];
    String? faceValue;
    if (hasFace && faceRaw != null) {
      if (faceRaw is! String) {
        throw FormatException('SideImages.face: expected a String');
      }
      faceValue = faceRaw;
    }
    final hasCroppedDocument = raw.containsKey('croppedDocument');
    final croppedDocumentRaw = raw['croppedDocument'];
    String? croppedDocumentValue;
    if (hasCroppedDocument && croppedDocumentRaw != null) {
      if (croppedDocumentRaw is! String) {
        throw FormatException('SideImages.croppedDocument: expected a String');
      }
      croppedDocumentValue = croppedDocumentRaw;
    }
    final hasFrame = raw.containsKey('frame');
    final frameRaw = raw['frame'];
    String? frameValue;
    if (hasFrame && frameRaw != null) {
      if (frameRaw is! String) {
        throw FormatException('SideImages.frame: expected a String');
      }
      frameValue = frameRaw;
    }
    return SideImages(
      face: faceValue,
      croppedDocument: croppedDocumentValue,
      frame: frameValue,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    if (face != null) {
      map['face'] = face;
    }
    if (croppedDocument != null) {
      map['croppedDocument'] = croppedDocument;
    }
    if (frame != null) {
      map['frame'] = frame;
    }
    return map;
  }
}

/// Typed builder for the `SideImages` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildSideImages({
  Object? face = _unset,
  Object? croppedDocument = _unset,
  Object? frame = _unset,
}) {
  final map = <String, Object?>{};
  if (!identical(face, _unset)) {
    map['face'] = face;
  }
  if (!identical(croppedDocument, _unset)) {
    map['croppedDocument'] = croppedDocument;
  }
  if (!identical(frame, _unset)) {
    map['frame'] = frame;
  }
  return map;
}

/// Notifies the listener that IdCapture rejected a document.
class IdCaptureListenerDidRejectId {
  final String rejectionReason;
  final String? id;
  final ImageInfo? imageInfo;
  final String? frontReviewImage;
  final int modeId;
  final String event;

  const IdCaptureListenerDidRejectId({
    required this.rejectionReason,
    this.id,
    this.imageInfo,
    this.frontReviewImage,
    required this.modeId,
    required this.event,
  });

  factory IdCaptureListenerDidRejectId.fromJson(Object? raw) {
    if (raw is! Map) {
      throw FormatException('IdCaptureListenerDidRejectId: expected a Map');
    }
    const allowedKeys = <String>{
      'rejectionReason',
      'id',
      'imageInfo',
      'frontReviewImage',
      'modeId',
      'event',
    };
    for (final key in raw.keys) {
      if (!allowedKeys.contains(key)) {
        throw FormatException("IdCaptureListenerDidRejectId: unknown property '$key'");
      }
    }
    final hasRejectionReason = raw.containsKey('rejectionReason');
    if (!hasRejectionReason) {
      throw FormatException("IdCaptureListenerDidRejectId.rejectionReason: missing required property");
    }
    final rejectionReasonRaw = raw['rejectionReason'];
    String? rejectionReasonValue;
    if (hasRejectionReason && rejectionReasonRaw != null) {
      if (rejectionReasonRaw is! String ||
          !const <String>[
            'notAcceptedDocumentType',
            'invalidFormat',
            'documentVoided',
            'timeout',
            'singleImageNotRecognized',
            'documentExpired',
            'documentExpiresSoon',
            'notRealIdCompliant',
            'holderUnderage',
            'forgedAamvaBarcode',
            'inconsistentData',
            'bluetoothCommunicationError',
            'bluetoothUnavailable',
            'cloudRequestFailed',
            'manipulatedDocument'
          ].contains(rejectionReasonRaw)) {
        throw FormatException("IdCaptureListenerDidRejectId.rejectionReason: unknown enum value '$rejectionReasonRaw'");
      }
      rejectionReasonValue = rejectionReasonRaw;
    } else if (hasRejectionReason && rejectionReasonRaw == null) {
      throw FormatException('IdCaptureListenerDidRejectId.rejectionReason: null is not allowed');
    }
    final hasId = raw.containsKey('id');
    final idRaw = raw['id'];
    String? idValue;
    if (hasId && idRaw != null) {
      if (idRaw is! String) {
        throw FormatException('IdCaptureListenerDidRejectId.id: expected a String');
      }
      idValue = idRaw;
    }
    final hasImageInfo = raw.containsKey('imageInfo');
    final imageInfoRaw = raw['imageInfo'];
    ImageInfo? imageInfoValue;
    if (hasImageInfo && imageInfoRaw != null) {
      imageInfoValue = ImageInfo.fromJson(imageInfoRaw);
    } else if (hasImageInfo && imageInfoRaw == null) {
      throw FormatException('IdCaptureListenerDidRejectId.imageInfo: null is not allowed');
    }
    final hasFrontReviewImage = raw.containsKey('frontReviewImage');
    final frontReviewImageRaw = raw['frontReviewImage'];
    String? frontReviewImageValue;
    if (hasFrontReviewImage && frontReviewImageRaw != null) {
      if (frontReviewImageRaw is! String) {
        throw FormatException('IdCaptureListenerDidRejectId.frontReviewImage: expected a String');
      }
      frontReviewImageValue = frontReviewImageRaw;
    }
    final hasModeId = raw.containsKey('modeId');
    if (!hasModeId) {
      throw FormatException("IdCaptureListenerDidRejectId.modeId: missing required property");
    }
    final modeIdRaw = raw['modeId'];
    int? modeIdValue;
    if (hasModeId && modeIdRaw != null) {
      if (modeIdRaw is! num) {
        throw FormatException('IdCaptureListenerDidRejectId.modeId: expected a number');
      }
      if (modeIdRaw != modeIdRaw.toInt()) {
        throw FormatException('IdCaptureListenerDidRejectId.modeId: expected an integer');
      }
      modeIdValue = modeIdRaw.toInt();
    } else if (hasModeId && modeIdRaw == null) {
      throw FormatException('IdCaptureListenerDidRejectId.modeId: null is not allowed');
    }
    final hasEvent = raw.containsKey('event');
    if (!hasEvent) {
      throw FormatException("IdCaptureListenerDidRejectId.event: missing required property");
    }
    final eventRaw = raw['event'];
    String? eventValue;
    if (hasEvent && eventRaw != null) {
      if (eventRaw is! String || !const <String>['IdCaptureListener.didRejectId'].contains(eventRaw)) {
        throw FormatException("IdCaptureListenerDidRejectId.event: unknown enum value '$eventRaw'");
      }
      eventValue = eventRaw;
    } else if (hasEvent && eventRaw == null) {
      throw FormatException('IdCaptureListenerDidRejectId.event: null is not allowed');
    }
    return IdCaptureListenerDidRejectId(
      rejectionReason: rejectionReasonValue!,
      id: idValue,
      imageInfo: imageInfoValue,
      frontReviewImage: frontReviewImageValue,
      modeId: modeIdValue!,
      event: eventValue!,
    );
  }

  Map<String, Object?> toJson() {
    final map = <String, Object?>{};
    map['rejectionReason'] = rejectionReason;
    if (id != null) {
      map['id'] = id;
    }
    if (imageInfo != null) {
      map['imageInfo'] = imageInfo!.toJson();
    }
    if (frontReviewImage != null) {
      map['frontReviewImage'] = frontReviewImage;
    }
    map['modeId'] = modeId;
    map['event'] = event;
    return map;
  }
}

/// Typed builder for the `IdCaptureListenerDidRejectId` wire payload. Validation-free;
/// see "THE BUILDER CONTRACT" in this file's header for the emit rule and
/// why optional+nullable parameters are `Object?` with an `_unset` default.
Map<String, Object?> buildIdCaptureListenerDidRejectId({
  required String rejectionReason,
  Object? id = _unset,
  Object? imageInfo,
  Object? frontReviewImage = _unset,
  required int modeId,
  required String event,
}) {
  final map = <String, Object?>{};
  map['rejectionReason'] = rejectionReason;
  if (!identical(id, _unset)) {
    map['id'] = id;
  }
  if (imageInfo != null) {
    map['imageInfo'] = imageInfo;
  }
  if (!identical(frontReviewImage, _unset)) {
    map['frontReviewImage'] = frontReviewImage;
  }
  map['modeId'] = modeId;
  map['event'] = event;
  return map;
}

/// Typed event dispatch for `IdCaptureListener`: parses the raw payload
/// for [eventName] into its matching generated type. Throws
/// [ArgumentError] for an event name this listener doesn't declare, and
/// [FormatException] (via the target type's `fromJson`) on a payload shape
/// mismatch -- mirrors `parseIdCaptureListenerEvent` in schemaTypes.ts.
dynamic parseIdCaptureListenerEvent(String eventName, Object? raw) {
  switch (eventName) {
    case 'didCaptureId':
      return IdCaptureListenerDidCaptureId.fromJson(raw);
    case 'didRejectId':
      return IdCaptureListenerDidRejectId.fromJson(raw);
    default:
      throw ArgumentError("IdCaptureListener: unknown event '$eventName'");
  }
}
