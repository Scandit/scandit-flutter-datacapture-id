/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class AamvaBarcodeVerificationResult {
  final bool _allChecksPassed;
  // ignore: unused_field
  final String _resultJson;

  AamvaBarcodeVerificationResult._(this._allChecksPassed, this._resultJson);

  factory AamvaBarcodeVerificationResult.fromJSON(Map<String, dynamic> json) {
    return AamvaBarcodeVerificationResult._(json['allChecksPassed'] as bool, json['serverResponseJson'] as String);
  }

  bool get allChecksPassed {
    return _allChecksPassed;
  }
}
