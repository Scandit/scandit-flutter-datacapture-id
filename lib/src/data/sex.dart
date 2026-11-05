/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

/// An enumeration of possible sexes.
///
/// Added in version 8.0.0
enum Sex {
  /// Female sex.
  ///
  /// Added in version 8.0.0
  female('female'),

  /// Male sex.
  ///
  /// Added in version 8.0.0
  male('male'),

  /// Unspecified sex.
  ///
  /// Added in version 8.0.0
  unspecified('unspecified');

  const Sex(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension SexDeserializer on Sex {
  static Sex fromJSON(String jsonValue) {
    return Sex.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
