/// The verification status returned by the barcode verifier.
///
/// The verification status returned by the barcode verifier
///
/// Added in version 7.3.0
enum AamvaBarcodeVerificationStatus {
  /// The barcode is authentic.
  ///
  /// The barcode is authentic
  ///
  /// Added in version 7.3.0
  authentic('authentic'),

  /// The barcode is likely forged.
  ///
  /// The barcode is likely forged
  ///
  /// Added in version 7.3.0
  likelyForged('likelyForged'),

  /// The barcode is forged.
  ///
  /// The barcode is forged
  ///
  /// Added in version 7.3.0
  forged('forged');

  const AamvaBarcodeVerificationStatus(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension AamvaBarcodeVerificationStatusSerializer on AamvaBarcodeVerificationStatus {
  static AamvaBarcodeVerificationStatus fromJson(String json) {
    return AamvaBarcodeVerificationStatus.values.firstWhere((element) => element.toString() == json);
  }
}
