/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'date_result.dart';

class SouthAfricaDlBarcodeResult {
  int _version;
  String _licenseCountryOfIssue;
  String _personalIdNumber;
  String _personalIdNumberType;
  int _documentCopy;
  ProfessionalDrivingPermit? _professionalDrivingPermit;
  List<VehicleRestriction> _vehicleRestrictions;
  List<int> _driverRestrictionCodes;

  SouthAfricaDlBarcodeResult._(
      this._version,
      this._licenseCountryOfIssue,
      this._personalIdNumber,
      this._personalIdNumberType,
      this._documentCopy,
      this._professionalDrivingPermit,
      this._vehicleRestrictions,
      this._driverRestrictionCodes);

  factory SouthAfricaDlBarcodeResult.fromJSON(Map<String, dynamic> json) {
    ProfessionalDrivingPermit? professionalDrivingPermit;

    if (json.containsKey("professionalDrivingPermit") && json["professionalDrivingPermit"] != null) {
      professionalDrivingPermit =
          ProfessionalDrivingPermit.fromJSON(json["professionalDrivingPermit"] as Map<String, dynamic>);
    }

    var vehicleRestrictions = <VehicleRestriction>[];
    if (json.containsKey("vehicleRestrictions") && json["vehicleRestrictions"] != null) {
      vehicleRestrictions.addAll((json['vehicleRestrictions'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((e) => VehicleRestriction.fromJSON(e))
          .toList()
          .cast<VehicleRestriction>());
    }

    return SouthAfricaDlBarcodeResult._(
        json["version"] as int,
        json["licenseCountryOfIssue"] as String,
        json["personalIdNumber"] as String,
        json["personalIdNumberType"] as String,
        json["documentCopy"] as int,
        professionalDrivingPermit,
        vehicleRestrictions,
        json["driverRestrictionCodes"] as List<int>);
  }

  int get version {
    return _version;
  }

  String get licenseCountryOfIssue {
    return _licenseCountryOfIssue;
  }

  String get personalIdNumber {
    return _personalIdNumber;
  }

  String get personalIdNumberType {
    return _personalIdNumberType;
  }

  int get documentCopy {
    return _documentCopy;
  }

  ProfessionalDrivingPermit? get professionalDrivingPermit {
    return _professionalDrivingPermit;
  }

  List<VehicleRestriction> get vehicleRestrictions {
    return _vehicleRestrictions;
  }

  List<int> get driverRestrictionCodes {
    return _driverRestrictionCodes;
  }
}

class ProfessionalDrivingPermit {
  DateResult _dateOfExpiry;
  List<String> _codes;

  ProfessionalDrivingPermit._(this._dateOfExpiry, this._codes);

  ProfessionalDrivingPermit.fromJSON(Map<String, dynamic> json)
      : this._(DateResult.fromJSON(json["dateOfExpiry"] as Map<String, dynamic>), json["codes"] as List<String>);

  DateResult get dateOfExpiry {
    return _dateOfExpiry;
  }

  List<String> get codes {
    return _codes;
  }
}

class VehicleRestriction {
  String _vehicleCode;
  String _vehicleRestriction;
  DateResult _dateOfIssue;

  VehicleRestriction._(this._vehicleCode, this._vehicleRestriction, this._dateOfIssue);

  VehicleRestriction.fromJSON(Map<String, dynamic> json)
      : this._(json["vehicleCode"], json["vehicleRestriction"],
            DateResult.fromJSON(json["dateOfIssue"] as Map<String, dynamic>));

  String get vehicleCode {
    return _vehicleCode;
  }

  String get vehicleRestriction {
    return _vehicleRestriction;
  }

  DateResult get dateOfIssue {
    return _dateOfIssue;
  }
}
