/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';

@immutable
class MrzResult {
  final String _documentCode;
  final bool _namesAreTruncated;
  final String? _optional;
  final String? _optional1;
  final String _capturedMrz;

  MrzResult._(this._documentCode, this._namesAreTruncated, this._optional, this._optional1, this._capturedMrz);

  MrzResult.fromJSON(Map<String, dynamic> json)
      : this._(json['documentCode'] as String, json['namesAreTruncated'] as bool, json['optional'] as String?,
            json['optional1'] as String?, json['capturedMrz'] as String);

  String get documentCode {
    return _documentCode;
  }

  bool get namesAreTruncated {
    return _namesAreTruncated;
  }

  String? get optional {
    return _optional;
  }

  String? get optional1 {
    return _optional1;
  }

  String get capturedMrz {
    return _capturedMrz;
  }
}
