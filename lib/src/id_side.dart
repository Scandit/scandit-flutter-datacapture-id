/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

/// Sides of a document.
///
/// Added in version 7.0.0
enum IdSide {
  /// Front side of a document.
  ///
  /// Added in version 7.0.0
  front('front'),
  /// Back side of the document.
  ///
  /// Added in version 7.0.0
  back('back');

  const IdSide(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdSideDeserializer on IdSide {
  static IdSide fromJSON(String jsonValue) {
    return IdSide.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
