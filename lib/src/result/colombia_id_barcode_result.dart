/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';

@immutable
class ColombiaIdBarcodeResult {
  final String _bloodType;

  ColombiaIdBarcodeResult._(this._bloodType);

  ColombiaIdBarcodeResult.fromJSON(Map<String, dynamic> json) : this._(json["bloodType"] as String);

  String get bloodType {
    return _bloodType;
  }
}
