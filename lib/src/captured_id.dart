/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/id_images.dart';

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
  final _CommonCapturedIdFields? _commonCapturedIdFields;
  final BarcodeResult? _barcodeResult;
  final IdImages _images;

  final bool? _isExpired;
  final int? _age;

  CapturedId._(this._mrzResult, this._vizResult, this._barcodeResult, this._commonCapturedIdFields, this._age,
      this._isExpired, this._images, this._json);

  factory CapturedId.fromJSON(Map<String, dynamic> json) {
    _CommonCapturedIdFields? commonCapturedIdFields;

    MrzResult? mrzResult;
    if (json["mrzResult"] != null) {
      mrzResult = MrzResult.fromJSON(json["mrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["mrzResult"], commonCapturedIdFields);
    }

    VizResult? vizResult;
    if (json["vizResult"] != null) {
      vizResult = VizResult.fromJSON(json["vizResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["vizResult"], commonCapturedIdFields);
    }

    BarcodeResult? barcodeResult;
    if (json["barcodeResult"] != null) {
      barcodeResult = BarcodeResult.fromJSON(json["barcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["barcodeResult"], commonCapturedIdFields);
    }

    var images = (json["imageInfo"] != null)
        ? IdImages.fromJSON(json["imageInfo"] as Map<String, dynamic>)
        : IdImages.fromJSON({});

    return CapturedId._(mrzResult, vizResult, barcodeResult, commonCapturedIdFields, json["age"] as int?,
        json["isExpired"] as bool?, images, json);
  }

  String? get firstName {
    return _commonCapturedIdFields?.firstName;
  }

  String? get lastName {
    return _commonCapturedIdFields?.lastName;
  }

  String get fullName {
    return _commonCapturedIdFields?.fullName ?? "";
  }

  String? get sex {
    return _commonCapturedIdFields?.sex;
  }

  DateResult? get dateOfBirth {
    return _commonCapturedIdFields?.dateOfBirth;
  }

  String? get nationality {
    return _commonCapturedIdFields?.nationality;
  }

  String? get address {
    return _commonCapturedIdFields?.address;
  }

  IdCaptureDocument? get document {
    return _commonCapturedIdFields?.document;
  }

  String? get issuingCountryIso {
    return _commonCapturedIdFields?.issuingCountryIso;
  }

  IdCaptureRegion get issuingCountry {
    return _commonCapturedIdFields?.issuingCountry ?? IdCaptureRegion.any;
  }

  bool isIdCard() => document?.isIdCard == true;

  bool isDriverLicense() => document?.isDriverLicense == true;

  bool isHealthInsuranceCard() => document?.isHealthInsuranceCard == true;

  bool isPassport() => document?.isPassport == true;

  bool isRegionSpecific(RegionSpecificSubtype subtype) =>
      document?.isRegionSpecific == true && (document as RegionSpecific).subtype == subtype;

  bool isResidencePermit() => document?.isResidencePermit == true;

  bool isVisaIcao() => document?.isVisaIcao == true;

  String? get documentNumber {
    return _commonCapturedIdFields?.documentNumber;
  }

  String? get documentAdditionalNumber {
    return _commonCapturedIdFields?._documentAdditionalNumber;
  }

  DateResult? get dateOfExpiry {
    return _commonCapturedIdFields?.dateOfExpiry;
  }

  DateResult? get dateOfIssue {
    return _commonCapturedIdFields?.dateOfIssue;
  }

  MrzResult? get mrz {
    return _mrzResult;
  }

  VizResult? get viz {
    return _vizResult;
  }

  BarcodeResult? get barcode {
    return _barcodeResult;
  }

  IdImages get images => _images;

  int? get age {
    return _age;
  }

  bool? get isExpired {
    return _isExpired;
  }

  @override
  Map<String, dynamic> toMap() {
    return _json;
  }
}

class _CommonCapturedIdFields {
  String? _firstName;
  String? _lastName;
  String _fullName;
  String? _sex;
  DateResult? _dateOfBirth;
  String? _nationality;
  String? _address;
  IdCaptureDocument? _document;
  String? _issuingCountryIso;
  IdCaptureRegion _issuingCountry;
  String? _documentNumber;
  String? _documentAdditionalNumber;
  DateResult? _dateOfExpiry;
  DateResult? _dateOfIssue;

  _CommonCapturedIdFields._(
      this._firstName,
      this._lastName,
      this._fullName,
      this._sex,
      this._dateOfBirth,
      this._nationality,
      this._address,
      this._document,
      this._issuingCountryIso,
      this._issuingCountry,
      this._documentNumber,
      this._documentAdditionalNumber,
      this._dateOfExpiry,
      this._dateOfIssue);

  factory _CommonCapturedIdFields.fromJSON(Map<String, dynamic> json, _CommonCapturedIdFields? existingInstance) {
    DateResult? dateOfExpiry;
    if (json.containsKey("dateOfExpiry") && json["dateOfExpiry"] != null) {
      dateOfExpiry = DateResult.fromJSON(json["dateOfExpiry"] as Map<String, dynamic>);
    }

    DateResult? dateOfIssue;
    if (json.containsKey("dateOfIssue") && json["dateOfIssue"] != null) {
      dateOfIssue = DateResult.fromJSON(json["dateOfIssue"] as Map<String, dynamic>);
    }

    DateResult? dateOfBirth;
    if (json.containsKey("dateOfBirth") && json["dateOfBirth"] != null) {
      dateOfBirth = DateResult.fromJSON(json["dateOfBirth"] as Map<String, dynamic>);
    }

    var firstName = json["firstName"] as String?;
    var lastName = json["lastName"] as String?;
    var fullName = json["fullName"] as String;
    var sex = json["sex"] as String?;
    var nationality = json["nationality"] as String?;
    var address = json["address"] as String?;

    var issuingCountryIso = json["issuingCountryIso"] as String?;

    var documentNumber = json["documentNumber"] as String?;

    var documentAdditionalNumber = json["documentAdditionalNumber"] as String?;

    var issuingCountry = IdCaptureRegionDeserializer.fromJSON(json['issuingCountry']);

    IdCaptureDocument? document;

    if (json['documentType'] != null) {
      document = _CommonCapturedIdFields._getDocument(issuingCountry, json['documentType'], json['documentSubtype']);
    }

    if (existingInstance != null) {
      existingInstance._firstName ??= firstName;
      existingInstance._lastName ??= lastName;
      if (existingInstance._fullName.isEmpty) {
        existingInstance._fullName = fullName;
      }
      existingInstance._sex ??= sex;
      existingInstance._dateOfBirth ??= dateOfBirth;
      existingInstance._nationality ??= nationality;
      existingInstance._address ??= address;
      existingInstance._issuingCountryIso ??= issuingCountryIso;
      existingInstance._documentNumber ??= documentNumber;
      existingInstance._documentAdditionalNumber ??= documentAdditionalNumber;
      existingInstance._dateOfExpiry ??= dateOfExpiry;
      existingInstance._dateOfIssue ??= dateOfIssue;
      return existingInstance;
    }

    return _CommonCapturedIdFields._(
      firstName,
      lastName,
      fullName,
      sex,
      dateOfBirth,
      nationality,
      address,
      document,
      issuingCountryIso,
      issuingCountry,
      documentNumber,
      documentAdditionalNumber,
      dateOfExpiry,
      dateOfIssue,
    );
  }

  String? get firstName {
    return _firstName;
  }

  String? get lastName {
    return _lastName;
  }

  String get fullName {
    return _fullName;
  }

  String? get sex {
    return _sex;
  }

  DateResult? get dateOfBirth {
    return _dateOfBirth;
  }

  String? get nationality {
    return _nationality;
  }

  String? get address {
    return _address;
  }

  IdCaptureDocument? get document {
    return _document;
  }

  String? get issuingCountryIso {
    return _issuingCountryIso;
  }

  IdCaptureRegion get issuingCountry {
    return _issuingCountry;
  }

  String? get documentNumber {
    return _documentNumber;
  }

  String? get documentAdditionalNumber {
    return _documentAdditionalNumber;
  }

  DateResult? get dateOfExpiry {
    return _dateOfExpiry;
  }

  DateResult? get dateOfIssue {
    return _dateOfIssue;
  }

  static IdCaptureDocument _getDocument(
      IdCaptureRegion issuingCountry, String documentTypeJson, String? documentSubtype) {
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
}
