/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

/// The status returned by clone detection.
enum CloneDetectionStatus {
  /// Clone detection succeeded.
  succeeded('succeeded'),

  /// Clone detection failed.
  failed('failed'),

  /// Clone detection status is unknown.
  unknown('unknown');

  const CloneDetectionStatus(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension CloneDetectionStatusSerializer on CloneDetectionStatus {
  static CloneDetectionStatus fromJson(String json) {
    return CloneDetectionStatus.values.firstWhere((element) => element.toString() == json);
  }
}
