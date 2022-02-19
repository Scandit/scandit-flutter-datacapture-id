/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum SupportedSides { frontOnly, frontAndBack }

extension SupportedSidesDeserializer on SupportedSides {
  static SupportedSides fromJSON(String jsonValue) {
    return SupportedSides.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}
