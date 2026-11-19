/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/result/date_result.dart';

@immutable
class ProfessionalDrivingPermit {
  final DateResult _dateOfExpiry;
  final List<String> _codes;

  const ProfessionalDrivingPermit._(this._dateOfExpiry, this._codes);

  ProfessionalDrivingPermit.fromJSON(Map<String, dynamic> json)
      : this._(DateResult.fromJSON(json["dateOfExpiry"] as Map<String, dynamic>), json["codes"] as List<String>);

  DateResult get dateOfExpiry {
    return _dateOfExpiry;
  }

  List<String> get codes {
    return _codes;
  }
}
