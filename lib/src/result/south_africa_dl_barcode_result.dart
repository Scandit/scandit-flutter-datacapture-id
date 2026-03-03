/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';

import 'date_result.dart';

@immutable
class SouthAfricaDlBarcodeResult {
  final int _version;
  final String _licenseCountryOfIssue;
  final String _personalIdNumber;
  final String _personalIdNumberType;
  final int _documentCopy;
  final ProfessionalDrivingPermit? _professionalDrivingPermit;
  final List<VehicleRestriction> _vehicleRestrictions;
  final List<int> _driverRestrictionCodes;

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
        (json["driverRestrictionCodes"] as List<dynamic>).cast<int>().toList());
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

@immutable
class ProfessionalDrivingPermit {
  final DateResult _dateOfExpiry;
  final List<String> _codes;

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

@immutable
class VehicleRestriction {
  final String _vehicleCode;
  final String _vehicleRestriction;
  final DateResult _dateOfIssue;

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
