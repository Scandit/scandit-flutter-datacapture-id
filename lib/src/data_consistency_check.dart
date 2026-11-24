/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

/// The verification status returned by the barcode verifier
///
/// Added in version 8.0.0
enum DataConsistencyCheck {
  /// Comparison of issuing country between zones
  ///
  /// Added in version 8.0.0
  issuingCountryComparison('issuingCountryComparison'),
  /// Comparison of issuing jurisdiction between zones
  ///
  /// Added in version 8.0.0
  issuingJurisdictionComparison('issuingJurisdictionComparison'),
  /// Comparison of full name between zones
  ///
  /// Added in version 8.0.0
  fullNameComparison('fullNameComparison'),
  /// Comparison of document number between zones
  ///
  /// Added in version 8.0.0
  documentNumberComparison('documentNumberComparison'),
  /// Comparison of date of birth between zones
  ///
  /// Added in version 8.0.0
  dateOfBirthComparison('dateOfBirthComparison'),
  /// Comparison of date of expiry between zones
  ///
  /// Added in version 8.0.0
  dateOfExpiryComparison('dateOfExpiryComparison'),
  /// Comparison of date of issue between zones
  ///
  /// Added in version 8.0.0
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
