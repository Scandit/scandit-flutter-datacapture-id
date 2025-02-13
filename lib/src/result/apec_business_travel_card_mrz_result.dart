/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'date_result.dart';

class ApecBusinessTravelCardMrzResult {
  final String _documentCode;
  final String _capturedMrz;
  final String _passportIssuerIso;
  final String _passportNumber;
  final DateResult? _passportDateOfExpiry;

  ApecBusinessTravelCardMrzResult._(
      this._documentCode, this._capturedMrz, this._passportIssuerIso, this._passportNumber, this._passportDateOfExpiry);

  factory ApecBusinessTravelCardMrzResult.fromJSON(Map<String, dynamic> json) {
    DateResult? passportDateOfExpiry;
    if (json.containsKey("passportDateOfExpiry") && json["passportDateOfExpiry"] != null) {
      passportDateOfExpiry = DateResult.fromJSON(json["passportDateOfExpiry"] as Map<String, dynamic>);
    }

    return ApecBusinessTravelCardMrzResult._(json["documentCode"] as String, json["capturedMrz"] as String,
        json["passportIssuerIso"] as String, json["passportNumber"] as String, passportDateOfExpiry);
  }

  String get documentCode {
    return _documentCode;
  }

  String get capturedMrz {
    return _capturedMrz;
  }

  String get passportIssuerIso {
    return _passportIssuerIso;
  }

  String get passportNumber {
    return _passportNumber;
  }

  DateResult? get passportDateOfExpiry {
    return _passportDateOfExpiry;
  }
}
