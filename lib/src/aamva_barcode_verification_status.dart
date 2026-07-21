/// The verification status returned by the barcode verifier.
enum AamvaBarcodeVerificationStatus {
  /// The barcode is authentic.
  authentic('authentic'),

  /// The barcode is likely forged.
  likelyForged('likelyForged'),

  /// The barcode is forged.
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
