/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/data/sex.dart';
import 'package:scandit_flutter_datacapture_id/src/data/us_real_id_status.dart';
import 'package:scandit_flutter_datacapture_id/src/id_field_type.dart';
import 'package:scandit_flutter_datacapture_id/src/id_images.dart';
import 'package:scandit_flutter_datacapture_id/src/result/mobile_document_ocr_result.dart';
import 'package:scandit_flutter_datacapture_id/src/result/mobile_document_result.dart';
import 'package:scandit_flutter_datacapture_id/src/result/verification_result.dart';

import 'id_capture_document.dart';
import 'id_capture_region.dart';
import 'region_specific_subtypes.dart';
import 'result/barcode_result.dart';
import 'result/date_result.dart';
import 'result/mrz_result.dart';
import 'result/viz_result.dart';

/// This class represents the result of a document scan. It provides commonly present information, such as the holder’s name and date of birth, directly accessible at the top level. Additional document-specific details can be accessed through properties representing different zones of the document, such as the barcode, machine-readable zone (MRZ), and visual inspection zone (VIZ).
///
/// Note that not all properties are relevant to every document type. If a property is not applicable or the corresponding data could not be read, it will be set to *null*.
///
/// Added in version 6.11.0
@immutable
class CapturedId extends Serializable {
  final MrzResult? _mrzResult;
  final VizResult? _vizResult;
  final Map<String, dynamic> _json;
  final BarcodeResult? _barcodeResult;
  final IdImages _images;
  final VerificationResult _verificationResult;
  final MobileDocumentResult? _mobileDocument;
  final MobileDocumentOcrResult? _mobileDocumentOcr;

  final bool? _isExpired;
  final bool _isCitizenPassport;
  final int? _age;
  final Sex _sexType;
  final UsRealIdStatus _usRealIdStatus;

  // Common captured ID fields
  final String? _firstName;
  final String? _lastName;
  final String? _fullName;
  final String? _sex;
  final DateResult? _dateOfBirth;
  final String? _nationality;
  final String? _nationalityISO;
  final String? _address;
  final String? _documentNumber;
  final String? _documentAdditionalNumber;
  final DateResult? _dateOfExpiry;
  final DateResult? _dateOfIssue;
  final String? _issuingCountryIso;
  final IdCaptureDocument? _document;
  final IdCaptureRegion _issuingCountry;

  CapturedId._(
    this._mrzResult,
    this._vizResult,
    this._barcodeResult,
    this._age,
    this._isExpired,
    this._isCitizenPassport,
    this._images,
    this._verificationResult,
    this._json,
    this._firstName,
    this._lastName,
    this._fullName,
    this._sex,
    this._dateOfBirth,
    this._nationality,
    this._nationalityISO,
    this._address,
    this._documentNumber,
    this._documentAdditionalNumber,
    this._dateOfExpiry,
    this._dateOfIssue,
    this._issuingCountryIso,
    this._document,
    this._issuingCountry,
    this._sexType,
    this._usRealIdStatus,
    this._mobileDocument,
    this._mobileDocumentOcr,
  );

  factory CapturedId.fromJSON(Map<String, dynamic> json) {
    MrzResult? mrzResult;
    if (json["mrzResult"] != null) {
      mrzResult = MrzResult.fromJSON(json["mrzResult"] as Map<String, dynamic>);
    }

    VizResult? vizResult;
    if (json["vizResult"] != null) {
      vizResult = VizResult.fromJSON(json["vizResult"] as Map<String, dynamic>);
    }

    BarcodeResult? barcodeResult;
    if (json["barcodeResult"] != null) {
      barcodeResult = BarcodeResult.fromJSON(json["barcodeResult"] as Map<String, dynamic>);
    }

    var images = (json["imageInfo"] != null)
        ? IdImages.fromJSON(json["imageInfo"] as Map<String, dynamic>)
        : IdImages.fromJSON({});

    VerificationResult? verificationResult;

    if (json["verificationResult"] != null) {
      verificationResult = VerificationResult.fromJSON(json["verificationResult"] as Map<String, dynamic>);
    }

    // Parse common captured ID fields
    final firstName = json['firstName']?.toString();
    final lastName = json['lastName']?.toString();
    final fullName = json['fullName']?.toString();
    final sex = json['sex']?.toString();
    final dateOfBirth = json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null;
    final nationality = json['nationality']?.toString();
    final nationalityISO = json['nationalityISO']?.toString();
    final address = json['address']?.toString();
    final documentNumber = json['documentNumber']?.toString();
    final documentAdditionalNumber = json['documentAdditionalNumber']?.toString();
    final dateOfExpiry = json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null;
    final dateOfIssue = json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null;
    final issuingCountryIso = json['issuingCountryIso']?.toString();

    IdCaptureRegion issuingCountry = IdCaptureRegion.any;

    if (json['issuingCountry'] != null) {
      issuingCountry = IdCaptureRegionDeserializer.fromJSON(json['issuingCountry']);
    }

    IdCaptureDocument? document;

    if (json['documentType'] != null) {
      document = _getDocument(issuingCountry, json['documentType'], json['documentSubtype']);
    }

    Sex sexType = Sex.unspecified;
    if (sex != null) {
      sexType = SexDeserializer.fromJSON(sex);
    }

    UsRealIdStatus usRealIdStatus = UsRealIdStatus.notAvailable;
    if (json['usRealIdStatus'] != null) {
      usRealIdStatus = UsRealIdStatusDeserializer.fromJSON(json['usRealIdStatus']);
    }

    MobileDocumentResult? mobileDocument;
    if (json["mobileDocumentResult"] != null) {
      mobileDocument = MobileDocumentResult.fromJSON(json["mobileDocumentResult"] as Map<String, dynamic>);
    }

    MobileDocumentOcrResult? mobileDocumentOcr;
    if (json["mobileDocumentOcrResult"] != null) {
      mobileDocumentOcr = MobileDocumentOcrResult.fromJSON(json["mobileDocumentOcrResult"] as Map<String, dynamic>);
    }

    return CapturedId._(
      mrzResult,
      vizResult,
      barcodeResult,
      json["age"] as int?,
      json["isExpired"] as bool?,
      json["isCitizenPassport"] as bool,
      images,
      verificationResult ?? VerificationResult.fromJSON(const {}),
      json,
      firstName,
      lastName,
      fullName,
      sex,
      dateOfBirth,
      nationality,
      nationalityISO,
      address,
      documentNumber,
      documentAdditionalNumber,
      dateOfExpiry,
      dateOfIssue,
      issuingCountryIso,
      document,
      issuingCountry,
      sexType,
      usRealIdStatus,
      mobileDocument,
      mobileDocumentOcr,
    );
  }

  /// The first name of the document holder. Separated by spaces if more than one name is present. Characters can be all uppercase for document types which don’t capitalize names (for example names encoded in ICAO Machine Readable Zones). Certain documents do not distinguish between given name and surname. If the name cannot be split reliably, this field may be null.
  ///
  /// Added in version 6.11.0
  String? get firstName => _firstName;

  /// The last name of the document holder. Separated by spaces if more than one name is present. Characters can be all uppercase for document types which don’t capitalize names (for example names encoded in ICAO Machine Readable Zones). Certain documents do not distinguish between given name and surname. If the name cannot be split reliably, this field may be null.
  ///
  /// Added in version 6.11.0
  String? get lastName => _lastName;

  /// The full name of the document holder. Characters can be all uppercase for document types which don’t capitalize names (for example names encoded in ICAO Machine Readable Zones).
  ///
  /// Added in version 6.11.0
  String? get fullName => _fullName;

  /// The description of the document holder’s sex.
  ///
  /// Added in version 6.11.0
  String? get sex => _sex;

  /// The date of birth of the document holder. If the document doesn’t provide two first digits of the year then the date of birth is always set to be earlier than or equal to the scan date. For example if the year of scanning is 2021 and the document returns that the year of birth is 14 then the returned year is set to 2014. However if the document returns that the year of birth is 24 then the returned year is set to 1924.
  ///
  /// Added in version 6.11.0
  DateResult? get dateOfBirth => _dateOfBirth;

  /// The nationality of the document holder as raw OCR text from the document. The format and language vary by jurisdiction (e.g., “DEUTSCH”, “AMERICAN”, “POLSKA”, “DEU”).
  ///
  /// For a standardized ISO 3166-1 alpha-3 country code representation, use [CapturedId.nationalityISO].
  ///
  /// Added in version 6.11.0
  String? get nationality => _nationality;

  /// The holder’s nationality as an ISO 3166-1 alpha-3 country code (e.g., “DEU”, “USA”, “POL”).
  ///
  /// Returns *null* if the nationality cannot be determined or is ambiguous.
  ///
  /// Added in version 8.1.0
  String? get nationalityISO => _nationalityISO;

  /// The address of the document holder.
  ///
  /// Added in version 6.11.0
  String? get address => _address;

  /// The document type.
  ///
  /// Added in version 7.0.0
  IdCaptureDocument? get document => _document;

  /// The ISO (Alpha-3 code) abbreviation of the issuing country of the document.
  ///
  /// Added in version 6.11.0
  String? get issuingCountryIso => _issuingCountryIso;

  /// Issuing country of the document.
  ///
  /// Added in version 7.0.0
  IdCaptureRegion get issuingCountry => _issuingCountry;

  /// Indicates whether the document is of type [IdCard].
  ///
  /// Added in version 7.0.0
  bool isIdCard() => document?.isIdCard == true;

  /// Indicates whether the document is of type [DriverLicense].
  ///
  /// Added in version 7.0.0
  bool isDriverLicense() => document?.isDriverLicense == true;

  /// Indicates whether the document is of type [HealthInsuranceCard].
  ///
  /// Added in version 7.0.0
  bool isHealthInsuranceCard() => document?.isHealthInsuranceCard == true;

  /// Indicates whether the document is of type [Passport].
  ///
  /// Added in version 7.0.0
  bool isPassport() => document?.isPassport == true;

  /// Indicates whether the passport was issued to a citizen of the issuing country. Returns *false* for travel documents such as refugee, stateless, or alien passports, and for any passports issued by organizations rather than states.
  ///
  /// Added in version 8.0.0
  bool get isCitizenPassport => _isCitizenPassport == true;

  /// Indicates whether the document is of type [RegionSpecificSubtype].
  ///
  /// Added in version 7.0.0
  bool isRegionSpecific(RegionSpecificSubtype subtype) =>
      document?.isRegionSpecific == true && (document as RegionSpecific).subtype == subtype;

  /// Indicates whether the document is of type [ResidencePermit].
  ///
  /// Added in version 7.0.0
  bool isResidencePermit() => document?.isResidencePermit == true;

  /// Indicates whether the document is of type [VisaIcao].
  ///
  /// Added in version 7.0.0
  bool isVisaIcao() => document?.isVisaIcao == true;

  /// Indicates whether the document is of type [VisaLetter] (experimental document type).
  ///
  /// Added in version 8.5.0
  bool isVisaLetter() => document?.isVisaLetter == true;

  /// The document number.
  ///
  /// Added in version 6.11.0
  String? get documentNumber => _documentNumber;

  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 6.19.0
  String? get documentAdditionalNumber => _documentAdditionalNumber;

  /// The date of expiry of the document. Returning *null* with [CapturedId.isExpired] = *false* indicates that the document never expires.
  ///
  /// Added in version 6.11.0
  DateResult? get dateOfExpiry => _dateOfExpiry;

  /// The date of issue of the document. Please note that some documents may specify the exact date of issue, while other the month and the year only.
  ///
  /// Added in version 6.11.0
  DateResult? get dateOfIssue => _dateOfIssue;

  /// The additional information extracted from the Machine Readable Zone (MRZ) of a Machine Readable Travel Document (MRTD).
  ///
  /// Added in version 6.11.0
  MrzResult? get mrz => _mrzResult;

  /// The additional information extracted from a documents or its part intended to be read by humans (for example Visual Inspection Zone (VIZ) of a Machine-Readable Travel Document (MRTD)).
  ///
  /// Added in version 6.11.0
  VizResult? get viz => _vizResult;

  /// The additional information extracted from a barcode on a document.
  ///
  /// Added in version 7.0.0
  BarcodeResult? get barcode => _barcodeResult;

  /// The images extracted from a document.
  ///
  /// Added in version 7.0.0
  IdImages get images => _images;

  /// The age of the document holder. Calculated as the difference in full years between the birth date and the current local date. If *null* is returned it means that the full birth date is not available. The returned value depends on the device date. The same document may result in different values for devices with different dates (e.g. in different time zones, or with a date set manually by the user).
  ///
  /// Added in version 6.19.0
  int? get age => _age;

  /// Whether this document is expired. Calculated by comparing the document’s expiration date with the current local date. *true* if the document is expired and *false* when either not expired, or never expires. *null* is returned if the value of this property could not be determined - for example if the date of expiry is not present, or if the date of expiry couldn’t be captured. Please note that the system time is used for computation of this field so users of the device are capable of changing the result of the field by changing the system time.
  ///
  /// Added in version 6.19.0
  bool? get isExpired => _isExpired;

  /// Results of verifications automatically performed when [IdCaptureSettings.rejectInconsistentData] or [IdCaptureSettings.rejectForgedAamvaBarcodes] are enabled.
  ///
  /// Added in version 8.0.0
  VerificationResult get verificationResult => _verificationResult;

  /// The sex of the document holder.
  ///
  /// Added in version 8.0.0
  Sex get sexType => _sexType;

  /// Indicates whether the document is REAL ID compliant.
  ///
  /// Added in version 8.0.0
  UsRealIdStatus get usRealIdStatus => _usRealIdStatus;

  /// The additional information extracted from a mobile identity document.
  ///
  /// Added in version 8.0.0
  MobileDocumentResult? get mobileDocument => _mobileDocument;

  /// The additional information extracted from a mobile document using optical character recognition (OCR). This property is populated when scanning mobile driver licenses with OCR-based capture enabled (for example, Australian mobile driver licenses when the mobile scanner is enabled).
  ///
  /// Added in version 8.0.0
  MobileDocumentOcrResult? get mobileDocumentOcr => _mobileDocumentOcr;

  /// Returns a JSON string containing detailed diagnostic information about the reasons for document rejection.
  ///
  /// Added in version 8.3.0
  String get rejectionDiagnosticJSON => _json['rejectionDiagnosticJSON'] as String? ?? '';

  /// The visa number, resolved across the captured zones (MRZ preferred over VIZ).
  ///
  /// Added in version 8.7.0
  String? get visaNumber => _json['visaNumber'] as String?;

  /// The passport number, resolved across the captured zones (MRZ preferred over VIZ).
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 8.7.0
  String? get passportNumber => _json['passportNumber'] as String?;

  /// Whether the document capture is complete. Returns *true* when all sides of a multi-sided document have been captured, or when capturing a single-sided document. Returns *false* when only partial data is available (e.g., front side of a two-sided document).
  ///
  /// Added in version 8.7.0
  bool get isCapturingComplete => _json['isCapturingComplete'] as bool? ?? false;

  /// Checks whether the specified field has been anonymized.
  ///
  /// Returns *true* if the field was present in the captured document and was anonymized according to the [IdCaptureSettings.anonymizationMode] setting, *false* otherwise.
  ///
  /// A field that is not present in the document always returns *false*, even if anonymization is enabled for that field type.
  ///
  /// This method is useful for determining which fields have been redacted, particularly when using [IdCaptureSettings.anonymizationMode] set to [IdAnonymizationMode.fieldsOnly] or [IdAnonymizationMode.fieldsAndImages].
  ///
  /// Param IdFieldType fieldThe field type to check for anonymization.
  ///
  /// Added in version 8.0.0
  bool isAnonymized(IdFieldType field) {
    final anonymizedFieldsList = _json['anonymizedFields'] as List<dynamic>?;
    if (anonymizedFieldsList == null) return false;
    return anonymizedFieldsList.contains(field.toString());
  }

  /// Returns all fields that have been anonymized in this captured document.
  ///
  /// Only fields that were actually present in the captured document and were subsequently anonymized are included.
  ///
  /// Added in version 8.0.0
  List<IdFieldType> get anonymizedFields {
    final anonymizedFieldsList = _json['anonymizedFields'] as List<dynamic>?;
    if (anonymizedFieldsList == null) return [];
    return anonymizedFieldsList.map((fieldString) => IdFieldType.fromJSON(fieldString as String)).toList();
  }

  @override
  Map<String, dynamic> toMap() => _json;
}

IdCaptureDocument _getDocument(IdCaptureRegion issuingCountry, String documentTypeJson, String? documentSubtype) {
  var documentType = IdCaptureDocumentTypeDeserializer.fromJSON(documentTypeJson);

  RegionSpecificSubtype? subtype;

  if (documentSubtype != null) {
    subtype = RegionSpecificSubtypeDeserializer.fromJSON(documentSubtype);
  }

  switch (documentType) {
    case IdCaptureDocumentType.driverLicense:
      return DriverLicense(issuingCountry);
    case IdCaptureDocumentType.healthInsuranceCard:
      return HealthInsuranceCard(issuingCountry);
    case IdCaptureDocumentType.idCard:
      return IdCard(issuingCountry);
    case IdCaptureDocumentType.passport:
      return Passport(issuingCountry);
    case IdCaptureDocumentType.regionSpecific:
      if (subtype == null) {
        throw ArgumentError("Document subtype is required for region specific documents.", "documentSubtype");
      }
      return RegionSpecific(subtype);
    case IdCaptureDocumentType.residencePermit:
      return ResidencePermit(issuingCountry);
    case IdCaptureDocumentType.visaIcao:
      return VisaIcao(issuingCountry);
    case IdCaptureDocumentType.visaLetter:
      return VisaLetter(issuingCountry);
  }
}
