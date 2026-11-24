/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

/// Indicates whether the document is REAL ID compliant.
///
/// Added in version 8.0.0
enum UsRealIdStatus {
  /// 1. For driver’s licenses and IDs issued by US states, territories and District of Colombia: your license doesn’t include the feature to read the REAL ID indicator. Please contact Scandit if you would like to use this feature.
  /// 2. Value returned for all other documents.
  ///
  /// Added in version 8.0.0
  notAvailable('notAvailable'),

  /// The document is not REAL ID compliant
  ///
  /// Added in version 8.0.0
  notRealIdCompliant('notRealIdCompliant'),

  /// The document is REAL ID compliant
  ///
  /// Added in version 8.0.0
  realIdCompliant('realIdCompliant');

  const UsRealIdStatus(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension UsRealIdStatusDeserializer on UsRealIdStatus {
  static UsRealIdStatus fromJSON(String jsonValue) {
    return UsRealIdStatus.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
