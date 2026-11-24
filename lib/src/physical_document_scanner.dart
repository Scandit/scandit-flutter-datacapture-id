/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

/// Sealed interface representing scanner configurations for physical identity documents (cards and booklets). Physical documents include ID cards, driver’s licenses, passports, and other government-issued documents.Implementations:[SingleSideScanner] - Scans specific zones (barcode, MRZ, VIZ) of a document[FullDocumentScanner] - Scans all supported parts of a document, including both sides for card-format documents
///
/// Added in version 8.0.0
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

/// Represents a scanner configuration that focuses on specific parts of a document (referred to as “zones”) rather than the entire document. The scanner can be customized to extract data from one or more of the following zones: barcodes, Machine-Readable Zone (MRZ) and Human-Readable Zone (Visual Inspection Zone, VIZ).This scanner type is useful for tailored use cases, such as extracting specific data points from documents or handling scenarios where different document types encode information in varying zones. When multiple zones are enabled, the scanner intelligently captures data from the zone available on the presented document.
///
/// Added in version 8.0.0
class SingleSideScanner extends PhysicalDocumentScanner {
  /// Creates a new SingleSideScanner instance. Note that the freeFormText parameter is experimental and cannot be used without a compliant license key.
  ///
  /// Added in version 8.5.0
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

  /// Extracts data from barcodes on identity documents
  ///
  /// Added in version 8.0.0
  bool get barcode => _barcode;

  /// Extracts data from the Machine Readable Zone on identity documents
  ///
  /// Added in version 8.0.0
  bool get machineReadableZone => _machineReadableZone;

  /// Extracts all information from the front side of a card format document or equivalent to “Full Document” for booklet documents
  ///
  /// Added in version 8.0.0
  bool get visualInspectionZone => _visualInspectionZone;

  /// Extracts free-form text from the document. This parameter is experimental and cannot be used without a compliant license key.
  ///
  /// Added in version 8.5.0
  bool get freeFormText => _freeFormText;
}

/// Represents a scanner configuration that captures data from all supported parts of a document. This includes the human-readable zone (visual inspection zone, VIZ), the machine-readable zone (MRZ), and barcodes, provided they are present and supported by the library.For card-format documents (e.g., driver’s licenses or ID cards), both the front and back are scanned. The user is prompted to scan the back after the front, and the combined result is returned.For booklet-format documents (e.g., passports), the identity page is scanned, encompassing both the human-readable and machine-readable parts. This scanner type is ideal for use cases requiring comprehensive data extraction, data consistency checks, or full-document image capture.
///
/// Added in version 8.0.0
class FullDocumentScanner extends PhysicalDocumentScanner {
  /// Creates a new FullDocumentScanner instance.
  ///
  /// Added in version 8.0.0
  FullDocumentScanner()
      : super._(
          isFull: true,
          barcode: true,
          machineReadableZone: true,
          visualInspectionZone: true,
          freeFormText: true,
        );
}
