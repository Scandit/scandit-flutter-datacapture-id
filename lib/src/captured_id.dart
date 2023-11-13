/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'captured_result_type.dart';
import 'document_type.dart';
import 'id_image_type.dart';
import 'result/aamva_barcode_result.dart';
import 'result/argentina_id_barcode_result.dart';
import 'result/colombia_id_barcode_result.dart';
import 'result/colombia_dl_barcode_result.dart';
import 'result/date_result.dart';
import 'result/mrz_result.dart';
import 'result/south_africa_dl_barcode_result.dart';
import 'result/south_africa_id_barcode_result.dart';
import 'result/us_uniformed_barcode_result.dart';
import 'result/viz_result.dart';

@immutable
class CapturedId extends Serializable {
  final CapturedResultType _capturedResultType;
  final AamvaBarcodeResult? _aamvaBarcodeResult;
  final ColombiaIdBarcodeResult? _colombiaIdBarcodeResult;
  final ColombiaDlBarcodeResult? _colombiaDlBarcodeResult;
  final ArgentinaIdBarcodeResult? _argentinaIdBarcodeResult;
  final SouthAfricaDlBarcodeResult? _southAfricaDlBarcodeResult;
  final SouthAfricaIdBarcodeResult? _southAfricaIdBarcodeResult;
  final MrzResult? _mrzResult;
  final UsUniformedServicesBarcodeResult? _usUniformedServicesBarcodeResult;
  final VizResult? _vizResult;
  final _ImageInfo _imagesForTypes;
  final Set<CapturedResultType> _capturedResultTypes;
  final Map<String, dynamic> _json;
  final _CommonCapturedIdFields? _commonCapturedIdFields;

  CapturedId._(
      this._capturedResultType,
      this._aamvaBarcodeResult,
      this._colombiaIdBarcodeResult,
      this._colombiaDlBarcodeResult,
      this._argentinaIdBarcodeResult,
      this._southAfricaDlBarcodeResult,
      this._southAfricaIdBarcodeResult,
      this._mrzResult,
      this._usUniformedServicesBarcodeResult,
      this._vizResult,
      this._imagesForTypes,
      this._capturedResultTypes,
      this._commonCapturedIdFields,
      this._json);

  factory CapturedId.fromJSON(Map<String, dynamic> json) {
    _CommonCapturedIdFields? commonCapturedIdFields;

    AamvaBarcodeResult? dlAamvaBarcodeResult;
    if (json.containsKey("aamvaBarcodeResult") && json["aamvaBarcodeResult"] != null) {
      dlAamvaBarcodeResult = AamvaBarcodeResult.fromJSON(json["aamvaBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["aamvaBarcodeResult"]);
    }

    ColombiaIdBarcodeResult? colombiaIdBarcodeResult;
    if (json.containsKey("colombiaIdBarcodeResult") && json["colombiaIdBarcodeResult"] != null) {
      colombiaIdBarcodeResult =
          ColombiaIdBarcodeResult.fromJSON(json["colombiaIdBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["colombiaIdBarcodeResult"]);
    }

    ColombiaDlBarcodeResult? colombiaDlBarcodeResult;
    if (json.containsKey("colombiaDlBarcodeResult") && json["colombiaDlBarcodeResult"] != null) {
      colombiaDlBarcodeResult =
          ColombiaDlBarcodeResult.fromJSON(json["colombiaDlBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["colombiaDlBarcodeResult"]);
    }

    ArgentinaIdBarcodeResult? argentinaIdBarcodeResult;
    if (json.containsKey("argentinaIdBarcodeResult") && json["argentinaIdBarcodeResult"] != null) {
      argentinaIdBarcodeResult =
          ArgentinaIdBarcodeResult.fromJSON(json["argentinaIdBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["argentinaIdBarcodeResult"]);
    }

    SouthAfricaDlBarcodeResult? southAfricaDlBarcodeResult;
    if (json.containsKey("southAfricaDlBarcodeResult") && json["southAfricaDlBarcodeResult"] != null) {
      southAfricaDlBarcodeResult =
          SouthAfricaDlBarcodeResult.fromJSON(json["southAfricaDlBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["southAfricaDlBarcodeResult"]);
    }

    SouthAfricaIdBarcodeResult? southAfricaIdBarcodeResult;
    if (json.containsKey("southAfricaIdBarcodeResult") && json["southAfricaIdBarcodeResult"] != null) {
      southAfricaIdBarcodeResult =
          SouthAfricaIdBarcodeResult.fromJSON(json["southAfricaIdBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["southAfricaIdBarcodeResult"]);
    }

    MrzResult? mrzResult;
    if (json.containsKey("mrzResult") && json["mrzResult"] != null) {
      mrzResult = MrzResult.fromJSON(json["mrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["mrzResult"]);
    }

    UsUniformedServicesBarcodeResult? usUniformedServicesBarcodeResult;
    if (json.containsKey("usUniformedServicesBarcodeResult") && json["usUniformedServicesBarcodeResult"] != null) {
      usUniformedServicesBarcodeResult =
          UsUniformedServicesBarcodeResult.fromJSON(json["usUniformedServicesBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["usUniformedServicesBarcodeResult"]);
    }

    VizResult? vizResult;
    if (json.containsKey("vizResult") && json["vizResult"] != null) {
      vizResult = VizResult.fromJSON(json["vizResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["vizResult"]);
    }

    var imageInfo = (json.containsKey("imageInfo") && json["imageInfo"] != null)
        ? _ImageInfo.fromJSON(json["imageInfo"] as Map<String, dynamic>)
        : _ImageInfo._({});

    var capturedResultTypes = (json['capturedResultTypes'] as List<dynamic>)
        .map((e) => CapturedResultTypeDeserializer.fromJSON(e as String))
        .toList()
        .cast<CapturedResultType>()
        .toSet();

    return CapturedId._(
        CapturedResultTypeDeserializer.fromJSON(json["capturedResultType"] as String),
        dlAamvaBarcodeResult,
        colombiaIdBarcodeResult,
        colombiaDlBarcodeResult,
        argentinaIdBarcodeResult,
        southAfricaDlBarcodeResult,
        southAfricaIdBarcodeResult,
        mrzResult,
        usUniformedServicesBarcodeResult,
        vizResult,
        imageInfo,
        capturedResultTypes,
        commonCapturedIdFields,
        json);
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

  CapturedResultType get capturedResultType {
    return _capturedResultType;
  }

  Set<CapturedResultType> get capturedResultTypes {
    return _capturedResultTypes;
  }

  DocumentType get documentType {
    return _commonCapturedIdFields?.documentType ?? DocumentType.none;
  }

  String? get issuingCountryIso {
    return _commonCapturedIdFields?.issuingCountryIso;
  }

  String? get issuingCountry {
    return _commonCapturedIdFields?.issuingCountry;
  }

  String? get documentNumber {
    return _commonCapturedIdFields?.documentNumber;
  }

  DateResult? get dateOfExpiry {
    return _commonCapturedIdFields?.dateOfExpiry;
  }

  DateResult? get dateOfIssue {
    return _commonCapturedIdFields?.dateOfIssue;
  }

  AamvaBarcodeResult? get aamvaBarcode {
    return _aamvaBarcodeResult;
  }

  ColombiaIdBarcodeResult? get colombiaIdBarcode {
    return _colombiaIdBarcodeResult;
  }

  ColombiaDlBarcodeResult? get colombiaDlBarcode {
    return _colombiaDlBarcodeResult;
  }

  ArgentinaIdBarcodeResult? get argentinaIdBarcode {
    return _argentinaIdBarcodeResult;
  }

  SouthAfricaDlBarcodeResult? get southAfricaDlBarcode {
    return _southAfricaDlBarcodeResult;
  }

  SouthAfricaIdBarcodeResult? get southAfricaIdBarcode {
    return _southAfricaIdBarcodeResult;
  }

  MrzResult? get mrz {
    return _mrzResult;
  }

  UsUniformedServicesBarcodeResult? get usUniformedServicesBarcode {
    return _usUniformedServicesBarcodeResult;
  }

  VizResult? get viz {
    return _vizResult;
  }

  Image? getImageForType(IdImageType imageType) {
    return _imagesForTypes.getImageForType(imageType);
  }

  @override
  Map<String, dynamic> toMap() {
    return _json;
  }
}

@immutable
class _ImageInfo {
  final Map<IdImageType, String> _imagesForTypes;

  _ImageInfo._(this._imagesForTypes);

  factory _ImageInfo.fromJSON(Map<String, dynamic> json) {
    var imagesForTypes = <IdImageType, String>{};
    if (json.containsKey("face") && json["face"] != null) {
      imagesForTypes[IdImageType.face] = json["face"];
    }
    if (json.containsKey("idBack") && json["idBack"] != null) {
      imagesForTypes[IdImageType.idBack] = json["idBack"];
    }
    if (json.containsKey("idFront") && json["idFront"] != null) {
      imagesForTypes[IdImageType.idFront] = json["idFront"];
    }
    return _ImageInfo._(imagesForTypes);
  }

  Image? getImageForType(IdImageType imageType) {
    var base64Image = _imagesForTypes[imageType];
    if (base64Image == null) return null;

    return Image.memory(base64Decode(base64Image));
  }
}

@immutable
class _CommonCapturedIdFields {
  final String? _firstName;
  final String? _lastName;
  final String _fullName;
  final String? _sex;
  final DateResult? _dateOfBirth;
  final String? _nationality;
  final String? _address;
  final DocumentType _documentType;
  final String? _issuingCountryIso;
  final String? _issuingCountry;
  final String? _documentNumber;
  final DateResult? _dateOfExpiry;
  final DateResult? _dateOfIssue;

  _CommonCapturedIdFields._(
      this._firstName,
      this._lastName,
      this._fullName,
      this._sex,
      this._dateOfBirth,
      this._nationality,
      this._address,
      this._documentType,
      this._issuingCountryIso,
      this._issuingCountry,
      this._documentNumber,
      this._dateOfExpiry,
      this._dateOfIssue);

  factory _CommonCapturedIdFields.fromJSON(Map<String, dynamic> json) {
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

    return _CommonCapturedIdFields._(
        json["firstName"] as String?,
        json["lastName"] as String?,
        json["fullName"] as String,
        json["sex"] as String?,
        dateOfBirth,
        json["nationality"] as String?,
        json["address"] as String?,
        DocumentTypeDeserializer.fromJSON(json["documentType"] as String),
        json["issuingCountryIso"] as String?,
        json["issuingCountry"] as String?,
        json["documentNumber"] as String?,
        dateOfExpiry,
        dateOfIssue);
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

  DocumentType get documentType {
    return _documentType;
  }

  String? get issuingCountryIso {
    return _issuingCountryIso;
  }

  String? get issuingCountry {
    return _issuingCountry;
  }

  String? get documentNumber {
    return _documentNumber;
  }

  DateResult? get dateOfExpiry {
    return _dateOfExpiry;
  }

  DateResult? get dateOfIssue {
    return _dateOfIssue;
  }
}
