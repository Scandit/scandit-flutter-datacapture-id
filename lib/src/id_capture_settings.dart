/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/id_field_type.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/duration_extensions.dart';

import 'id_capture_document.dart';
import 'id_capture_scanner.dart';
import 'id_image_type.dart';
import 'result/passport_type.dart';
import 'id_anonymization_mode.dart';
import 'internal/id_capture_defaults.dart';
import 'generated/id_generated_defaults.dart';

/// Settings to configure an [IdCapture] instance.
///
/// Added in version 6.11.0
class IdCaptureSettings implements Serializable {
  final Map<String, dynamic> _properties = {};
  final Map<IdImageType, dynamic> _imageToResult = {};
  final Map<String, Set<String>> _anonymizationMap = {};

  /// Creates a new default settings. By default the scanner is an instance of [SingleSideScanner] that does not scan anything, and [IdCaptureSettings.acceptedDocuments] is empty.
  ///
  /// Added in version 8.0.0
  IdCaptureSettings();

  /// Documents that should be accepted by the ID Capture scanner. You may accept individual document categories (like ID cards or passports) globally or narrow the selection by region or country, offering granular control over the scanning configuration.
  ///
  /// All documents not specified by this setting are rejected.
  ///
  /// Refer to the Supported Documents section for the full list of document types and regions.
  ///
  /// Added in version 7.0.0
  List<IdCaptureDocument> acceptedDocuments = [];

  /// Documents to reject during ID capture, even if they match types defined in “acceptedDocuments”. This property is useful for enforcing restrictions on documents from certain regions or countries.
  ///
  /// Refer to the Supported Documents section for the full list of document types and regions.
  ///
  /// Added in version 7.0.0
  List<IdCaptureDocument> rejectedDocuments = [];

  /// Enables rejection of passports whose [PassportType] is in the given set. The sub-type is derived from the machine-readable zone, so this applies to documents scanned with an MRZ. Matching documents are routed to IdCaptureListener.didRejectId() with [RejectionReason.notAcceptedDocumentType]. Empty by default, which rejects nothing. A passport whose type cannot be determined reliably is reported as `Unknown`, and is rejected only if that value is in the set. See [PassportType] for the rules.
  ///
  /// Added in version 8.7.0
  Set<PassportType> rejectPassportTypes = {};

  /// Defines the scanner configuration for capturing identity documents, including physical documents and mobile documents.
  ///
  /// For physical document scanning, assign an [IdCaptureScanner] wrapping either a [FullDocumentScanner] (comprehensive scanning of all zones and both sides of card-format documents) or a [SingleSideScanner] (targeted zone scanning). For mobile documents (mDL, mdoc), use a [MobileDocumentScanner] instead. There is no default that captures any document — this property must be explicitly set before creating the [IdCapture] instance.
  ///
  /// Added in version 7.0.0
  IdCaptureScanner scanner = IdCaptureScanner();

  /// Sets a property to the provided value. Use this method to set properties that are not yet part of a stable API. Properties set through this method may change in a future release.
  ///
  /// Added in version 6.11.0
  void setProperty<T>(String name, T value) {
    _properties[name] = value;
  }

  /// Retrieves the value of a previously set property. In case the property does not exist, an [ArgumentException](https://learn.microsoft.com/en-us/dotnet/api/system.argumentexception) is thrown.
  ///
  /// Added in version 6.11.0
  T getProperty<T>(String name) {
    return _properties[name] as T;
  }

  /// Sets whether an [IdCapture] created with these settings should extract an image (specified by the given type) from recognized documents and return it as part of [CapturedId]. Note that the image may still not be returned, for example, if it’s not present in a document or if it’s not recognized. Default is *false*.
  ///
  /// Added in version 6.11.0
  void setShouldPassImageTypeToResult(IdImageType type, bool shouldPass) {
    _imageToResult[type] = shouldPass;
  }

  /// Gets whether an [IdCapture] created with these settings should extract an image (specified by the given type) from recognized documents and return it as part of [CapturedId]. Note that the image may still not be returned, for example, if it’s not present in a document or if it’s not recognized. Default is *false*.
  ///
  /// Added in version 6.11.0
  bool getShouldPassImageTypeToResult(IdImageType type) {
    return _imageToResult.containsKey(type) ? _imageToResult[type] : false;
  }

  /// When enabled, this setting removes protected data from images and result fields of certain document types. Enabling anonymization helps to remain compliant with local legal requirements which restrict the collection of some data. Examples of affected fields are the document number on German IDs or the personal ID number on Dutch driver’s licenses. By default set to [IdAnonymizationMode.fieldsOnly].
  ///
  /// Added in version 6.19.0
  IdAnonymizationMode anonymizationMode = IdCaptureDefaults.captureSettingsDefaults.anonymizationMode;

  /// Controls whether the SDK applies default anonymization rules for specific document types and regions. When enabled, the SDK automatically anonymizes fields that are protected by default for certain document types.
  ///
  /// When disabled, only fields explicitly added via [IdCaptureSettings.addAnonymizedField] will be anonymized.
  ///
  /// This provides fine-grained control over which data is anonymized, allowing compliance with specific legal requirements. Default is *true*.
  ///
  /// Added in version 8.2.0
  bool anonymizeDefaultFields = IdCaptureDefaults.captureSettingsDefaults.anonymizeDefaultFields;

  /// This setting enables rejection of voided documents. This feature has been primarily developed for US Driver’s Licenses, the results might not be accurate when scanning other document types.
  ///
  /// Added in version 6.25.0
  bool rejectVoidedIds = IdCaptureDefaults.captureSettingsDefaults.rejectVoidedIds;

  /// Enables rejection of expired documents. When enabled, expired documents are routed to IdCaptureListener.didRejectId() with [RejectionReason.documentExpired] instead of being reported as captured.
  ///
  /// Added in version 7.6.0
  bool rejectExpiredIds = IdCaptureDefaults.captureSettingsDefaults.rejectExpiredIds;

  /// Enables rejection of documents that will expire within the specified duration. The duration components are applied on the date of expiry in the following order: years, months and days. Enabling this setting automatically enables the rejection of expired IDs.
  ///
  /// Added in version 7.6.0
  Duration? rejectIdsExpiringIn = IdCaptureDefaults.captureSettingsDefaults.rejectIdsExpiringIn;

  /// Enables rejection of documents that are not REAL ID compliant.
  ///
  /// Added in version 7.6.0
  bool rejectNotRealIdCompliant = IdCaptureDefaults.captureSettingsDefaults.rejectNotRealIdCompliant;

  /// Enables rejection of documents with a forged AAMVA barcode. When enabled, forged documents are routed to IdCaptureListener.didRejectId() with [RejectionReason.forgedAamvaBarcode]. Verification is performed automatically by the SDK — no separate verifier object is required on iOS.
  ///
  /// Added in version 7.6.0
  bool rejectForgedAamvaBarcodes = IdCaptureDefaults.captureSettingsDefaults.rejectForgedAamvaBarcodes;

  /// Enables rejection of documents with inconsistent data between zones (e.g., barcode vs. VIZ). When enabled, inconsistent documents are routed to IdCaptureListener.didRejectId() with [RejectionReason.inconsistentData].
  ///
  /// The detailed result, including a front review image, is accessible via [CapturedId.verificationResult]. See also [IdCaptureSettings.setShouldPassImageTypeToResult].
  ///
  /// Added in version 7.6.0
  bool rejectInconsistentData = IdCaptureDefaults.captureSettingsDefaults.rejectInconsistentData;

  /// Enables rejection of documents whose holder is below the specified age. When set, underage documents are routed to IdCaptureListener.didRejectId() with [RejectionReason.holderUnderage].
  ///
  /// Added in version 7.6.0
  int? rejectHolderBelowAge = IdCaptureDefaults.captureSettingsDefaults.rejectHolderBelowAge;

  /// This setting enables the extraction of additional data about vehicle categories from the back of European driver’s licenses, like issue and expiry dates.
  ///
  /// Added in version 7.0.0
  bool decodeBackOfEuropeanDrivingLicense =
      IdCaptureDefaults.captureSettingsDefaults.decodeBackOfEuropeanDrivingLicense ?? false;

  /// The timeout in seconds for document localization without successful capture. When a document is localized but not captured within this duration, the IdCaptureListener.didRejectId() callback is triggered with [RejectionReason.timeout]. Default is 6 seconds. Values less than or equal to 0 reset to the default value.
  ///
  /// Added in version 8.5.0
  int rejectionTimeoutSeconds = IdCaptureDefaults.captureSettingsDefaults.rejectionTimeoutSeconds;

  // Reads the generated constant directly, unlike its neighbours: the native
  // defaults payload does not carry this key, so routing it through
  // IdCaptureSettingsDefaults would add an override point that can never fire.
  /// When enabled, callbacks will be fired for both front and back side captures when scanning double-sided documents. This allows applications to receive partial results even if the back side scan fails. When disabled (default), callbacks are only fired when document recognition is complete. Use [CapturedId.isCapturingComplete] to determine if the captured result represents a complete or partial recognition.
  ///
  /// Added in version 8.7.0
  bool notifyOnSideCapture = IdCaptureSettingsGeneratedDefaults.notifyOnSideCapture;

  /// Adds a specific field to be anonymized for the specified document type and region. This method allows fine-grained control over which fields are anonymized, complementing the global [IdCaptureSettings.anonymizationMode] setting. Fields added through this method will be anonymized in addition to any default anonymization rules for the document type.
  ///
  /// Added in version 8.0.0
  void addAnonymizedField(IdCaptureDocument document, IdFieldType fieldType) {
    final key = jsonEncode(document.toMap());
    _anonymizationMap[key] = (_anonymizationMap[key] ?? {})..add(fieldType.toString());
  }

  /// Removes a previously added anonymized field for the specified document type and region. This method provides fine-grained control over anonymization settings, allowing dynamic adjustment of which fields should be anonymized. If the field was not previously added, this operation has no effect.
  ///
  /// Added in version 8.5.0
  void removeAnonymizedField(IdCaptureDocument document, IdFieldType fieldType) {
    final key = jsonEncode(document.toMap());
    final fields = _anonymizationMap[key];
    if (fields == null) return;
    fields.remove(fieldType.toString());
    if (fields.isEmpty) {
      _anonymizationMap.remove(key);
    }
  }

  /// Removes all previously added anonymized fields from the settings.
  ///
  /// Added in version 8.5.0
  void clearAnonymizedFields() {
    _anonymizationMap.clear();
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'imageToResult': _imageToResult.map((key, value) => MapEntry(key.toString(), value)),
      'anonymizationMode': anonymizationMode.toString(),
      'anonymizeDefaultFields': anonymizeDefaultFields,
      'rejectVoidedIds': rejectVoidedIds,
      'decodeBackOfEuropeanDrivingLicense': decodeBackOfEuropeanDrivingLicense,
      'scanner': scanner.toMap(),
      'acceptedDocuments': acceptedDocuments.map((doc) => doc.toMap()).toList(),
      'rejectedDocuments': rejectedDocuments.map((doc) => doc.toMap()).toList(),
      'rejectPassportTypes': rejectPassportTypes.map((type) => type.toString()).toList(),
      'rejectExpiredIds': rejectExpiredIds,
      'rejectIdsExpiringIn': rejectIdsExpiringIn?.toMap(DateTime.now()),
      'rejectNotRealIdCompliant': rejectNotRealIdCompliant,
      'rejectForgedAamvaBarcodes': rejectForgedAamvaBarcodes,
      'rejectInconsistentData': rejectInconsistentData,
      'rejectHolderBelowAge': rejectHolderBelowAge,
      'rejectionTimeoutSeconds': rejectionTimeoutSeconds,
      'anonymizationMap': _anonymizationMap.map((key, value) => MapEntry(key, value.toList())),
      'notifyOnSideCapture': notifyOnSideCapture,
      'properties': _properties,
    };
  }
}
