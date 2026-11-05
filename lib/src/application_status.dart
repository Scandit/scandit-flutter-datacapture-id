/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

/// An enumeration of possible application status for a visa.
///
/// Added in version 8.5.0
enum ApplicationStatus {
  /// The visa application was approved.
  ///
  /// Added in version 8.5.0
  approved('approved'),
  /// The visa application was granted.
  ///
  /// Added in version 8.5.0
  granted('granted'),
  /// The visa application is pending.
  ///
  /// Added in version 8.5.0
  pending('pending'),
  /// The visa application was denied.
  ///
  /// Added in version 8.5.0
  denied('denied'),
  /// The visa application was revoked.
  ///
  /// Added in version 8.5.0
  revoked('revoked'),
  /// The visa application has expired.
  ///
  /// Added in version 8.5.0
  expired('expired'),
  /// The visa application was cancelled.
  ///
  /// Added in version 8.5.0
  cancelled('cancelled'),
  /// The visa application is of an unknown status.
  ///
  /// Added in version 8.5.0
  other('other'),
  /// The visa application is of an unknown status.
  ///
  /// Added in version 8.5.0
  unknown('unknown');

  const ApplicationStatus(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension ApplicationStatusDeserializer on ApplicationStatus {
  static ApplicationStatus fromJSON(String jsonValue) {
    return ApplicationStatus.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
