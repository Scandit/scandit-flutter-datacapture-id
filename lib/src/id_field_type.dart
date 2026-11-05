/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

/// An enumeration of possible ID document field types that can be referenced for anonymization purposes.
///
/// Added in version 8.0.0
enum IdFieldType {
  /// Additional address information field.
  ///
  /// Added in version 8.0.0
  additionalAddressInformation('additionalAddressInformation'),
  /// Additional name information field.
  ///
  /// Added in version 8.0.0
  additionalNameInformation('additionalNameInformation'),
  /// Address field.
  ///
  /// Added in version 8.0.0
  address('address'),
  /// Age field.
  ///
  /// Added in version 8.0.0
  age('age'),
  /// Barcode dictionary field.
  ///
  /// Added in version 8.0.0
  barcodeDictionary('barcodeDictionary'),
  /// Blood type field.
  ///
  /// Added in version 8.0.0
  bloodType('bloodType'),
  /// Date of birth field.
  ///
  /// Added in version 8.0.0
  dateOfBirth('dateOfBirth'),
  /// Date of expiry field.
  ///
  /// Added in version 8.0.0
  dateOfExpiry('dateOfExpiry'),
  /// Date of issue field.
  ///
  /// Added in version 8.0.0
  dateOfIssue('dateOfIssue'),
  /// Document additional number field.
  ///
  /// Added in version 8.0.0
  documentAdditionalNumber('documentAdditionalNumber'),
  /// Document number field.
  ///
  /// Added in version 8.0.0
  documentNumber('documentNumber'),
  /// Employer field.
  ///
  /// Added in version 8.0.0
  employer('employer'),
  /// Father’s name field.
  ///
  /// Added in version 8.0.0
  fathersName('fathersName'),
  /// First name field.
  ///
  /// Added in version 8.0.0
  firstName('firstName'),
  /// Full name field.
  ///
  /// Added in version 8.0.0
  fullName('fullName'),
  /// Issuing authority field.
  ///
  /// Added in version 8.0.0
  issuingAuthority('issuingAuthority'),
  /// Last name field.
  ///
  /// Added in version 8.0.0
  lastName('lastName'),
  /// Marital status field.
  ///
  /// Added in version 8.0.0
  maritalStatus('maritalStatus'),
  /// Mother’s name field.
  ///
  /// Added in version 8.0.0
  mothersName('mothersName'),
  /// MRZ optional data in line 1 field.
  ///
  /// Added in version 8.0.0
  mrzOptionalDataInLine1('mrzOptionalDataInLine1'),
  /// MRZ optional data in line 2 field.
  ///
  /// Added in version 8.0.0
  mrzOptionalDataInLine2('mrzOptionalDataInLine2'),
  /// Nationality field.
  ///
  /// Added in version 8.0.0
  nationality('nationality'),
  /// Personal ID number field.
  ///
  /// Added in version 8.0.0
  personalIdNumber('personalIdNumber'),
  /// Place of birth field.
  ///
  /// Added in version 8.0.0
  placeOfBirth('placeOfBirth'),
  /// Profession field.
  ///
  /// Added in version 8.0.0
  profession('profession'),
  /// Race field.
  ///
  /// Added in version 8.0.0
  race('race'),
  /// Religion field.
  ///
  /// Added in version 8.0.0
  religion('religion'),
  /// Residential status field.
  ///
  /// Added in version 8.0.0
  residentialStatus('residentialStatus'),
  /// Sex field.
  ///
  /// Added in version 8.0.0
  sex('sex');

  const IdFieldType(this._name);

  @override
  String toString() => _name;

  final String _name;

  static IdFieldType fromJSON(String jsonValue) {
    return IdFieldType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
