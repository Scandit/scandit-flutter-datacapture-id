/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

enum IdFieldType {
  additionalAddressInformation('additionalAddressInformation'),
  additionalNameInformation('additionalNameInformation'),
  address('address'),
  age('age'),
  barcodeDictionary('barcodeDictionary'),
  bloodType('bloodType'),
  dateOfBirth('dateOfBirth'),
  dateOfExpiry('dateOfExpiry'),
  dateOfIssue('dateOfIssue'),
  documentAdditionalNumber('documentAdditionalNumber'),
  documentNumber('documentNumber'),
  employer('employer'),
  fathersName('fathersName'),
  firstName('firstName'),
  fullName('fullName'),
  issuingAuthority('issuingAuthority'),
  lastName('lastName'),
  maritalStatus('maritalStatus'),
  mothersName('mothersName'),
  mrzOptionalDataInLine1('mrzOptionalDataInLine1'),
  mrzOptionalDataInLine2('mrzOptionalDataInLine2'),
  nationality('nationality'),
  personalIdNumber('personalIdNumber'),
  placeOfBirth('placeOfBirth'),
  profession('profession'),
  race('race'),
  religion('religion'),
  residentialStatus('residentialStatus'),
  sex('sex');

  const IdFieldType(this._name);

  @override
  String toString() => _name;

  final String _name;

  static IdFieldType fromJSON(String jsonValue) {
    return IdFieldType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
