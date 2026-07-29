/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

abstract class PhysicalDocumentScanner implements Serializable {
  final bool _isFull;
  final bool _barcode;
  final bool _machineReadableZone;
  final bool _visualInspectionZone;

  PhysicalDocumentScanner._(
      {required bool isFull,
      required bool barcode,
      required bool machineReadableZone,
      required bool visualInspectionZone})
      : _isFull = isFull,
        _barcode = barcode,
        _machineReadableZone = machineReadableZone,
        _visualInspectionZone = visualInspectionZone;

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

class SingleSideScanner extends PhysicalDocumentScanner {
  SingleSideScanner(bool barcode, bool machineReadableZone, bool visualInspectionZone)
      : super._(
          isFull: false,
          barcode: barcode,
          machineReadableZone: machineReadableZone,
          visualInspectionZone: visualInspectionZone,
        );

  bool get barcode => _barcode;

  bool get machineReadableZone => _machineReadableZone;

  bool get visualInspectionZone => _visualInspectionZone;
}

class FullDocumentScanner extends PhysicalDocumentScanner {
  FullDocumentScanner()
      : super._(
          isFull: true,
          barcode: true,
          machineReadableZone: true,
          visualInspectionZone: true,
        );
}
