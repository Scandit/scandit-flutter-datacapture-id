/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

enum DataConsistencyCheck {
  issuingCountryComparison('issuingCountryComparison'),
  issuingJurisdictionComparison('issuingJurisdictionComparison'),
  fullNameComparison('fullNameComparison'),
  documentNumberComparison('documentNumberComparison'),
  dateOfBirthComparison('dateOfBirthComparison'),
  dateOfExpiryComparison('dateOfExpiryComparison'),
  dateOfIssueComparison('dateOfIssueComparison');

  const DataConsistencyCheck(this._name);

  final String _name;
  @override
  String toString() => _name;
}

extension DataConsistencyCheckDeserializer on DataConsistencyCheck {
  static DataConsistencyCheck fromJSON(String jsonValue) {
    return DataConsistencyCheck.values.firstWhere(
      (element) => element.toString() == jsonValue,
    );
  }
}
