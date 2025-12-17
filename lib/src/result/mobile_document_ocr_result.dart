/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025 Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'date_result.dart';

@immutable
class MobileDocumentOcrResult {
  final String? _firstName;
  final String? _lastName;
  final String? _fullName;
  final DateResult? _dateOfBirth;
  final String? _documentNumber;
  final DateResult? _dateOfExpiry;
  final String? _issuingJurisdiction;
  final String? _issuingJurisdictionIso;
  final String? _sex;
  final String? _nationality;
  final String? _address;
  final String? _documentAdditionalNumber;
  final DateResult? _dateOfIssue;

  const MobileDocumentOcrResult._({
    required String? firstName,
    required String? lastName,
    required String? fullName,
    required DateResult? dateOfBirth,
    required String? documentNumber,
    required DateResult? dateOfExpiry,
    required String? issuingJurisdiction,
    required String? issuingJurisdictionIso,
    required String? sex,
    required String? nationality,
    required String? address,
    required String? documentAdditionalNumber,
    required DateResult? dateOfIssue,
  })  : _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _dateOfBirth = dateOfBirth,
        _documentNumber = documentNumber,
        _dateOfExpiry = dateOfExpiry,
        _issuingJurisdiction = issuingJurisdiction,
        _issuingJurisdictionIso = issuingJurisdictionIso,
        _sex = sex,
        _nationality = nationality,
        _address = address,
        _documentAdditionalNumber = documentAdditionalNumber,
        _dateOfIssue = dateOfIssue;

  factory MobileDocumentOcrResult.fromJSON(Map<String, dynamic> json) {
    return MobileDocumentOcrResult._(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      fullName: json['fullName']?.toString(),
      dateOfBirth:
          json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth'] as Map<String, dynamic>) : null,
      documentNumber: json['documentNumber']?.toString(),
      dateOfExpiry:
          json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry'] as Map<String, dynamic>) : null,
      issuingJurisdiction: json['issuingJurisdiction']?.toString(),
      issuingJurisdictionIso: json['issuingJurisdictionIso']?.toString(),
      sex: json['sex']?.toString(),
      nationality: json['nationality']?.toString(),
      address: json['address']?.toString(),
      documentAdditionalNumber: json['documentAdditionalNumber']?.toString(),
      dateOfIssue:
          json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue'] as Map<String, dynamic>) : null,
    );
  }

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  DateResult? get dateOfBirth => _dateOfBirth;

  String? get documentNumber => _documentNumber;

  DateResult? get dateOfExpiry => _dateOfExpiry;

  String? get issuingJurisdiction => _issuingJurisdiction;

  String? get issuingJurisdictionIso => _issuingJurisdictionIso;

  String? get sex => _sex;

  String? get nationality => _nationality;

  String? get address => _address;

  String? get documentAdditionalNumber => _documentAdditionalNumber;

  DateResult? get dateOfIssue => _dateOfIssue;
}
