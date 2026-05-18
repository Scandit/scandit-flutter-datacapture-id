/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/image_extensions.dart';
import 'package:scandit_flutter_datacapture_id/src/data_consistency_check.dart';

/// The verification result of a comparison between the human-readable data of the document
/// with the data encoded in either MRZ or barcode.
/// This result can be returned by DataConsistencyVerifier or performed automatically when
/// IdCaptureSettings.RejectInconsistentData is enabled and exposed on VerificationResult.
@immutable
class DataConsistencyResult {
  final bool _allChecksPassed;
  final Set<DataConsistencyCheck> _failedChecks;
  final Set<DataConsistencyCheck> _skippedChecks;
  final Set<DataConsistencyCheck> _passedChecks;
  final String? _frontReviewImageEncoded;

  DataConsistencyResult._({
    required bool allChecksPassed,
    required Set<DataConsistencyCheck> failedChecks,
    required Set<DataConsistencyCheck> skippedChecks,
    required Set<DataConsistencyCheck> passedChecks,
    String? frontReviewImageEncoded,
  })  : _allChecksPassed = allChecksPassed,
        _failedChecks = Set.unmodifiable(failedChecks),
        _skippedChecks = Set.unmodifiable(skippedChecks),
        _passedChecks = Set.unmodifiable(passedChecks),
        _frontReviewImageEncoded = frontReviewImageEncoded;

  factory DataConsistencyResult.fromJSON(Map<String, dynamic> json) {
    Set<DataConsistencyCheck> failedChecks = {};
    Set<DataConsistencyCheck> skippedChecks = {};
    Set<DataConsistencyCheck> passedChecks = {};

    if (json['failedChecks'] != null) {
      for (String checkName in List<String>.from(json['failedChecks'])) {
        final check = DataConsistencyCheckDeserializer.fromJSON(checkName);
        failedChecks.add(check);
      }
    }

    if (json['skippedChecks'] != null) {
      for (String checkName in List<String>.from(json['skippedChecks'])) {
        final check = DataConsistencyCheckDeserializer.fromJSON(checkName);
        skippedChecks.add(check);
      }
    }

    if (json['passedChecks'] != null) {
      for (String checkName in List<String>.from(json['passedChecks'])) {
        final check = DataConsistencyCheckDeserializer.fromJSON(checkName);
        passedChecks.add(check);
      }
    }

    return DataConsistencyResult._(
      allChecksPassed: json['allChecksPassed'] as bool? ?? false,
      failedChecks: failedChecks,
      skippedChecks: skippedChecks,
      passedChecks: passedChecks,
      frontReviewImageEncoded: json['frontReviewImage'] as String?,
    );
  }

  bool get allChecksPassed => _allChecksPassed;

  Set<DataConsistencyCheck> get failedChecks => _failedChecks;

  Set<DataConsistencyCheck> get skippedChecks => _skippedChecks;

  Set<DataConsistencyCheck> get passedChecks => _passedChecks;

  /// Image with mismatched fields highlighted.
  /// Returns null when no mismatch found.
  Image? get frontReviewImage {
    return _frontReviewImageEncoded.toImage();
  }
}
