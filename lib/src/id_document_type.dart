/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdDocumentType {
  aamvaBarcode,
  argentinaIdBarcode,
  colombiaIdBarcode,
  colombiaDlBarcode,
  dlViz,
  idCardMrz,
  idCardViz,
  passportMrz,
  southAfricaDlBarcode,
  southAfricaIdBarcode,
  swissDlMrz,
  usUsIdBarcode,
  visaMrz
}

extension IdDocumentTypeDeserializer on IdDocumentType {
  static IdDocumentType fromJSON(String jsonValue) {
    return IdDocumentType.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}
