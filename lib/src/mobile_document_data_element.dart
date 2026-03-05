/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

enum MobileDocumentDataElement {
  familyName('familyName'),
  givenName('givenName'),
  birthDate('birthDate'),
  issueDate('issueDate'),
  expiryDate('expiryDate'),
  issuingCountry('issuingCountry'),
  issuingAuthority('issuingAuthority'),
  documentNumber('documentNumber'),
  portrait('portrait'),
  drivingPrivileges('drivingPrivileges'),
  administrativeNumber('administrativeNumber'),
  sexIso('sexIso'),
  height('height'),
  weight('weight'),
  eyeColour('eyeColour'),
  hairColour('hairColour'),
  birthPlace('birthPlace'),
  residentAddress('residentAddress'),
  issuingJurisdiction('issuingJurisdiction'),
  nationality('nationality'),
  nameSuffix('nameSuffix'),
  familyNameTruncation('familyNameTruncation'),
  givenNameTruncation('givenNameTruncation'),
  akaFamilyName('akaFamilyName'),
  akaGivenName('akaGivenName'),
  akaSuffix('akaSuffix'),
  weightRange('weightRange'),
  raceEthnicity('raceEthnicity'),
  residentCounty('residentCounty'),
  sexAamva('sexAamva'),
  aamvaVersion('aamvaVersion');

  const MobileDocumentDataElement(this._name);

  final String _name;

  @override
  String toString() => _name;

  factory MobileDocumentDataElement.fromJSON(String jsonValue) {
    return MobileDocumentDataElement.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
