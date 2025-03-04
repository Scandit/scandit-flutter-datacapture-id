/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';

import '../captured_sides.dart';

@immutable
class VizResult {
  final String? _additionalNameInformation;
  final String? _additionalAddressInformation;
  final String? _placeOfBirth;
  final String? _race;
  final String? _religion;
  final String? _profession;
  final String? _maritalStatus;
  final String? _residentialStatus;
  final String? _employer;
  final String? _personalIdNumber;
  final String? _documentAdditionalNumber;
  final String? _issuingJurisdiction;
  final String? _issuingJurisdictionIso;
  final String? _issuingAuthority;
  final CapturedSides _capturedSides;
  final bool _isBackSideCaptureSupported;
  final String? _bloodType;
  final String? _sponsor;
  final String? _mothersName;
  final String? _fathersName;
  final String? _visaNumber;
  final String? _passportNumber;
  final String? _firstName;
  final String? _lastName;
  final String? _secondaryLastName;
  final String _fullName;

  const VizResult._(
      this._additionalNameInformation,
      this._additionalAddressInformation,
      this._placeOfBirth,
      this._race,
      this._religion,
      this._profession,
      this._maritalStatus,
      this._residentialStatus,
      this._employer,
      this._personalIdNumber,
      this._documentAdditionalNumber,
      this._issuingJurisdiction,
      this._issuingJurisdictionIso,
      this._issuingAuthority,
      this._capturedSides,
      this._isBackSideCaptureSupported,
      this._bloodType,
      this._sponsor,
      this._mothersName,
      this._fathersName,
      this._visaNumber,
      this._passportNumber,
      this._firstName,
      this._lastName,
      this._secondaryLastName,
      this._fullName);

  VizResult.fromJSON(Map<String, dynamic> json)
      : this._(
          json['additionalNameInformation'] as String?,
          json['additionalAddressInformation'] as String?,
          json['placeOfBirth'] as String?,
          json['race'] as String?,
          json['religion'] as String?,
          json['profession'] as String?,
          json['maritalStatus'] as String?,
          json['residentialStatus'] as String?,
          json['employer'] as String?,
          json['personalIdNumber'] as String?,
          json['documentAdditionalNumber'] as String?,
          json['issuingJurisdiction'] as String?,
          json['issuingJurisdictionIso'] as String?,
          json['issuingAuthority'] as String?,
          CapturedSidesDeserializer.fromJSON(json['capturedSides']),
          json['isBackSideCaptureSupported'] as bool,
          json['bloodType'] as String?,
          json['sponsor'] as String?,
          json['mothersName'] as String?,
          json['fathersName'] as String?,
          json["visaNumber"] as String?,
          json["passportNumber"] as String?,
          json['firstName'] as String?,
          json['lastName'] as String?,
          json['secondaryLastName'] as String?,
          json['fullName'] as String,
        );

  String? get additionalNameInformation {
    return _additionalNameInformation;
  }

  String? get additionalAddressInformation {
    return _additionalAddressInformation;
  }

  String? get placeOfBirth {
    return _placeOfBirth;
  }

  String? get race {
    return _race;
  }

  String? get religion {
    return _religion;
  }

  String? get profession {
    return _profession;
  }

  String? get maritalStatus {
    return _maritalStatus;
  }

  String? get residentialStatus {
    return _residentialStatus;
  }

  String? get employer {
    return _employer;
  }

  String? get personalIdNumber {
    return _personalIdNumber;
  }

  String? get documentAdditionalNumber {
    return _documentAdditionalNumber;
  }

  String? get issuingJurisdiction {
    return _issuingJurisdiction;
  }

  String? get issuingJurisdictionIso {
    return _issuingJurisdictionIso;
  }

  String? get issuingAuthority {
    return _issuingAuthority;
  }

  CapturedSides get capturedSides {
    return _capturedSides;
  }

  bool get isBackSideCaptureSupported {
    return _isBackSideCaptureSupported;
  }

  String? get bloodType {
    return _bloodType;
  }

  String? get sponsor {
    return _sponsor;
  }

  String? get mothersName {
    return _mothersName;
  }

  String? get fathersName {
    return _fathersName;
  }

  String? get visaNumber {
    return _visaNumber;
  }

  String? get passportNumber {
    return _passportNumber;
  }

  String? get firstName {
    return _firstName;
  }

  String? get lastName {
    return _lastName;
  }

  String? get secondaryLastName {
    return _secondaryLastName;
  }

  String get fullName {
    return _fullName;
  }
}
