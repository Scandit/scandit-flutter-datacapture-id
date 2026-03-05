/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

enum IdSide {
  front('front'),
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
