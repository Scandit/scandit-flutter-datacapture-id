/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

class SouthAfricaIdBarcodeResult {
  String _countryOfBirth;
  String _countryOfBirthIso;
  String _citizenshipStatus;
  String _personalIdNumber;

  SouthAfricaIdBarcodeResult._(
      this._countryOfBirth, this._countryOfBirthIso, this._citizenshipStatus, this._personalIdNumber);

  SouthAfricaIdBarcodeResult.fromJSON(Map<String, dynamic> json)
      : this._(json["countryOfBirth"] as String, json["countryOfBirthIso"] as String,
            json["citizenshipStatus"] as String, json["personalIdNumber"] as String);

  String get countryOfBirth {
    return _countryOfBirth;
  }

  String get countryOfBirthIso {
    return _countryOfBirthIso;
  }

  String get citizenshipStatus {
    return _citizenshipStatus;
  }

  String get personalIdNumber {
    return _personalIdNumber;
  }
}
