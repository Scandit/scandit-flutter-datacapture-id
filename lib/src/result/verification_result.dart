/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/result/data_consistency_result.dart';
import 'package:scandit_flutter_datacapture_id/src/result/aamva_barcode_verification_result.dart';

@immutable
class VerificationResult {
  final DataConsistencyResult? _dataConsistency;
  final AamvaBarcodeVerificationResult? _aamvaBarcodeVerification;

  const VerificationResult._({
    DataConsistencyResult? dataConsistency,
    AamvaBarcodeVerificationResult? aamvaBarcodeVerification,
  })  : _dataConsistency = dataConsistency,
        _aamvaBarcodeVerification = aamvaBarcodeVerification;

  factory VerificationResult.fromJSON(Map<String, dynamic> json) {
    DataConsistencyResult? dataConsistency;
    AamvaBarcodeVerificationResult? aamvaBarcodeVerification;

    if (json['dataConsistencyResult'] != null) {
      dataConsistency = DataConsistencyResult.fromJSON(
        json['dataConsistencyResult'] as Map<String, dynamic>,
      );
    }

    if (json['aamvaBarcodeVerification'] != null) {
      aamvaBarcodeVerification = AamvaBarcodeVerificationResult.fromJSON(
        json['aamvaBarcodeVerification'] as Map<String, dynamic>,
      );
    }

    return VerificationResult._(
      dataConsistency: dataConsistency,
      aamvaBarcodeVerification: aamvaBarcodeVerification,
    );
  }

  DataConsistencyResult? get dataConsistency => _dataConsistency;

  AamvaBarcodeVerificationResult? get aamvaBarcodeVerification => _aamvaBarcodeVerification;
}
