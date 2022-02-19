/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum CapturedResultType {
  aamvaBarcodeResult,
  argentinaIdBarcodeResult,
  colombiaIdBarcodeResult,
  mrzResult,
  southAfricaDlBarcodeResult,
  southAfricaIdBarcodeResult,
  usUniformedServicesBarcodeResult,
  vizResult
}

extension CapturedResultTypeDeserializer on CapturedResultType {
  static CapturedResultType fromJSON(String jsonValue) {
    return CapturedResultType.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}
