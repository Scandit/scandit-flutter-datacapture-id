/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

/// Possible image types that can be extracted from a recognized document.
///
/// Added in version 6.11.0
enum IdImageType {
  /// A photo of the document’s holder.
  ///
  /// Added in version 6.11.0
  face('face'),
  /// A cropped image of the document.
  ///
  /// Added in version 7.0.0
  croppedDocument('croppedDocument'),
  /// An image of the full frame the document was captured on.
  ///
  /// Added in version 7.0.0
  frame('frame');

  const IdImageType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdImageTypeDeserializer on IdImageType {
  static IdImageType fromJSON(String jsonValue) {
    return IdImageType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
