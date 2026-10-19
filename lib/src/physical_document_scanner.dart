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
  final bool _freeFormText;

  PhysicalDocumentScanner._(
      {required bool isFull,
      required bool barcode,
      required bool machineReadableZone,
      required bool visualInspectionZone,
      required bool freeFormText})
      : _isFull = isFull,
        _barcode = barcode,
        _machineReadableZone = machineReadableZone,
        _visualInspectionZone = visualInspectionZone,
        _freeFormText = freeFormText;

  @override
  Map<String, dynamic> toMap() {
    return {
      'options': {
        'barcode': _barcode,
        'machineReadableZone': _machineReadableZone,
        'visualInspectionZone': _visualInspectionZone,
        'freeFormText': _freeFormText,
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
          freeFormText: false,
        );

  SingleSideScanner.withFreeFormText(
      bool barcode, bool machineReadableZone, bool visualInspectionZone, bool freeFormText)
      : super._(
          isFull: false,
          barcode: barcode,
          machineReadableZone: machineReadableZone,
          visualInspectionZone: visualInspectionZone,
          freeFormText: freeFormText,
        );

  bool get barcode => _barcode;

  bool get machineReadableZone => _machineReadableZone;

  bool get visualInspectionZone => _visualInspectionZone;

  bool get freeFormText => _freeFormText;
}

class FullDocumentScanner extends PhysicalDocumentScanner {
  FullDocumentScanner()
      : super._(
          isFull: true,
          barcode: true,
          machineReadableZone: true,
          visualInspectionZone: true,
          freeFormText: true,
        );
}
