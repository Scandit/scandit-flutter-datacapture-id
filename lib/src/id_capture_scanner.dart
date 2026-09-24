/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

abstract class IdCaptureScanner implements Serializable {
  final bool _isFull;
  final bool _barcode;
  final bool _machineReadableZone;
  final bool _visualInspectionZone;

  IdCaptureScanner._(this._isFull, this._barcode, this._machineReadableZone, this._visualInspectionZone);

  @override
  Map<String, dynamic> toMap() {
    return {
      'options': {
        'barcode': _barcode,
        'machineReadableZone': _machineReadableZone,
        'visualInspectionZone': _visualInspectionZone
      },
      'isFull': _isFull,
    };
  }
}

class SingleSideScanner extends IdCaptureScanner {
  SingleSideScanner(bool barcode, bool machineReadableZone, bool visualInspectionZone)
      : super._(false, barcode, machineReadableZone, visualInspectionZone);

  bool get barcode => _barcode;

  bool get machineReadableZone => _machineReadableZone;

  bool get visualInspectionZone => _visualInspectionZone;
}

class FullDocumentScanner extends IdCaptureScanner {
  FullDocumentScanner() : super._(true, true, true, true);
}
