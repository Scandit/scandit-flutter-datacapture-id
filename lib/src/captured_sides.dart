/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

/// Sides of a personal identification document scanned by ID Capture.
///
/// Added in version 6.11.0
enum CapturedSides {
  /// Only the front side of a document.
  ///
  /// Added in version 6.11.0
  frontOnly('frontOnly'),
  /// Both the front and the back side of a document.
  ///
  /// Added in version 6.11.0
  frontAndBack('frontAndBack');

  const CapturedSides(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension CapturedSidesDeserializer on CapturedSides {
  static CapturedSides fromJSON(String jsonValue) {
    return CapturedSides.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
