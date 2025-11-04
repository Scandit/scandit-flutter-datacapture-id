/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

enum UsRealIdStatus {
  notAvailable('notAvailable'),

  notRealIdCompliant('notRealIdCompliant'),

  realIdCompliant('realIdCompliant');

  const UsRealIdStatus(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension UsRealIdStatusDeserializer on UsRealIdStatus {
  static UsRealIdStatus fromJSON(String jsonValue) {
    return UsRealIdStatus.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
