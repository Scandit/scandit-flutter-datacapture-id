/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/result/date_result.dart';

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

  String get code => _code;

  DateResult? get dateOfIssue => _dateOfIssue;

  DateResult? get dateOfExpiry => _dateOfExpiry;
}
