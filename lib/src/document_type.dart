/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum DocumentType {
  none,
  consularId,
  drivingLicense,
  drivingLicensePublicServicesCard,
  employmentPass,
  finCard,
  id,
  multipurposeId,
  myKad,
  myKid,
  myPR,
  myTentera,
  panCard,
  professionalId,
  publicServicesCard,
  residencePermit,
  residentId,
  temporaryResidencePermit,
  voterId,
  workPermit,
  iKad,
  militaryId,
  myKas,
  socialSecurityCard,
  healthInsuranceCard,
  passport,
  diplomaticPassport,
  servicePassport,
  temporaryPassport,
  visa,
  sPass,
  addressCard,
  alienId,
  alienPassport,
  greenCard,
  minorsId,
  postalId,
  professionalDl,
  weaponPermit,
  taxId,
  borderCrossingCard,
  driverCard,
  globalEntryCard,
  myPolis,
  nexusCard,
  passportCard,
  proofOfAgeCard,
  refugeeId,
  tribalId,
  veteranId,
  citizenshipCertificate,
  myNumberCard,
  minorsPassport,
  minorsPublicServicesCard,
}

extension DocumentTypeDeserializer on DocumentType {
  static DocumentType fromJSON(String jsonValue) {
    switch (jsonValue) {
      case "myPr":
        return DocumentType.myPR;
      default:
        return DocumentType.values.firstWhere((element) => element.jsonValue == jsonValue);
    }
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    switch (this) {
      case DocumentType.myPR:
        return "myPr";
      default:
        return toString().split('.').last;
    }
  }
}
