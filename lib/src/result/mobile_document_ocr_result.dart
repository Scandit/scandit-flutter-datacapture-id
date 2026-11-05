/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025 Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'date_result.dart';

/// This class represents data extracted from mobile documents using optical character recognition (OCR). It contains information from mobile driver’s licenses captured using OCR-based scanning methods, such as Australian mobile driver licenses. Some properties may not apply to certain document types and will be set to nil if the corresponding data is not available or could not be extracted via OCR.
///
/// Added in version 8.0.0
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

  /// The first name of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get firstName => _firstName;

  /// The last name of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get lastName => _lastName;

  /// The full name of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get fullName => _fullName;

  /// The date of birth of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfBirth => _dateOfBirth;

  /// The document number extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get documentNumber => _documentNumber;

  /// The date of expiry of the document extracted via OCR.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfExpiry => _dateOfExpiry;

  /// The issuing jurisdiction of the document extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get issuingJurisdiction => _issuingJurisdiction;

  /// The ISO code of the issuing jurisdiction extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get issuingJurisdictionIso => _issuingJurisdictionIso;

  /// The sex of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get sex => _sex;

  /// The nationality of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get nationality => _nationality;

  /// The address of the document holder extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get address => _address;

  /// The additional document number extracted via OCR.
  ///
  /// Added in version 8.0.0
  String? get documentAdditionalNumber => _documentAdditionalNumber;

  /// The date of issue of the document extracted via OCR.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfIssue => _dateOfIssue;
}
