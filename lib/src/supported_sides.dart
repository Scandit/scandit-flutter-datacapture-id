/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum SupportedSides {
  frontOnly('frontOnly'),
  frontAndBack('frontAndBack');

  const SupportedSides(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension SupportedSidesDeserializer on SupportedSides {
  static SupportedSides fromJSON(String jsonValue) {
    return SupportedSides.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
