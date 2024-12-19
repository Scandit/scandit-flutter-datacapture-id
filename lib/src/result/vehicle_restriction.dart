/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/result/date_result.dart';

@immutable
class VehicleRestriction {
  final String _vehicleCode;
  final String _vehicleRestriction;
  final DateResult _dateOfIssue;

  const VehicleRestriction._(this._vehicleCode, this._vehicleRestriction, this._dateOfIssue);

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
