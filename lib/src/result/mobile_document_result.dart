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

/// This class represents data extracted from mobile identity documents. It contains information from mobile driver’s licenses and other mobile identity documents that comply with various standards such as ISO 18013-5. Some properties may not apply to certain document types and will be set to nil if the corresponding data is not available in the mobile document.
///
/// Added in version 8.0.0
@immutable
class MobileDocumentResult {
  final Image? _portrait;
  final Image? _signature;
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
    required Image? signature,
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
        _signature = signature,
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
      signature: json['signature']?.toString().toImage(),
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

  /// The portrait image of the document holder as bitmap.
  ///
  /// Added in version 8.0.0
  Image? get portrait => _portrait;

  /// The signature image of the document holder as bitmap.
  ///
  /// Added in version 8.7.0
  Image? get signature => _signature;

  /// The authority that issued the mobile document.
  ///
  /// Added in version 8.0.0
  String get issuingAuthority => _issuingAuthority;

  /// The administrative number associated with the mobile document.
  ///
  /// Added in version 8.0.0
  String? get administrativeNumber => _administrativeNumber;

  /// The height of the document holder in centimeters.
  ///
  /// Added in version 8.0.0
  int? get height => _height;

  /// The weight of the document holder in kilograms.
  ///
  /// Added in version 8.0.0
  int? get weight => _weight;

  /// The eye color of the document holder.
  ///
  /// Added in version 8.0.0
  String? get eyeColor => _eyeColor;

  /// The hair color of the document holder.
  ///
  /// Added in version 8.0.0
  String? get hairColor => _hairColor;

  /// The place of birth of the document holder.
  ///
  /// Added in version 8.0.0
  String? get birthPlace => _birthPlace;

  /// The list of driving license categories associated with the mobile document. Each category contains information about the type of vehicle the holder is authorized to operate and the validity period of the authorization.
  ///
  /// Added in version 8.0.0
  List<DrivingLicenseCategory> get drivingLicenseCategories => _drivingLicenseCategories;

  /// The city of residence of the document holder.
  ///
  /// Added in version 8.0.0
  String? get residentCity => _residentCity;

  /// The country of residence of the document holder.
  ///
  /// Added in version 8.0.0
  String? get residentCountry => _residentCountry;

  /// The first name of the document holder.
  ///
  /// Added in version 8.0.0
  String? get firstName => _firstName;

  /// The last name of the document holder.
  ///
  /// Added in version 8.0.0
  String? get lastName => _lastName;

  /// The full name of the document holder.
  ///
  /// Added in version 8.0.0
  String? get fullName => _fullName;

  /// The sex of the document holder as a string.
  ///
  /// Added in version 8.0.0
  String? get sex => _sex;

  /// The date of birth of the document holder.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfBirth => _dateOfBirth;

  /// The age of the document holder.
  ///
  /// Added in version 8.0.0
  int? get age => _age;

  /// The nationality of the document holder.
  ///
  /// Added in version 8.0.0
  String? get nationality => _nationality;

  /// The address of the document holder.
  ///
  /// Added in version 8.0.0
  String? get address => _address;

  /// The ISO code of the issuing country.
  ///
  /// Added in version 8.0.0
  String? get issuingCountryIso => _issuingCountryIso;

  /// The ISO code of the issuing jurisdiction.
  ///
  /// Added in version 8.0.0
  String? get issuingJurisdictionIso => _issuingJurisdictionIso;

  /// The document number.
  ///
  /// Added in version 8.0.0
  String? get documentNumber => _documentNumber;

  /// The date of expiry of the document.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfExpiry => _dateOfExpiry;

  /// The date of issue of the document.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfIssue => _dateOfIssue;
}
