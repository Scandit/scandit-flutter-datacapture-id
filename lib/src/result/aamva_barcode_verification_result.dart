/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/aamva_barcode_verification_status.dart';

/// The result of a verification of AAMVA-compliant personal identification document returned in [VerificationResult] when [IdCaptureSettings.rejectForgedAamvaBarcodes] is enabled.
///
/// Added in version 6.19.0
@immutable
class AamvaBarcodeVerificationResult {
  final bool _allChecksPassed;

  final AamvaBarcodeVerificationStatus _status;

  const AamvaBarcodeVerificationResult._(this._allChecksPassed, this._status);

  factory AamvaBarcodeVerificationResult.fromJSON(Map<String, dynamic> json) {
    return AamvaBarcodeVerificationResult._(
      json['allChecksPassed'] as bool,
      AamvaBarcodeVerificationStatusSerializer.fromJson(json['verificationStatus'] as String),
    );
  }

  /// All checks passed and nothing suspicious about the document was detected.
  ///
  /// Added in version 6.19.0
  bool get allChecksPassed {
    return _allChecksPassed;
  }

  /// Verification status containing the result of the verification
  ///
  /// Added in version 7.3.0
  AamvaBarcodeVerificationStatus get status {
    return _status;
  }
}
