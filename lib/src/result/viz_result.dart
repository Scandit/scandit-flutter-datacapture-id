/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import '../supported_sides.dart';

class VizResult {
  String? _additionalNameInformation;
  String? _additionalAddressInformation;
  String? _placeOfBirth;
  String? _race;
  String? _religion;
  String? _profession;
  String? _maritalStatus;
  String? _residentialStatus;
  String? _employer;
  String? _personalIdNumber;
  String? _documentAdditionalNumber;
  String? _issuingJurisdiction;
  String? _issuingAuthority;
  SupportedSides _capturedSides;
  bool _isBackSideCaptureSupported;

  VizResult._(
      this._additionalNameInformation,
      this._additionalAddressInformation,
      this._placeOfBirth,
      this._race,
      this._religion,
      this._profession,
      this._maritalStatus,
      this._residentialStatus,
      this._employer,
      this._personalIdNumber,
      this._documentAdditionalNumber,
      this._issuingJurisdiction,
      this._issuingAuthority,
      this._capturedSides,
      this._isBackSideCaptureSupported);

  VizResult.fromJSON(Map<String, dynamic> json)
      : this._(
            json['additionalNameInformation'] as String?,
            json['additionalAddressInformation'] as String?,
            json['placeOfBirth'] as String?,
            json['race'] as String?,
            json['religion'] as String?,
            json['profession'] as String?,
            json['maritalStatus'] as String?,
            json['residentialStatus'] as String?,
            json['employer'] as String?,
            json['personalIdNumber'] as String?,
            json['documentAdditionalNumber'] as String?,
            json['issuingJurisdiction'] as String?,
            json['issuingAuthority'] as String?,
            SupportedSidesDeserializer.fromJSON(json['capturedSides']),
            json['isBackSideCaptureSupported'] as bool);

  String? get additionalNameInformation {
    return _additionalNameInformation;
  }

  String? get additionalAddressInformation {
    return _additionalAddressInformation;
  }

  String? get placeOfBirth {
    return _placeOfBirth;
  }

  String? get race {
    return _race;
  }

  String? get religion {
    return _religion;
  }

  String? get profession {
    return _profession;
  }

  String? get maritalStatus {
    return _maritalStatus;
  }

  String? get residentialStatus {
    return _residentialStatus;
  }

  String? get employer {
    return _employer;
  }

  String? get personalIdNumber {
    return _personalIdNumber;
  }

  String? get documentAdditionalNumber {
    return _documentAdditionalNumber;
  }

  String? get issuingJurisdiction {
    return _issuingJurisdiction;
  }

  String? get issuingAuthority {
    return _issuingAuthority;
  }

  SupportedSides get capturedSides {
    return _capturedSides;
  }

  bool get isBackSideCaptureSupported {
    return _isBackSideCaptureSupported;
  }
}
