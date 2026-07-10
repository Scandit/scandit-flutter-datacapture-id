/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class ChinaOneWayPermitFrontMrzResult {
  final String _documentCode;
  final String _fullNameSimplifiedChinese;
  final String _capturedMrz;

  ChinaOneWayPermitFrontMrzResult._(this._documentCode, this._fullNameSimplifiedChinese, this._capturedMrz);

  ChinaOneWayPermitFrontMrzResult.fromJSON(Map<String, dynamic> json)
      : this._(
            json["documentCode"] as String, json["fullNameSimplifiedChinese"] as String, json["capturedMrz"] as String);

  String get documentCode {
    return _documentCode;
  }

  String get fullNameSimplifiedChinese {
    return _fullNameSimplifiedChinese;
  }

  String get capturedMrz {
    return _capturedMrz;
  }
}
