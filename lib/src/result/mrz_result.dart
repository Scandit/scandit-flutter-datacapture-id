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
  final String? _optional;
  final String? _optional1;
  final String _capturedMrz;
  final String? _personalIdNumber;
  final int? _renewalTimes;
  final String? _fullNameSimplifiedChinese;
  final int? _omittedCharacterCountInGbkName;
  final int? _omittedNameCount;
  final String? _issuingAuthorityCode;
  final String? _passportIssuerIso;
  final String? _passportNumber;
  final DateResult? _passportDateOfExpiry;

  const MrzResult._(
      this._documentCode,
      this._namesAreTruncated,
      this._optional,
      this._optional1,
      this._capturedMrz,
      this._personalIdNumber,
      this._renewalTimes,
      this._fullNameSimplifiedChinese,
      this._omittedCharacterCountInGbkName,
      this._omittedNameCount,
      this._issuingAuthorityCode,
      this._passportIssuerIso,
      this._passportNumber,
      this._passportDateOfExpiry);

  factory MrzResult.fromJSON(Map<String, dynamic> json) {
    DateResult? passportDateOfExpiry;
    if (json.containsKey("passportDateOfExpiry") && json["passportDateOfExpiry"] != null) {
      passportDateOfExpiry = DateResult.fromJSON(json["passportDateOfExpiry"] as Map<String, dynamic>);
    }
    return MrzResult._(
        json['documentCode'] as String,
        json['namesAreTruncated'] as bool,
        json['optional'] as String?,
        json['optional1'] as String?,
        json['capturedMrz'] as String,
        json["personalIdNumber"] as String?,
        json["renewalTimes"] as int?,
        json["fullNameSimplifiedChinese"] as String?,
        json["omittedCharacterCountInGbkName"] as int?,
        json["omittedNameCount"] as int?,
        json["issuingAuthorityCode"] as String?,
        json["passportIssuerIso"] as String?,
        json["passportNumber"] as String?,
        passportDateOfExpiry);
  }

  String get documentCode {
    return _documentCode;
  }

  bool get namesAreTruncated {
    return _namesAreTruncated;
  }

  String? get optional {
    return _optional;
  }

  String? get optional1 {
    return _optional1;
  }

  String get capturedMrz {
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
}
