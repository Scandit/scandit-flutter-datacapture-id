/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/mobile_document_data_element.dart';

class MobileDocumentScanner implements Serializable {
  final bool _iso180135;
  final bool _ocr;
  final Set<MobileDocumentDataElement> _elementsToRetain;

  MobileDocumentScanner({required bool iso180135, required bool ocr, Set<MobileDocumentDataElement>? elementsToRetain})
      : _iso180135 = iso180135,
        _ocr = ocr,
        _elementsToRetain = elementsToRetain ?? {};

  bool get iso180135 => _iso180135;
  bool get ocr => _ocr;
  Set<MobileDocumentDataElement> get elementsToRetain => _elementsToRetain;

  @override
  Map<String, dynamic> toMap() {
    return {
      'iso180135': iso180135,
      'ocr': ocr,
      'elementsToRetain': elementsToRetain.map((e) => e.toString()).toList(),
    };
  }
}
