/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/data/driving_license_category.dart';

/// Added in version 8.0.0
@immutable
class DrivingLicenseDetails {
  final List<DrivingLicenseCategory> _drivingLicenseCategories;
  final String? _restrictions;
  final String? _endorsements;

  DrivingLicenseDetails._({
    required List<DrivingLicenseCategory> drivingLicenseCategories,
    required String? restrictions,
    required String? endorsements,
  })  : _drivingLicenseCategories = List.unmodifiable(drivingLicenseCategories),
        _restrictions = restrictions,
        _endorsements = endorsements;

  factory DrivingLicenseDetails.fromJSON(Map<String, dynamic> json) {
    final drivingLicenseCategories =
        (json['drivingLicenseCategories'] as List<dynamic>?)?.map((e) => DrivingLicenseCategory.fromJSON(e)).toList() ??
            <DrivingLicenseCategory>[];
    final restrictions = json['restrictions']?.toString();
    final endorsements = json['endorsements']?.toString();

    return DrivingLicenseDetails._(
      drivingLicenseCategories: drivingLicenseCategories,
      restrictions: restrictions,
      endorsements: endorsements,
    );
  }

  /// Additional information from driver licenses such as vehicle categories.
  ///
  /// Added in version 8.0.0
  List<DrivingLicenseCategory> get drivingLicenseCategories => _drivingLicenseCategories;

  /// The restrictions to driving privileges for the driver license owner.
  ///
  /// Added in version 8.0.0
  String? get restrictions => _restrictions;

  /// The additional privileges granted to the driver license owner.
  ///
  /// Added in version 8.0.0
  String? get endorsements => _endorsements;
}
