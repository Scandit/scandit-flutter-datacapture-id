/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class UsVisaVizResult {
  final String _visaNumber;
  final String _passportNumber;

  UsVisaVizResult._(this._visaNumber, this._passportNumber);

  UsVisaVizResult.fromJSON(Map<String, dynamic> json)
      : this._(json["visaNumber"] as String, json["passportNumber"] as String);

  String get visaNumber {
    return _visaNumber;
  }

  String get passportNumber {
    return _passportNumber;
  }
}
