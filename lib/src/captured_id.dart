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
import 'result/apec_business_travel_card_mrz_result.dart';
import 'result/argentina_id_barcode_result.dart';
import 'result/china_exit_entry_permit_mrz_result.dart';
import 'result/china_mainland_travel_permit_mrz_result.dart';
import 'result/china_one_way_permit_back_mrz_result.dart';
import 'result/china_one_way_permit_front_mrz_result.dart';
import 'result/colombia_id_barcode_result.dart';
import 'result/colombia_dl_barcode_result.dart';
import 'result/common-access-card-barcode-result.dart';
import 'result/date_result.dart';
import 'result/mrz_result.dart';
import 'result/south_africa_dl_barcode_result.dart';
import 'result/south_africa_id_barcode_result.dart';
import 'result/us_uniformed_barcode_result.dart';
import 'result/us_visa_viz_result.dart';
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
  final ChinaMainlandTravelPermitMrzResult? _chinaMainlandTravelPermitMrz;
  final ChinaExitEntryPermitMrzResult? _chinaExitEntryPermitMrz;
  final ChinaOneWayPermitBackMrzResult? _chinaOneWayPermitBackMrz;
  final ChinaOneWayPermitFrontMrzResult? _chinaOneWayPermitFrontMrz;
  final ApecBusinessTravelCardMrzResult? _apecBusinessTravelCardMrz;
  final UsVisaVizResult? _usVisaVizResult;
  final CommonAccessCardBarcodeResult? _commonAccessCardBarcode;
  final _ImageInfo _imagesForTypes;
  final Set<CapturedResultType> _capturedResultTypes;
  final Map<String, dynamic> _json;
  final _CommonCapturedIdFields? _commonCapturedIdFields;

  final bool? _isExpired;
  final int? _age;

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
      this._chinaMainlandTravelPermitMrz,
      this._chinaExitEntryPermitMrz,
      this._chinaOneWayPermitBackMrz,
      this._chinaOneWayPermitFrontMrz,
      this._apecBusinessTravelCardMrz,
      this._usVisaVizResult,
      this._commonAccessCardBarcode,
      this._imagesForTypes,
      this._capturedResultTypes,
      this._commonCapturedIdFields,
      this._age,
      this._isExpired,
      this._json);

  factory CapturedId.fromJSON(Map<String, dynamic> json) {
    _CommonCapturedIdFields? commonCapturedIdFields;

    AamvaBarcodeResult? dlAamvaBarcodeResult;
    if (json.containsKey("aamvaBarcodeResult") && json["aamvaBarcodeResult"] != null) {
      dlAamvaBarcodeResult = AamvaBarcodeResult.fromJSON(json["aamvaBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["aamvaBarcodeResult"], commonCapturedIdFields);
    }

    ColombiaIdBarcodeResult? colombiaIdBarcodeResult;
    if (json.containsKey("colombiaIdBarcodeResult") && json["colombiaIdBarcodeResult"] != null) {
      colombiaIdBarcodeResult =
          ColombiaIdBarcodeResult.fromJSON(json["colombiaIdBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["colombiaIdBarcodeResult"], commonCapturedIdFields);
    }

    ColombiaDlBarcodeResult? colombiaDlBarcodeResult;
    if (json.containsKey("colombiaDlBarcodeResult") && json["colombiaDlBarcodeResult"] != null) {
      colombiaDlBarcodeResult =
          ColombiaDlBarcodeResult.fromJSON(json["colombiaDlBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["colombiaDlBarcodeResult"], commonCapturedIdFields);
    }

    ArgentinaIdBarcodeResult? argentinaIdBarcodeResult;
    if (json.containsKey("argentinaIdBarcodeResult") && json["argentinaIdBarcodeResult"] != null) {
      argentinaIdBarcodeResult =
          ArgentinaIdBarcodeResult.fromJSON(json["argentinaIdBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["argentinaIdBarcodeResult"], commonCapturedIdFields);
    }

    SouthAfricaDlBarcodeResult? southAfricaDlBarcodeResult;
    if (json.containsKey("southAfricaDlBarcodeResult") && json["southAfricaDlBarcodeResult"] != null) {
      southAfricaDlBarcodeResult =
          SouthAfricaDlBarcodeResult.fromJSON(json["southAfricaDlBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["southAfricaDlBarcodeResult"], commonCapturedIdFields);
    }

    SouthAfricaIdBarcodeResult? southAfricaIdBarcodeResult;
    if (json.containsKey("southAfricaIdBarcodeResult") && json["southAfricaIdBarcodeResult"] != null) {
      southAfricaIdBarcodeResult =
          SouthAfricaIdBarcodeResult.fromJSON(json["southAfricaIdBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["southAfricaIdBarcodeResult"], commonCapturedIdFields);
    }

    MrzResult? mrzResult;
    if (json.containsKey("mrzResult") && json["mrzResult"] != null) {
      mrzResult = MrzResult.fromJSON(json["mrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["mrzResult"], commonCapturedIdFields);
    }

    UsUniformedServicesBarcodeResult? usUniformedServicesBarcodeResult;
    if (json.containsKey("usUniformedServicesBarcodeResult") && json["usUniformedServicesBarcodeResult"] != null) {
      usUniformedServicesBarcodeResult =
          UsUniformedServicesBarcodeResult.fromJSON(json["usUniformedServicesBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["usUniformedServicesBarcodeResult"], commonCapturedIdFields);
    }

    VizResult? vizResult;
    if (json.containsKey("vizResult") && json["vizResult"] != null) {
      vizResult = VizResult.fromJSON(json["vizResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["vizResult"], commonCapturedIdFields);
    }

    ChinaMainlandTravelPermitMrzResult? chinaMainlandTravelPermitMrz;
    if (json.containsKey("chinaMainlandTravelPermitMrzResult") && json["chinaMainlandTravelPermitMrzResult"] != null) {
      chinaMainlandTravelPermitMrz = ChinaMainlandTravelPermitMrzResult.fromJSON(
          json["chinaMainlandTravelPermitMrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["chinaMainlandTravelPermitMrzResult"], commonCapturedIdFields);
    }

    ChinaExitEntryPermitMrzResult? chinaExitEntryPermitMrz;
    if (json.containsKey("chinaExitEntryPermitMrzResult") && json["chinaExitEntryPermitMrzResult"] != null) {
      chinaExitEntryPermitMrz =
          ChinaExitEntryPermitMrzResult.fromJSON(json["chinaExitEntryPermitMrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["chinaExitEntryPermitMrzResult"], commonCapturedIdFields);
    }

    ChinaOneWayPermitBackMrzResult? chinaOneWayPermitBackMrz;
    if (json.containsKey("chinaOneWayPermitBackMrzResult") && json["chinaOneWayPermitBackMrzResult"] != null) {
      chinaOneWayPermitBackMrz =
          ChinaOneWayPermitBackMrzResult.fromJSON(json["chinaOneWayPermitBackMrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["chinaOneWayPermitBackMrzResult"], commonCapturedIdFields);
    }

    ChinaOneWayPermitFrontMrzResult? chinaOneWayPermitFrontMrz;
    if (json.containsKey("chinaOneWayPermitFrontMrzResult") && json["chinaOneWayPermitFrontMrzResult"] != null) {
      chinaOneWayPermitFrontMrz =
          ChinaOneWayPermitFrontMrzResult.fromJSON(json["chinaOneWayPermitFrontMrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["chinaOneWayPermitFrontMrzResult"], commonCapturedIdFields);
    }

    ApecBusinessTravelCardMrzResult? apecBusinessTravelCardMrz;
    if (json.containsKey("apecBusinessTravelCardMrzResult") && json["apecBusinessTravelCardMrzResult"] != null) {
      apecBusinessTravelCardMrz =
          ApecBusinessTravelCardMrzResult.fromJSON(json["apecBusinessTravelCardMrzResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["apecBusinessTravelCardMrzResult"], commonCapturedIdFields);
    }

    UsVisaVizResult? usVisaVizResult;
    if (json.containsKey("usVisaVizResult") && json["usVisaVizResult"] != null) {
      usVisaVizResult = UsVisaVizResult.fromJSON(json["usVisaVizResult"] as Map<String, dynamic>);
      commonCapturedIdFields = _CommonCapturedIdFields.fromJSON(json["usVisaVizResult"], commonCapturedIdFields);
    }

    CommonAccessCardBarcodeResult? commonAccessCardBarcodeResult;
    if (json.containsKey("commonAccessCardBarcodeResult") && json["commonAccessCardBarcodeResult"] != null) {
      commonAccessCardBarcodeResult =
          CommonAccessCardBarcodeResult.fromJSON(json["commonAccessCardBarcodeResult"] as Map<String, dynamic>);
      commonCapturedIdFields =
          _CommonCapturedIdFields.fromJSON(json["commonAccessCardBarcodeResult"], commonCapturedIdFields);
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
        chinaMainlandTravelPermitMrz,
        chinaExitEntryPermitMrz,
        chinaOneWayPermitBackMrz,
        chinaOneWayPermitFrontMrz,
        apecBusinessTravelCardMrz,
        usVisaVizResult,
        commonAccessCardBarcodeResult,
        imageInfo,
        capturedResultTypes,
        commonCapturedIdFields,
        json["age"] as int?,
        json["isExpired"] as bool?,
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

  String? get documentAdditionalNumber {
    return _commonCapturedIdFields?._documentAdditionalNumber;
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

  ChinaMainlandTravelPermitMrzResult? get chinaMainlandTravelPermitMrz {
    return _chinaMainlandTravelPermitMrz;
  }

  ChinaExitEntryPermitMrzResult? get chinaExitEntryPermitMrz {
    return _chinaExitEntryPermitMrz;
  }

  ChinaOneWayPermitBackMrzResult? get chinaOneWayPermitBackMrz {
    return _chinaOneWayPermitBackMrz;
  }

  ChinaOneWayPermitFrontMrzResult? get chinaOneWayPermitFrontMrz {
    return _chinaOneWayPermitFrontMrz;
  }

  ApecBusinessTravelCardMrzResult? get apecBusinessTravelCardMrz {
    return _apecBusinessTravelCardMrz;
  }

  UsVisaVizResult? get usVisaViz {
    return _usVisaVizResult;
  }

  CommonAccessCardBarcodeResult? get commonAccessCardBarcode {
    return _commonAccessCardBarcode;
  }

  Image? getImageForType(IdImageType imageType) {
    return _imagesForTypes.getImageForType(imageType);
  }

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

class _CommonCapturedIdFields {
  String? _firstName;
  String? _lastName;
  String _fullName;
  String? _sex;
  DateResult? _dateOfBirth;
  String? _nationality;
  String? _address;
  DocumentType _documentType;
  String? _issuingCountryIso;
  String? _issuingCountry;
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
      this._documentType,
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
    var issuingCountry = json["issuingCountry"] as String?;
    var documentNumber = json["documentNumber"] as String?;
    var documentAdditionalNumber = json["documentAdditionalNumber"] as String?;

    if (existingInstance != null) {
      if (existingInstance._firstName == null) {
        existingInstance._firstName = firstName;
      }
      if (existingInstance._lastName == null) {
        existingInstance._lastName = lastName;
      }
      if (existingInstance._fullName.isEmpty) {
        existingInstance._fullName = fullName;
      }
      if (existingInstance._sex == null) {
        existingInstance._sex = sex;
      }
      if (existingInstance._dateOfBirth == null) {
        existingInstance._dateOfBirth = dateOfBirth;
      }
      if (existingInstance._nationality == null) {
        existingInstance._nationality = nationality;
      }
      if (existingInstance._address == null) {
        existingInstance._address = address;
      }
      if (existingInstance._issuingCountryIso == null) {
        existingInstance._issuingCountryIso = issuingCountryIso;
      }
      if (existingInstance._issuingCountry == null) {
        existingInstance._issuingCountry = issuingCountry;
      }
      if (existingInstance._documentNumber == null) {
        existingInstance._documentNumber = documentNumber;
      }
      if (existingInstance._documentAdditionalNumber == null) {
        existingInstance._documentAdditionalNumber = documentAdditionalNumber;
      }
      if (existingInstance._dateOfExpiry == null) {
        existingInstance._dateOfExpiry = dateOfExpiry;
      }
      if (existingInstance._dateOfIssue == null) {
        existingInstance._dateOfIssue = dateOfIssue;
      }
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
        DocumentTypeDeserializer.fromJSON(json["documentType"] as String),
        issuingCountryIso,
        issuingCountry,
        documentNumber,
        documentAdditionalNumber,
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

  String? get documentAdditionalNumber {
    return _documentAdditionalNumber;
  }

  DateResult? get dateOfExpiry {
    return _dateOfExpiry;
  }

  DateResult? get dateOfIssue {
    return _dateOfIssue;
  }
}
