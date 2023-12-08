/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class ChinaExitEntryPermitMrzResult {
  final String _documentCode;
  final String _capturedMrz;

  ChinaExitEntryPermitMrzResult._(this._documentCode, this._capturedMrz);

  ChinaExitEntryPermitMrzResult.fromJSON(Map<String, dynamic> json)
      : this._(json["documentCode"] as String, json["capturedMrz"] as String);

  String get documentCode {
    return _documentCode;
  }

  String get capturedMrz {
    return _capturedMrz;
  }
}
