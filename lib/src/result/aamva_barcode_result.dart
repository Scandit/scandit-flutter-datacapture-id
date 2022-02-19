/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'date_result.dart';

class AamvaBarcodeResult {
  int _aamvaVersion;
  int _jurisdictionVersion;
  String _iIN;
  String _issuingJurisdiction;
  String _issuingJurisdictionIso;
  String? _eyeColor;
  String? _hairColor;
  int? _heightInch;
  int? _heightCm;
  int? _weightLbs;
  int? _weightKg;
  String? _placeOfBirth;
  String? _race;
  String? _documentDiscriminatorNumber;
  String? _vehicleClass;
  String? _restrictionsCode;
  String? _endorsementsCode;
  DateResult? _cardRevisionDate;
  String? _middleName;
  String? _driverNameSuffix;
  String? _driverNamePrefix;
  String? _lastNameTruncation;
  String? _firstNameTruncation;
  String? _middleNameTruncation;
  String? _aliasFamilyName;
  String? _aliasGivenName;
  String? _aliasSuffixName;
  Map<String, String> _barcodeDataElements;

  AamvaBarcodeResult._(
      this._aamvaVersion,
      this._jurisdictionVersion,
      this._iIN,
      this._issuingJurisdiction,
      this._issuingJurisdictionIso,
      this._eyeColor,
      this._hairColor,
      this._heightInch,
      this._heightCm,
      this._weightLbs,
      this._weightKg,
      this._placeOfBirth,
      this._race,
      this._documentDiscriminatorNumber,
      this._vehicleClass,
      this._restrictionsCode,
      this._endorsementsCode,
      this._cardRevisionDate,
      this._middleName,
      this._driverNameSuffix,
      this._driverNamePrefix,
      this._lastNameTruncation,
      this._firstNameTruncation,
      this._middleNameTruncation,
      this._aliasFamilyName,
      this._aliasGivenName,
      this._aliasSuffixName,
      this._barcodeDataElements);

  factory AamvaBarcodeResult.fromJSON(Map<String, dynamic> json) {
    DateResult? cardRevisionDate;
    if (json.containsKey("cardRevisionDate") && json["cardRevisionDate"] != null) {
      cardRevisionDate = DateResult.fromJSON(json["cardRevisionDate"] as Map<String, dynamic>);
    }

    return AamvaBarcodeResult._(
        json["aamvaVersion"] as int,
        json["jurisdictionVersion"] as int,
        json["iin"] as String,
        json["issuingJurisdiction"] as String,
        json["issuingJurisdictionIso"] as String,
        json["eyeColor"] as String?,
        json["hairColor"] as String?,
        json["heightInch"] as int?,
        json["heightCm"] as int?,
        json["weightLbs"] as int?,
        json["weightKg"] as int?,
        json["placeOfBirth"] as String?,
        json["race"] as String?,
        json["documentDiscriminatorNumber"] as String?,
        json["vehicleClass"] as String?,
        json["restrictionsCode"] as String?,
        json["endorsementsCode"] as String?,
        cardRevisionDate,
        json["middleName"] as String?,
        json["driverNameSuffix"] as String?,
        json["driverNamePrefix"] as String?,
        json["lastNameTruncation"] as String?,
        json["firstNameTruncation"] as String?,
        json["middleNameTruncation"] as String?,
        json["aliasFamilyName"] as String?,
        json["aliasGivenName"] as String?,
        json["aliasSuffixName"] as String?,
        (json["dictionary"] as Map<String, dynamic>).map((key, value) => MapEntry(key, value.toString())));
  }

  int get aamvaVersion {
    return _aamvaVersion;
  }

  int get jurisdictionVersion {
    return _jurisdictionVersion;
  }

  String get iIN {
    return _iIN;
  }

  String get issuingJurisdiction {
    return _issuingJurisdiction;
  }

  String get issuingJurisdictionIso {
    return _issuingJurisdictionIso;
  }

  String? get eyeColor {
    return _eyeColor;
  }

  String? get hairColor {
    return _hairColor;
  }

  int? get heightInch {
    return _heightInch;
  }

  int? get heightCm {
    return _heightCm;
  }

  int? get weightLbs {
    return _weightLbs;
  }

  int? get weightKg {
    return _weightKg;
  }

  String? get placeOfBirth {
    return _placeOfBirth;
  }

  String? get race {
    return _race;
  }

  String? get documentDiscriminatorNumber {
    return _documentDiscriminatorNumber;
  }

  String? get vehicleClass {
    return _vehicleClass;
  }

  String? get restrictionsCode {
    return _restrictionsCode;
  }

  String? get endorsementsCode {
    return _endorsementsCode;
  }

  DateResult? get cardRevisionDate {
    return _cardRevisionDate;
  }

  String? get middleName {
    return _middleName;
  }

  String? get driverNameSuffix {
    return _driverNameSuffix;
  }

  String? get driverNamePrefix {
    return _driverNamePrefix;
  }

  String? get lastNameTruncation {
    return _lastNameTruncation;
  }

  String? get firstNameTruncation {
    return _firstNameTruncation;
  }

  String? get middleNameTruncation {
    return _middleNameTruncation;
  }

  String? get aliasFamilyName {
    return _aliasFamilyName;
  }

  String? get aliasGivenName {
    return _aliasGivenName;
  }

  String? get aliasSuffixName {
    return _aliasSuffixName;
  }

  Map<String, String> get barcodeDataElements {
    return _barcodeDataElements;
  }
}
