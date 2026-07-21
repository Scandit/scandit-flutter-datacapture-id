/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum CapturedSides {
  frontOnly('frontOnly'),
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
