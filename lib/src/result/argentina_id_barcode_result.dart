/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';

@immutable
class ArgentinaIdBarcodeResult {
  final String _personalIdNumber;
  final String _documentCopy;

  ArgentinaIdBarcodeResult._(this._personalIdNumber, this._documentCopy);

  ArgentinaIdBarcodeResult.fromJSON(Map<String, dynamic> json)
      : this._(json["personalIdNumber"] as String, json["documentCopy"] as String);

  String get personalIdNumber {
    return _personalIdNumber;
  }

  String get documentCopy {
    return _documentCopy;
  }
}
