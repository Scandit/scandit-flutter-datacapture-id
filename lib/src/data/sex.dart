/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

enum Sex {
  female('female'),

  male('male'),

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
