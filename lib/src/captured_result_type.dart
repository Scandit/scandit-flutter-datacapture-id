/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum CapturedResultType {
  aamvaBarcodeResult('aamvaBarcodeResult'),
  argentinaIdBarcodeResult('argentinaIdBarcodeResult'),
  colombiaIdBarcodeResult('colombiaIdBarcodeResult'),
  colombiaDlBarcodeResult('colombiaDlBarcodeResult'),
  mrzResult('mrzResult'),
  southAfricaDlBarcodeResult('southAfricaDlBarcodeResult'),
  southAfricaIdBarcodeResult('southAfricaIdBarcodeResult'),
  usUniformedServicesBarcodeResult('usUniformedServicesBarcodeResult'),
  vizResult('vizResult'),
  chinaMainlandTravelPermitMrzResult('chinaMainlandTravelPermitMrzResult'),
  chinaExitEntryPermitMrzResult('chinaExitEntryPermitMrzResult'),
  chinaOneWayPermitBackMrzResult('chinaOneWayPermitBackMrzResult'),
  chinaOneWayPermitFrontMrzResult('chinaOneWayPermitFrontMrzResult'),
  apecBusinessTravelCardMrzResult('apecBusinessTravelCardMrzResult'),
  usVisaVizResult('usVisaVizResult'),
  commonAccessCardBarcodeResult('commonAccessCardBarcodeResult');

  const CapturedResultType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension CapturedResultTypeDeserializer on CapturedResultType {
  static CapturedResultType fromJSON(String jsonValue) {
    return CapturedResultType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
