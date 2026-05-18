/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

/// The verification status returned by chip verification.
enum ChipVerificationStatus {
  /// Chip verification succeeded.
  succeeded('succeeded'),

  /// Chip verification failed.
  failed('failed'),

  /// Chip verification status is unknown.
  unknown('unknown');

  const ChipVerificationStatus(this._name);

  final String _name;

  @override
  String toString() => _name;

  static ChipVerificationStatus fromJson(String json) {
    return ChipVerificationStatus.values.firstWhere((element) => element.toString() == json);
  }
}
