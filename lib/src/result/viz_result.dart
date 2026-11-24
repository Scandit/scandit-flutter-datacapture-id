/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/driving_license_details.dart';

import '../captured_sides.dart';
import 'date_result.dart';
import 'visa_details.dart';

/// Document scan results with information obtained from documents or their parts intended to be read by humans (for example Visual Inspection Zone (VIZ) of a Machine-Readable Travel Document (MRTD)).
///
/// Added in version 6.11.0
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
  final VisaDetails? _visaDetails;

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
    required VisaDetails? visaDetails,
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
        _drivingLicenseDetails = drivingLicenseDetails,
        _visaDetails = visaDetails;

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

    VisaDetails? visaDetails;
    if (json['visaDetails'] != null) {
      visaDetails = VisaDetails.fromJSON(json['visaDetails'] as Map<String, dynamic>);
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
      visaDetails: visaDetails,
    );
  }

  /// The additional name information of the document holder that might be present on the document.
  ///
  /// The content of this field varies by document type:**German passports and IDs**: Contains the maiden name or birth name of the document holder**French passports**: Contains the married name of the document holder
  ///
  /// Added in version 6.11.0
  String? get additionalNameInformation => _additionalNameInformation;

  /// The additional address information of the document holder.
  ///
  /// Added in version 6.11.0
  String? get additionalAddressInformation => _additionalAddressInformation;

  /// The place of birth of the document holder.
  ///
  /// Added in version 6.11.0
  String? get placeOfBirth => _placeOfBirth;

  /// The race of the document holder.
  ///
  /// Added in version 6.11.0
  String? get race => _race;

  /// The religion of the document holder.
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 6.11.0
  String? get religion => _religion;

  /// The profession of the document holder.
  ///
  /// Added in version 6.11.0
  String? get profession => _profession;

  /// The marital status of the document holder.
  ///
  /// Added in version 6.11.0
  String? get maritalStatus => _maritalStatus;

  /// The residential status of the document holder.
  ///
  /// Added in version 6.11.0
  String? get residentialStatus => _residentialStatus;

  /// The employer of the document holder.
  ///
  /// Added in version 6.11.0
  String? get employer => _employer;

  /// The personal identification number.
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 6.11.0
  String? get personalIdNumber => _personalIdNumber;

  /// The additional number of the document.
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 6.11.0
  String? get documentAdditionalNumber => _documentAdditionalNumber;

  /// A human readable name of the issuing jurisdiction (for example: an issuing state, territory or federal district for USA, or an issuing province or territory for Canada).
  ///
  /// Added in version 6.11.0
  String? get issuingJurisdiction => _issuingJurisdiction;

  /// The ISO code of the issuing jurisdiction (for example: an issuing state, territory or federal district for the USA, or an issuing province or territory for Canada). *null* if the issuing jurisdiction has no valid ISO code (for example cities in Mexico).
  ///
  /// The returned value will only contain the jurisdiction specific code: for instance for California the returned value would be “CA” and not “US-CA”.Please note that for the New York City ID, this field is set to “NYC” as ISO-3166-2 does not specify city-level names.
  ///
  /// Added in version 6.12.0
  String? get issuingJurisdictionIso => _issuingJurisdictionIso;

  /// The government body issuing this ID, e.g. the Department of Motor Vehicles.
  ///
  /// Added in version 6.11.0
  String? get issuingAuthority => _issuingAuthority;

  /// The sides of the document that were scanned to extract this VizResult.
  ///
  /// Added in version 6.11.0
  CapturedSides get capturedSides => _capturedSides;

  /// Indicates whether the document supports scanning of the back side.
  ///
  /// Added in version 6.11.0
  bool get isBackSideCaptureSupported => _isBackSideCaptureSupported;

  /// The blood type of the document owner.
  ///
  /// Added in version 6.25.0
  String? get bloodType => _bloodType;

  /// The sponsor of the document owner.
  ///
  /// Added in version 6.25.0
  String? get sponsor => _sponsor;

  /// The mother’s name of the document owner.
  ///
  /// Added in version 6.25.0
  String? get mothersName => _mothersName;

  /// The father’s name of the document owner.
  ///
  /// Added in version 6.25.0
  String? get fathersName => _fathersName;

  /// The visa number of the document holder.
  ///
  /// Added in version 7.0.0
  String? get visaNumber => _visaNumber;

  /// The passport number of the document holder.
  ///
  /// Added in version 7.0.0
  String? get passportNumber => _passportNumber;

  /// The first name of the document holder. Separated by spaces if more than one name is present. Certain documents do not distinguish between given name and surname. If the name cannot be split reliably, this field may be null.
  ///
  /// Added in version 7.0.0
  String? get firstName => _firstName;

  /// The last name of the document holder. Separated by spaces if more than one name is present. Certain documents do not distinguish between given name and surname. If the name cannot be split reliably, this field may be null.
  ///
  /// Added in version 7.0.0
  String? get lastName => _lastName;

  /// The full name of the document holder.
  ///
  /// Added in version 7.0.0
  String? get fullName => _fullName;

  /// The sex of the document holder.
  ///
  /// Added in version 8.0.0
  String? get sex => _sex;

  /// The date of birth of the document holder.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfBirth => _dateOfBirth;

  /// The nationality of the document holder.
  ///
  /// Added in version 8.0.0
  String? get nationality => _nationality;

  /// The address of the document holder.
  ///
  /// Added in version 8.0.0
  String? get address => _address;

  /// The document number of the ID.
  ///
  /// Added in version 8.0.0
  String? get documentNumber => _documentNumber;

  /// The expiry date of the document.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfExpiry => _dateOfExpiry;

  /// The issue date of the document.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfIssue => _dateOfIssue;

  /// The owner of the vehicle.
  ///
  /// Added in version 8.0.0
  String? get vehicleOwner => _vehicleOwner;

  /// Extra information about the scanned driver’s license
  ///
  /// Added in version 8.0.0
  DrivingLicenseDetails? get drivingLicenseDetails => _drivingLicenseDetails;

  /// Extra information about the scanned visa.
  ///
  /// Added in version 8.5.0
  VisaDetails? get visaDetails => _visaDetails;
}
