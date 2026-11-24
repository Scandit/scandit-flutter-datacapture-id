/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/mobile_document_data_element.dart';
import 'package:scandit_flutter_datacapture_id/src/mobile_document_data_element_serialization.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/generated/schema_types.dart'
    show buildMobileDocumentScanner;

/// Configures scanning of mobile identity documents, including ISO 18013-5 compliant mobile driver’s licenses (mDL) and OCR-based mobile documents.
///
/// Added in version 8.0.0
class MobileDocumentScanner implements Serializable {
  final bool _iso180135;
  final bool _ocr;
  final Set<MobileDocumentDataElement> _elementsToRetain;

  /// Creates a new MobileDocumentScanner instance with specified elements to retain.
  ///
  /// Each requested data field includes a boolean IntentToRetain in device request according to ISO 18013-5 standards. This parameter allows you to specify which fields your application intends to retain, ensuring compliance with legal requirements. By default, IntentToRetain is set to false for all fields unless they are included in elementsToRetain.
  ///
  /// Added in version 8.0.0
  MobileDocumentScanner({required bool iso180135, required bool ocr, Set<MobileDocumentDataElement>? elementsToRetain})
      : _iso180135 = iso180135,
        _ocr = ocr,
        _elementsToRetain = elementsToRetain ?? {};

  /// Indicates whether ISO 18013-5 mDL scanning is enabled. When enabled, the scanner can read mobile driver’s licenses that comply with the ISO 18013-5 standard via Bluetooth Low Energy (BLE) communication.
  ///
  /// Added in version 8.0.0
  bool get iso180135 => _iso180135;
  /// Indicates whether OCR is enabled to extract data from mobile documents using a proprietary format. Note that this feature requires the ScanditLabelCaptureText library.
  ///
  /// Added in version 8.0.0
  bool get ocr => _ocr;
  /// The set of data elements that the application intends to retain from scanned mobile documents. This information is used to set the IntentToRetain flag in ISO 18013-5 mdoc requests, which is required for legal compliance with data protection standards. An empty set indicates no elements will be retained, and IntentToRetain will be set to false for all fields.
  ///
  /// Added in version 8.0.0
  Set<MobileDocumentDataElement> get elementsToRetain => _elementsToRetain;

  @override
  Map<String, dynamic> toMap() {
    return buildMobileDocumentScanner(
      iso180135: iso180135,
      ocr: ocr,
      // Native resolves retained elements by namespace/field pair; the bare enum name is
      // dropped without an error (SDC-33483).
      elementsToRetain: elementsToRetain.map((e) => e.toJSON()).toList(),
    );
  }
}
