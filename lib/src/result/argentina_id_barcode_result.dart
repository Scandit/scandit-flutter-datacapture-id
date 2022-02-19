/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

class ArgentinaIdBarcodeResult {
  String _personalIdNumber;
  String _documentCopy;

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
