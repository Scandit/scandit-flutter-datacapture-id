/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

/// Represents data elements that can be requested from mobile identity documents (mdocs) compliant with ISO 18013-5 and AAMVA standards. These elements are used to specify which data fields the application intends to retain, as required by the IntentToRetain flag in ISO 18013-5 mdoc requests.
///
/// Added in version 8.0.0
enum MobileDocumentDataElement {
  /// The family name of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  familyName('familyName'),
  /// The given name of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  givenName('givenName'),
  /// The date of birth of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  birthDate('birthDate'),
  /// The date of issue of the document. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  issueDate('issueDate'),
  /// The date of expiry of the document. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  expiryDate('expiryDate'),
  /// The country that issued the document. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  issuingCountry('issuingCountry'),
  /// The authority that issued the document. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  issuingAuthority('issuingAuthority'),
  /// The unique document number. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  documentNumber('documentNumber'),
  /// The portrait image of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  portrait('portrait'),
  /// The usual mark or signature image of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.7.0
  signatureUsualMark('signatureUsualMark'),
  /// The driving privileges and categories. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  drivingPrivileges('drivingPrivileges'),
  /// An administrative number associated with the document. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  administrativeNumber('administrativeNumber'),
  /// The sex of the document holder as defined by ISO standards. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  sexIso('sexIso'),
  /// The height of the document holder in centimeters. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  height('height'),
  /// The weight of the document holder in kilograms. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  weight('weight'),
  /// The eye color of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  eyeColour('eyeColour'),
  /// The hair color of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  hairColour('hairColour'),
  /// The place of birth of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  birthPlace('birthPlace'),
  /// The resident address of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  residentAddress('residentAddress'),
  /// The jurisdiction that issued the document. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  issuingJurisdiction('issuingJurisdiction'),
  /// The nationality of the document holder. Part of the ISO 18013-5 namespace.
  ///
  /// Added in version 8.0.0
  nationality('nationality'),
  /// A suffix for the name. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  nameSuffix('nameSuffix'),
  /// Indicates whether the family name was truncated. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  familyNameTruncation('familyNameTruncation'),
  /// Indicates whether the given name was truncated. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  givenNameTruncation('givenNameTruncation'),
  /// Also known as (AKA) family name. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  akaFamilyName('akaFamilyName'),
  /// Also known as (AKA) given name. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  akaGivenName('akaGivenName'),
  /// Also known as (AKA) name suffix. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  akaSuffix('akaSuffix'),
  /// A range representing the weight of the document holder. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  weightRange('weightRange'),
  /// The race or ethnicity of the document holder. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  raceEthnicity('raceEthnicity'),
  /// The county of residence. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  residentCounty('residentCounty'),
  /// The sex of the document holder as defined by AAMVA standards. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  sexAamva('sexAamva'),
  /// The AAMVA version number. Part of the AAMVA namespace.
  ///
  /// Added in version 8.0.0
  aamvaVersion('aamvaVersion');

  const MobileDocumentDataElement(this._name);

  final String _name;

  @override
  String toString() => _name;

  factory MobileDocumentDataElement.fromJSON(String jsonValue) {
    return MobileDocumentDataElement.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
