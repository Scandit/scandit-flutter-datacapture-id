/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/result/date_result.dart';

/// Added in version 6.11.0
@immutable
class VehicleRestriction {
  final String _vehicleCode;
  final String _vehicleRestriction;
  final DateResult _dateOfIssue;

  const VehicleRestriction._(this._vehicleCode, this._vehicleRestriction, this._dateOfIssue);

  VehicleRestriction.fromJSON(Map<String, dynamic> json)
      : this._(json["vehicleCode"], json["vehicleRestriction"],
            DateResult.fromJSON(json["dateOfIssue"] as Map<String, dynamic>));

  /// The category of motor vehicle the Driver’s License is valid for. Check the information printed on the Driver’s License for the list of valid codes.
  ///
  /// Added in version 6.11.0
  String get vehicleCode {
    return _vehicleCode;
  }

  /// The restriction that applies to the motor vehicle category. Check the information printed on the Driver’s License for the list of possible restrictions.
  ///
  /// Added in version 6.11.0
  String get vehicleRestriction {
    return _vehicleRestriction;
  }

  /// The date when this vehicle restriction starts to apply.
  ///
  /// Added in version 6.11.0
  DateResult get dateOfIssue {
    return _dateOfIssue;
  }
}
