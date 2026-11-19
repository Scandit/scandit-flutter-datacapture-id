/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'date_result.dart';

import 'package:flutter/foundation.dart';

@immutable
class MrzResult {
  final String _documentCode;
  final bool _namesAreTruncated;
  final String? _optionalDataInLine1;
  final String? _optionalDataInLine2;
  final String? _capturedMrz;
  final String? _personalIdNumber;
  final int? _renewalTimes;
  final String? _fullNameSimplifiedChinese;
  final int? _omittedCharacterCountInGbkName;
  final int? _omittedNameCount;
  final String? _issuingAuthorityCode;
  final String? _passportIssuerIso;
  final String? _passportNumber;
  final DateResult? _passportDateOfExpiry;
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

  const MrzResult._({
    required String documentCode,
    required bool namesAreTruncated,
    required String? optionalDataInLine1,
    required String? optionalDataInLine2,
    required String? capturedMrz,
    required String? personalIdNumber,
    required int? renewalTimes,
    required String? fullNameSimplifiedChinese,
    required int? omittedCharacterCountInGbkName,
    required int? omittedNameCount,
    required String? issuingAuthorityCode,
    required String? passportIssuerIso,
    required String? passportNumber,
    required DateResult? passportDateOfExpiry,
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
  })  : _documentCode = documentCode,
        _namesAreTruncated = namesAreTruncated,
        _optionalDataInLine1 = optionalDataInLine1,
        _optionalDataInLine2 = optionalDataInLine2,
        _capturedMrz = capturedMrz,
        _personalIdNumber = personalIdNumber,
        _renewalTimes = renewalTimes,
        _fullNameSimplifiedChinese = fullNameSimplifiedChinese,
        _omittedCharacterCountInGbkName = omittedCharacterCountInGbkName,
        _omittedNameCount = omittedNameCount,
        _issuingAuthorityCode = issuingAuthorityCode,
        _passportIssuerIso = passportIssuerIso,
        _passportNumber = passportNumber,
        _passportDateOfExpiry = passportDateOfExpiry,
        _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _sex = sex,
        _dateOfBirth = dateOfBirth,
        _nationality = nationality,
        _address = address,
        _documentNumber = documentNumber,
        _dateOfExpiry = dateOfExpiry,
        _dateOfIssue = dateOfIssue;

  factory MrzResult.fromJSON(Map<String, dynamic> json) {
    DateResult? passportDateOfExpiry;
    if (json.containsKey("passportDateOfExpiry") && json["passportDateOfExpiry"] != null) {
      passportDateOfExpiry = DateResult.fromJSON(json["passportDateOfExpiry"] as Map<String, dynamic>);
    }

    final firstName = json['firstName']?.toString();
    final lastName = json['lastName']?.toString();
    final fullName = json['fullName']?.toString();
    final sex = json['sex']?.toString();
    final dateOfBirth = json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null;
    final nationality = json['nationality']?.toString();
    final address = json['address']?.toString();
    final documentNumber = json['documentNumber']?.toString();
    final dateOfExpiry = json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null;
    final dateOfIssue = json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null;
    return MrzResult._(
      documentCode: json['documentCode'] as String,
      namesAreTruncated: json['namesAreTruncated'] as bool,
      optionalDataInLine1: json['optionalDataInLine1'] as String?,
      optionalDataInLine2: json['optionalDataInLine2'] as String?,
      capturedMrz: json['capturedMrz'] as String?,
      personalIdNumber: json["personalIdNumber"] as String?,
      renewalTimes: json["renewalTimes"] as int?,
      fullNameSimplifiedChinese: json["fullNameSimplifiedChinese"] as String?,
      omittedCharacterCountInGbkName: json["omittedCharacterCountInGbkName"] as int?,
      omittedNameCount: json["omittedNameCount"] as int?,
      issuingAuthorityCode: json["issuingAuthorityCode"] as String?,
      passportIssuerIso: json["passportIssuerIso"] as String?,
      passportNumber: json["passportNumber"] as String?,
      passportDateOfExpiry: passportDateOfExpiry,
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
    );
  }

  String get documentCode {
    return _documentCode;
  }

  bool get namesAreTruncated {
    return _namesAreTruncated;
  }

  String? get optionalDataInLine1 {
    return _optionalDataInLine1;
  }

  String? get optionalDataInLine2 {
    return _optionalDataInLine2;
  }

  String? get capturedMrz {
    return _capturedMrz;
  }

  String? get personalIdNumber {
    return _personalIdNumber;
  }

  int? get renewalTimes {
    return _renewalTimes;
  }

  String? get fullNameSimplifiedChinese {
    return _fullNameSimplifiedChinese;
  }

  int? get omittedCharacterCountInGbkName {
    return _omittedCharacterCountInGbkName;
  }

  int? get omittedNameCount {
    return _omittedNameCount;
  }

  String? get issuingAuthorityCode {
    return _issuingAuthorityCode;
  }

  String? get passportIssuerIso {
    return _passportIssuerIso;
  }

  String? get passportNumber {
    return _passportNumber;
  }

  DateResult? get passportDateOfExpiry {
    return _passportDateOfExpiry;
  }

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
}
