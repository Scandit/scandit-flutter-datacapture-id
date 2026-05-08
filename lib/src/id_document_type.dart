/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdDocumentType {
  aamvaBarcode('aamvaBarcode'),
  argentinaIdBarcode('argentinaIdBarcode'),
  colombiaIdBarcode('colombiaIdBarcode'),
  colombiaDlBarcode('colombiaDlBarcode'),
  dlViz('dlViz'),
  idCardMrz('idCardMrz'),
  idCardViz('idCardViz'),
  passportMrz('passportMrz'),
  southAfricaDlBarcode('southAfricaDlBarcode'),
  southAfricaIdBarcode('southAfricaIdBarcode'),
  swissDlMrz('swissDlMrz'),
  usUsIdBarcode('usUsIdBarcode'),
  visaMrz('visaMrz'),
  chinaMainlandTravelPermitMrz('chinaMainlandTravelPermitMrz'),
  chinaExitEntryPermitMrz('chinaExitEntryPermitMrz'),
  chinaOneWayPermitBackMrz('chinaOneWayPermitBackMrz'),
  chinaOneWayPermitFrontMrz('chinaOneWayPermitFrontMrz'),
  apecBusinessTravelCardMrz('apecBusinessTravelCardMrz'),
  passportViz('passportViz'),
  commonAccessCardBarcode('commonAccessCardBarcode');

  const IdDocumentType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdDocumentTypeDeserializer on IdDocumentType {
  static IdDocumentType fromJSON(String jsonValue) {
    return IdDocumentType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
