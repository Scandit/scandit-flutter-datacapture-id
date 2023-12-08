/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum DocumentType {
  none('none'),
  consularId('consularId'),
  drivingLicense('drivingLicense'),
  drivingLicensePublicServicesCard('drivingLicensePublicServicesCard'),
  employmentPass('employmentPass'),
  finCard('finCard'),
  id('id'),
  multipurposeId('multipurposeId'),
  myKad('myKad'),
  myKid('myKid'),
  myPR('myPr'),
  myTentera('myTentera'),
  panCard('panCard'),
  professionalId('professionalId'),
  publicServicesCard('publicServicesCard'),
  residencePermit('residencePermit'),
  residentId('residentId'),
  temporaryResidencePermit('temporaryResidencePermit'),
  voterId('voterId'),
  workPermit('workPermit'),
  iKad('iKad'),
  militaryId('militaryId'),
  myKas('myKas'),
  socialSecurityCard('socialSecurityCard'),
  healthInsuranceCard('healthInsuranceCard'),
  passport('passport'),
  diplomaticPassport('diplomaticPassport'),
  servicePassport('servicePassport'),
  temporaryPassport('temporaryPassport'),
  visa('visa'),
  sPass('sPass'),
  addressCard('addressCard'),
  alienId('alienId'),
  alienPassport('alienPassport'),
  greenCard('greenCard'),
  minorsId('minorsId'),
  postalId('postalId'),
  professionalDl('professionalDl'),
  weaponPermit('weaponPermit'),
  taxId('taxId'),
  borderCrossingCard('borderCrossingCard'),
  driverCard('driverCard'),
  globalEntryCard('globalEntryCard'),
  myPolis('myPolis'),
  nexusCard('nexusCard'),
  passportCard('passportCard'),
  proofOfAgeCard('proofOfAgeCard'),
  refugeeId('refugeeId'),
  tribalId('tribalId'),
  veteranId('veteranId'),
  citizenshipCertificate('citizenshipCertificate'),
  myNumberCard('myNumberCard'),
  minorsPassport('minorsPassport'),
  minorsPublicServicesCard('minorsPublicServicesCard'),
  apecBusinessTravelCard('apecBusinessTravelCard'),
  asylumRequest('asylumRequest'),
  driverQualificationCard('driverQualificationCard'),
  provisionalDl('provisionalDl'),
  refugeePassport('refugeePassport'),
  specialId('specialId'),
  uniformedServicesId('uniformedServicesId');

  const DocumentType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension DocumentTypeDeserializer on DocumentType {
  static DocumentType fromJSON(String jsonValue) {
    return DocumentType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
