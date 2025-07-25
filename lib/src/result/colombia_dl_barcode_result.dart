/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2022- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';

@immutable
class ColombiaDlBarcodeResult {
  final List<String> _categories;

  final String _identificationType;

  ColombiaDlBarcodeResult._(this._categories, this._identificationType);

  ColombiaDlBarcodeResult.fromJSON(Map<String, dynamic> json)
      : this._((json["categories"] as List<dynamic>).map((e) => e.toString()).toList(),
            json["identificationType"] as String);

  List<String> get categories {
    return _categories;
  }

  String get identificationType {
    return _identificationType;
  }
}
