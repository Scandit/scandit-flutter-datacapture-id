/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class ChinaMainlandTravelPermitMrzResult {
  final String _documentCode;
  final String _capturedMrz;
  final String _personalIdNumber;
  final int _renewalTimes;
  final String _fullNameSimplifiedChinese;
  final int _omittedCharacterCountInGBKName;
  final int _omittedNameCount;
  final String? _issuingAuthorityCode;

  ChinaMainlandTravelPermitMrzResult._(
      this._documentCode,
      this._capturedMrz,
      this._personalIdNumber,
      this._renewalTimes,
      this._fullNameSimplifiedChinese,
      this._omittedCharacterCountInGBKName,
      this._omittedNameCount,
      this._issuingAuthorityCode);

  ChinaMainlandTravelPermitMrzResult.fromJSON(Map<String, dynamic> json)
      : this._(
            json["documentCode"] as String,
            json["capturedMrz"] as String,
            json["personalIdNumber"] as String,
            json["renewalTimes"] as int,
            json["fullNameSimplifiedChinese"] as String,
            json["omittedCharacterCountInGBKName"] as int,
            json["omittedNameCount"] as int,
            json["issuingAuthorityCode"] as String?);

  String get documentCode {
    return _documentCode;
  }

  String get capturedMrz {
    return _capturedMrz;
  }

  String get personalIdNumber {
    return _personalIdNumber;
  }

  int get renewalTimes {
    return _renewalTimes;
  }

  String get fullNameSimplifiedChinese {
    return _fullNameSimplifiedChinese;
  }

  int get omittedCharacterCountInGBKName {
    return _omittedCharacterCountInGBKName;
  }

  int get omittedNameCount {
    return _omittedNameCount;
  }

  String? get issuingAuthorityCode {
    return _issuingAuthorityCode;
  }
}
