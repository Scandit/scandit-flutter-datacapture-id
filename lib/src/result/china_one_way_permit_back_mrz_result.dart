/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class ChinaOneWayPermitBackMrzResult {
  final String _documentCode;
  final bool _namesAreTruncated;
  final String _capturedMrz;

  ChinaOneWayPermitBackMrzResult._(this._documentCode, this._namesAreTruncated, this._capturedMrz);

  ChinaOneWayPermitBackMrzResult.fromJSON(Map<String, dynamic> json)
      : this._(json["documentCode"] as String, json["namesAreTruncated"] as bool, json["capturedMrz"] as String);

  String get documentCode {
    return _documentCode;
  }

  bool get namesAreTruncated {
    return _namesAreTruncated;
  }

  String get capturedMrz {
    return _capturedMrz;
  }
}
