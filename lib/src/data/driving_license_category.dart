/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/result/date_result.dart';

/// Added in version 8.0.0
@immutable
class DrivingLicenseCategory {
  final String _code;
  final DateResult? _dateOfIssue;
  final DateResult? _dateOfExpiry;

  const DrivingLicenseCategory._({
    required String code,
    required DateResult? dateOfIssue,
    required DateResult? dateOfExpiry,
  })  : _code = code,
        _dateOfIssue = dateOfIssue,
        _dateOfExpiry = dateOfExpiry;

  factory DrivingLicenseCategory.fromJSON(Map<String, dynamic> json) {
    return DrivingLicenseCategory._(
      code: json['code']?.toString() ?? '',
      dateOfIssue: json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null,
      dateOfExpiry: json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null,
    );
  }

  /// Driver’s license code representing type of vehicle.
  ///
  /// Added in version 8.0.0
  String get code => _code;

  /// The date of issue for the accompanying driver’s license code.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfIssue => _dateOfIssue;

  /// The date of expiry for the accompanying driver’s license code.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfExpiry => _dateOfExpiry;
}
