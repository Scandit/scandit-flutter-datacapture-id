/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'captured_result_type.dart';
import 'document_type.dart';
import 'id_image_type.dart';
import 'result/aamva_barcode_result.dart';
import 'result/argentina_id_barcode_result.dart';
import 'result/colombia_id_barcode_result.dart';
import 'result/date_result.dart';
import 'result/mrz_result.dart';
import 'result/south_africa_dl_barcode_result.dart';
import 'result/south_africa_id_barcode_result.dart';
import 'result/us_uniformed_barcode_result.dart';
import 'result/viz_result.dart';

class CapturedId {
  String? _firstName;
  String? _lastName;
  String _fullName;
  String? _sex;
  DateResult? _dateOfBirth;
  String? _nationality;
  String? _address;
  CapturedResultType _capturedResultType;
  DocumentType _documentType;
  String? _issuingCountryIso;
  String? _issuingCountry;
  String? _documentNumber;
  DateResult? _dateOfExpiry;
  DateResult? _dateOfIssue;
  AamvaBarcodeResult? _aamvaBarcodeResult;
  ColombiaIdBarcodeResult? _colombiaIdBarcodeResult;
  ArgentinaIdBarcodeResult? _argentinaIdBarcodeResult;
  SouthAfricaDlBarcodeResult? _southAfricaDlBarcodeResult;
  SouthAfricaIdBarcodeResult? _southAfricaIdBarcodeResult;
  MrzResult? _mrzResult;
  UsUniformedServicesBarcodeResult? _usUniformedServicesBarcodeResult;
  VizResult? _vizResult;
  _ImageInfo _imagesForTypes;

  CapturedId._(
      this._firstName,
      this._lastName,
      this._fullName,
      this._sex,
      this._dateOfBirth,
      this._nationality,
      this._address,
      this._capturedResultType,
      this._documentType,
      this._issuingCountryIso,
      this._issuingCountry,
      this._documentNumber,
      this._dateOfExpiry,
      this._dateOfIssue,
      this._aamvaBarcodeResult,
      this._colombiaIdBarcodeResult,
      this._argentinaIdBarcodeResult,
      this._southAfricaDlBarcodeResult,
      this._southAfricaIdBarcodeResult,
      this._mrzResult,
      this._usUniformedServicesBarcodeResult,
      this._vizResult,
      this._imagesForTypes);

  factory CapturedId.fromJSON(Map<String, dynamic> json) {
    DateResult? dateOfBirth;
    if (json.containsKey("dateOfBirth") && json["dateOfBirth"] != null) {
      dateOfBirth = DateResult.fromJSON(json["dateOfBirth"] as Map<String, dynamic>);
    }

    DateResult? dateOfExpiry;
    if (json.containsKey("dateOfExpiry") && json["dateOfExpiry"] != null) {
      dateOfExpiry = DateResult.fromJSON(json["dateOfExpiry"] as Map<String, dynamic>);
    }

    DateResult? dateOfIssue;
    if (json.containsKey("dateOfIssue") && json["dateOfIssue"] != null) {
      dateOfIssue = DateResult.fromJSON(json["dateOfIssue"] as Map<String, dynamic>);
    }

    AamvaBarcodeResult? dlAamvaBarcodeResult;
    if (json.containsKey("aamvaBarcodeResult") && json["aamvaBarcodeResult"] != null) {
      dlAamvaBarcodeResult = AamvaBarcodeResult.fromJSON(json["aamvaBarcodeResult"] as Map<String, dynamic>);
    }

    ColombiaIdBarcodeResult? colombiaIdBarcodeResult;
    if (json.containsKey("colombiaIdBarcodeResult") && json["colombiaIdBarcodeResult"] != null) {
      colombiaIdBarcodeResult =
          ColombiaIdBarcodeResult.fromJSON(json["colombiaIdBarcodeResult"] as Map<String, dynamic>);
    }

    ArgentinaIdBarcodeResult? argentinaIdBarcodeResult;
    if (json.containsKey("argentinaIdBarcodeResult") && json["argentinaIdBarcodeResult"] != null) {
      argentinaIdBarcodeResult =
          ArgentinaIdBarcodeResult.fromJSON(json["argentinaIdBarcodeResult"] as Map<String, dynamic>);
    }

    SouthAfricaDlBarcodeResult? southAfricaDlBarcodeResult;
    if (json.containsKey("southAfricaDlBarcodeResult") && json["southAfricaDlBarcodeResult"] != null) {
      southAfricaDlBarcodeResult =
          SouthAfricaDlBarcodeResult.fromJSON(json["southAfricaDlBarcodeResult"] as Map<String, dynamic>);
    }

    SouthAfricaIdBarcodeResult? southAfricaIdBarcodeResult;
    if (json.containsKey("southAfricaIdBarcodeResult") && json["southAfricaIdBarcodeResult"] != null) {
      southAfricaIdBarcodeResult =
          SouthAfricaIdBarcodeResult.fromJSON(json["southAfricaIdBarcodeResult"] as Map<String, dynamic>);
    }

    MrzResult? mrzResult;
    if (json.containsKey("mrzResult") && json["mrzResult"] != null) {
      mrzResult = MrzResult.fromJSON(json["mrzResult"] as Map<String, dynamic>);
    }

    UsUniformedServicesBarcodeResult? usUniformedServicesBarcodeResult;
    if (json.containsKey("usUniformedServicesBarcodeResult") && json["usUniformedServicesBarcodeResult"] != null) {
      usUniformedServicesBarcodeResult =
          UsUniformedServicesBarcodeResult.fromJSON(json["usUniformedServicesBarcodeResult"] as Map<String, dynamic>);
    }

    VizResult? vizResult;
    if (json.containsKey("vizResult") && json["vizResult"] != null) {
      vizResult = VizResult.fromJSON(json["vizResult"] as Map<String, dynamic>);
    }

    var imageInfo = (json.containsKey("imageInfo") && json["imageInfo"] != null)
        ? _ImageInfo.fromJSON(json["imageInfo"] as Map<String, dynamic>)
        : _ImageInfo._({});

    return CapturedId._(
        json["firstName"] as String?,
        json["lastName"] as String?,
        json["fullName"] as String,
        json["sex"] as String?,
        dateOfBirth,
        json["nationality"] as String?,
        json["address"] as String?,
        CapturedResultTypeDeserializer.fromJSON(json["capturedResultType"] as String),
        DocumentTypeDeserializer.fromJSON(json["documentType"] as String),
        json["issuingCountryIso"] as String?,
        json["issuingCountry"] as String?,
        json["documentNumber"] as String?,
        dateOfExpiry,
        dateOfIssue,
        dlAamvaBarcodeResult,
        colombiaIdBarcodeResult,
        argentinaIdBarcodeResult,
        southAfricaDlBarcodeResult,
        southAfricaIdBarcodeResult,
        mrzResult,
        usUniformedServicesBarcodeResult,
        vizResult,
        imageInfo);
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

  CapturedResultType get capturedResultType {
    return _capturedResultType;
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

  AamvaBarcodeResult? get aamvaBarcode {
    return _aamvaBarcodeResult;
  }

  ColombiaIdBarcodeResult? get colombiaIdBarcode {
    return _colombiaIdBarcodeResult;
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
}

class _ImageInfo {
  Map<IdImageType, String> _imagesForTypes;

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
