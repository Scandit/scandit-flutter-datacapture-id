/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/aamva_barcode_verification_status.dart';

@immutable
class AamvaBarcodeVerificationResult {
  final bool _allChecksPassed;
  // ignore: unused_field
  final String _resultJson;

  final AamvaBarcodeVerificationStatus _status;

  const AamvaBarcodeVerificationResult._(this._allChecksPassed, this._resultJson, this._status);

  factory AamvaBarcodeVerificationResult.fromJSON(Map<String, dynamic> json) {
    return AamvaBarcodeVerificationResult._(
      json['allChecksPassed'] as bool,
      json['serverResponseJson'] as String,
      AamvaBarcodeVerificationStatusSerializer.fromJson(json['verificationStatus'] as String),
    );
  }

  bool get allChecksPassed {
    return _allChecksPassed;
  }

  AamvaBarcodeVerificationStatus get status {
    return _status;
  }
}
