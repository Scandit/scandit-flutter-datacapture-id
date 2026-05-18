/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/driving_license_details.dart';

import '../captured_sides.dart';
import 'date_result.dart';

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
  final String? _fullName;
  final String? _sex;
  final DateResult? _dateOfBirth;
  final String? _nationality;
  final String? _address;
  final String? _documentNumber;
  final DateResult? _dateOfExpiry;
  final DateResult? _dateOfIssue;
  final String? _vehicleOwner;
  final DrivingLicenseDetails? _drivingLicenseDetails;

  const VizResult._({
    required String? additionalNameInformation,
    required String? additionalAddressInformation,
    required String? placeOfBirth,
    required String? race,
    required String? religion,
    required String? profession,
    required String? maritalStatus,
    required String? residentialStatus,
    required String? employer,
    required String? personalIdNumber,
    required String? documentAdditionalNumber,
    required String? issuingJurisdiction,
    required String? issuingJurisdictionIso,
    required String? issuingAuthority,
    required CapturedSides capturedSides,
    required bool isBackSideCaptureSupported,
    required String? bloodType,
    required String? sponsor,
    required String? mothersName,
    required String? fathersName,
    required String? visaNumber,
    required String? passportNumber,
    required String? firstName,
    required String? lastName,
    required String? fullName,
    required String? sex,
    required DateResult? dateOfBirth,
    required String? nationality,
    required String? address,
    required String? documentNumber,
    required DateResult? dateOfExpiry,
    required DateResult? dateOfIssue,
    required String? vehicleOwner,
    required DrivingLicenseDetails? drivingLicenseDetails,
  })  : _additionalNameInformation = additionalNameInformation,
        _additionalAddressInformation = additionalAddressInformation,
        _placeOfBirth = placeOfBirth,
        _race = race,
        _religion = religion,
        _profession = profession,
        _maritalStatus = maritalStatus,
        _residentialStatus = residentialStatus,
        _employer = employer,
        _personalIdNumber = personalIdNumber,
        _documentAdditionalNumber = documentAdditionalNumber,
        _issuingJurisdiction = issuingJurisdiction,
        _issuingJurisdictionIso = issuingJurisdictionIso,
        _issuingAuthority = issuingAuthority,
        _capturedSides = capturedSides,
        _isBackSideCaptureSupported = isBackSideCaptureSupported,
        _bloodType = bloodType,
        _sponsor = sponsor,
        _mothersName = mothersName,
        _fathersName = fathersName,
        _visaNumber = visaNumber,
        _passportNumber = passportNumber,
        _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _sex = sex,
        _dateOfBirth = dateOfBirth,
        _nationality = nationality,
        _address = address,
        _documentNumber = documentNumber,
        _dateOfExpiry = dateOfExpiry,
        _dateOfIssue = dateOfIssue,
        _vehicleOwner = vehicleOwner,
        _drivingLicenseDetails = drivingLicenseDetails;

  factory VizResult.fromJSON(Map<String, dynamic> json) {
    final additionalNameInformation = json['additionalNameInformation'] as String?;
    final additionalAddressInformation = json['additionalAddressInformation'] as String?;
    final placeOfBirth = json['placeOfBirth'] as String?;
    final race = json['race'] as String?;
    final religion = json['religion'] as String?;
    final profession = json['profession'] as String?;
    final maritalStatus = json['maritalStatus'] as String?;
    final residentialStatus = json['residentialStatus'] as String?;
    final employer = json['employer'] as String?;
    final personalIdNumber = json['personalIdNumber'] as String?;
    final documentAdditionalNumber = json['documentAdditionalNumber'] as String?;
    final issuingJurisdiction = json['issuingJurisdiction'] as String?;
    final issuingJurisdictionIso = json['issuingJurisdictionIso'] as String?;
    final issuingAuthority = json['issuingAuthority'] as String?;
    final capturedSides = CapturedSidesDeserializer.fromJSON(json['capturedSides']);
    final isBackSideCaptureSupported = json['isBackSideCaptureSupported'] as bool;
    final bloodType = json['bloodType'] as String?;
    final sponsor = json['sponsor'] as String?;
    final mothersName = json['mothersName'] as String?;
    final fathersName = json['fathersName'] as String?;
    final visaNumber = json['visaNumber'] as String?;
    final passportNumber = json['passportNumber'] as String?;
    final firstName = json['firstName'] as String?;
    final lastName = json['lastName'] as String?;
    final fullName = json['fullName'] as String?;
    final sex = json['sex']?.toString();
    final dateOfBirth = json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null;
    final nationality = json['nationality']?.toString();
    final address = json['address']?.toString();
    final documentNumber = json['documentNumber']?.toString();
    final dateOfExpiry = json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null;
    final dateOfIssue = json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null;
    final vehicleOwner = json['vehicleOwner'] as String?;

    DrivingLicenseDetails? drivingLicenseDetails;
    if (json['drivingLicenseDetails'] != null) {
      drivingLicenseDetails = DrivingLicenseDetails.fromJSON(json['drivingLicenseDetails']);
    }

    return VizResult._(
      additionalNameInformation: additionalNameInformation,
      additionalAddressInformation: additionalAddressInformation,
      placeOfBirth: placeOfBirth,
      race: race,
      religion: religion,
      profession: profession,
      maritalStatus: maritalStatus,
      residentialStatus: residentialStatus,
      employer: employer,
      personalIdNumber: personalIdNumber,
      documentAdditionalNumber: documentAdditionalNumber,
      issuingJurisdiction: issuingJurisdiction,
      issuingJurisdictionIso: issuingJurisdictionIso,
      issuingAuthority: issuingAuthority,
      capturedSides: capturedSides,
      isBackSideCaptureSupported: isBackSideCaptureSupported,
      bloodType: bloodType,
      sponsor: sponsor,
      mothersName: mothersName,
      fathersName: fathersName,
      visaNumber: visaNumber,
      passportNumber: passportNumber,
      firstName: firstName,
      lastName: lastName,
      fullName: fullName,
      sex: sex,
      dateOfBirth: dateOfBirth,
      nationality: nationality,
      address: address,
      documentNumber: documentNumber,
      dateOfExpiry: dateOfExpiry,
      dateOfIssue: dateOfIssue,
      vehicleOwner: vehicleOwner,
      drivingLicenseDetails: drivingLicenseDetails,
    );
  }

  String? get additionalNameInformation => _additionalNameInformation;

  String? get additionalAddressInformation => _additionalAddressInformation;

  String? get placeOfBirth => _placeOfBirth;

  String? get race => _race;

  String? get religion => _religion;

  String? get profession => _profession;

  String? get maritalStatus => _maritalStatus;

  String? get residentialStatus => _residentialStatus;

  String? get employer => _employer;

  String? get personalIdNumber => _personalIdNumber;

  String? get documentAdditionalNumber => _documentAdditionalNumber;

  String? get issuingJurisdiction => _issuingJurisdiction;

  String? get issuingJurisdictionIso => _issuingJurisdictionIso;

  String? get issuingAuthority => _issuingAuthority;

  CapturedSides get capturedSides => _capturedSides;

  bool get isBackSideCaptureSupported => _isBackSideCaptureSupported;

  String? get bloodType => _bloodType;

  String? get sponsor => _sponsor;

  String? get mothersName => _mothersName;

  String? get fathersName => _fathersName;

  String? get visaNumber => _visaNumber;

  String? get passportNumber => _passportNumber;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  String? get sex => _sex;

  DateResult? get dateOfBirth => _dateOfBirth;

  String? get nationality => _nationality;

  String? get address => _address;

  String? get documentNumber => _documentNumber;

  DateResult? get dateOfExpiry => _dateOfExpiry;

  DateResult? get dateOfIssue => _dateOfIssue;

  String? get vehicleOwner => _vehicleOwner;

  DrivingLicenseDetails? get drivingLicenseDetails => _drivingLicenseDetails;
}
