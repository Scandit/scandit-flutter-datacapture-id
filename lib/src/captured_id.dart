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

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  String? get sex => _sex;

  DateResult? get dateOfBirth => _dateOfBirth;

  String? get nationality => _nationality;

  String? get nationalityISO => _nationalityISO;

  String? get address => _address;

  IdCaptureDocument? get document => _document;

  String? get issuingCountryIso => _issuingCountryIso;

  IdCaptureRegion get issuingCountry => _issuingCountry;

  bool isIdCard() => document?.isIdCard == true;

  bool isDriverLicense() => document?.isDriverLicense == true;

  bool isHealthInsuranceCard() => document?.isHealthInsuranceCard == true;

  bool isPassport() => document?.isPassport == true;

  bool get isCitizenPassport => _isCitizenPassport == true;

  bool isRegionSpecific(RegionSpecificSubtype subtype) =>
      document?.isRegionSpecific == true && (document as RegionSpecific).subtype == subtype;

  bool isResidencePermit() => document?.isResidencePermit == true;

  bool isVisaIcao() => document?.isVisaIcao == true;

  String? get documentNumber => _documentNumber;

  String? get documentAdditionalNumber => _documentAdditionalNumber;

  DateResult? get dateOfExpiry => _dateOfExpiry;

  DateResult? get dateOfIssue => _dateOfIssue;

  MrzResult? get mrz => _mrzResult;

  VizResult? get viz => _vizResult;

  BarcodeResult? get barcode => _barcodeResult;

  IdImages get images => _images;

  int? get age => _age;

  bool? get isExpired => _isExpired;

  VerificationResult get verificationResult => _verificationResult;

  Sex get sexType => _sexType;

  UsRealIdStatus get usRealIdStatus => _usRealIdStatus;

  MobileDocumentResult? get mobileDocument => _mobileDocument;

  MobileDocumentOcrResult? get mobileDocumentOcr => _mobileDocumentOcr;

  bool isAnonymized(IdFieldType field) {
    final anonymizedFieldsList = _json['anonymizedFields'] as List<dynamic>?;
    if (anonymizedFieldsList == null) return false;
    return anonymizedFieldsList.contains(field.toString());
  }

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
  }
}
