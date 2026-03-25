/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';
import 'package:scandit_flutter_datacapture_id/src/data/driving_license_category.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/image_extensions.dart';

import 'date_result.dart';

@immutable
class MobileDocumentResult {
  final Image? _portrait;
  final String _issuingAuthority;
  final String? _administrativeNumber;
  final int? _height;
  final int? _weight;
  final String? _eyeColor;
  final String? _hairColor;
  final String? _birthPlace;
  final List<DrivingLicenseCategory> _drivingLicenseCategories;
  final String? _residentCity;
  final String? _residentCountry;
  final String? _firstName;
  final String? _lastName;
  final String? _fullName;
  final String? _sex;
  final DateResult? _dateOfBirth;
  final int? _age;
  final String? _nationality;
  final String? _address;
  final String? _issuingCountryIso;
  final String? _issuingJurisdictionIso;
  final String? _documentNumber;
  final DateResult? _dateOfExpiry;
  final DateResult? _dateOfIssue;

  const MobileDocumentResult._({
    required Image? portrait,
    required String issuingAuthority,
    required String? administrativeNumber,
    required int? height,
    required int? weight,
    required String? eyeColor,
    required String? hairColor,
    required String? birthPlace,
    required List<DrivingLicenseCategory> drivingLicenseCategories,
    required String? residentCity,
    required String? residentCountry,
    required String? firstName,
    required String? lastName,
    required String? fullName,
    required String? sex,
    required DateResult? dateOfBirth,
    required int? age,
    required String? nationality,
    required String? address,
    required String? issuingCountryIso,
    required String? issuingJurisdictionIso,
    required String? documentNumber,
    required DateResult? dateOfExpiry,
    required DateResult? dateOfIssue,
  })  : _portrait = portrait,
        _issuingAuthority = issuingAuthority,
        _administrativeNumber = administrativeNumber,
        _height = height,
        _weight = weight,
        _eyeColor = eyeColor,
        _hairColor = hairColor,
        _birthPlace = birthPlace,
        _drivingLicenseCategories = drivingLicenseCategories,
        _residentCity = residentCity,
        _residentCountry = residentCountry,
        _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _sex = sex,
        _dateOfBirth = dateOfBirth,
        _age = age,
        _nationality = nationality,
        _address = address,
        _issuingCountryIso = issuingCountryIso,
        _issuingJurisdictionIso = issuingJurisdictionIso,
        _documentNumber = documentNumber,
        _dateOfExpiry = dateOfExpiry,
        _dateOfIssue = dateOfIssue;

  factory MobileDocumentResult.fromJSON(Map<String, dynamic> json) {
    return MobileDocumentResult._(
      portrait: json['portrait']?.toString().toImage(),
      issuingAuthority: json['issuingAuthority']?.toString() ?? '',
      administrativeNumber: json['administrativeNumber']?.toString(),
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      eyeColor: json['eyeColor']?.toString(),
      hairColor: json['hairColor']?.toString(),
      birthPlace: json['birthPlace']?.toString(),
      drivingLicenseCategories: (json['drivingLicenseCategories'] as List<dynamic>?)
              ?.map((e) => DrivingLicenseCategory.fromJSON(e))
              .toList() ??
          <DrivingLicenseCategory>[],
      residentCity: json['residentCity']?.toString(),
      residentCountry: json['residentCountry']?.toString(),
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      fullName: json['fullName']?.toString(),
      sex: json['sex']?.toString(),
      dateOfBirth: json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null,
      age: json['age'] as int?,
      nationality: json['nationality']?.toString(),
      address: json['address']?.toString(),
      issuingCountryIso: json['issuingCountryIso']?.toString(),
      issuingJurisdictionIso: json['issuingJurisdictionIso']?.toString(),
      documentNumber: json['documentNumber']?.toString(),
      dateOfExpiry: json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null,
      dateOfIssue: json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null,
    );
  }

  Image? get portrait => _portrait;

  String get issuingAuthority => _issuingAuthority;

  String? get administrativeNumber => _administrativeNumber;

  int? get height => _height;

  int? get weight => _weight;

  String? get eyeColor => _eyeColor;

  String? get hairColor => _hairColor;

  String? get birthPlace => _birthPlace;

  List<DrivingLicenseCategory> get drivingLicenseCategories => _drivingLicenseCategories;

  String? get residentCity => _residentCity;

  String? get residentCountry => _residentCountry;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  String? get sex => _sex;

  DateResult? get dateOfBirth => _dateOfBirth;

  int? get age => _age;

  String? get nationality => _nationality;

  String? get address => _address;

  String? get issuingCountryIso => _issuingCountryIso;

  String? get issuingJurisdictionIso => _issuingJurisdictionIso;

  String? get documentNumber => _documentNumber;

  DateResult? get dateOfExpiry => _dateOfExpiry;

  DateResult? get dateOfIssue => _dateOfIssue;
}
