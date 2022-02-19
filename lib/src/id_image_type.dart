/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdImageType { face, idFront, idBack }

extension IdImageTypeDeserializer on IdImageType {
  static IdImageType fromJSON(String jsonValue) {
    return IdImageType.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}
