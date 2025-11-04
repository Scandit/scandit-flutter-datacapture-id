/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/mobile_document_scanner.dart';
import 'package:scandit_flutter_datacapture_id/src/physical_document_scanner.dart';

class IdCaptureScanner implements Serializable {
  final PhysicalDocumentScanner? _physicalDocumentScanner;
  final MobileDocumentScanner? _mobileDocumentScanner;

  IdCaptureScanner({PhysicalDocumentScanner? physicalDocumentScanner, MobileDocumentScanner? mobileDocumentScanner})
      : _physicalDocumentScanner = physicalDocumentScanner,
        _mobileDocumentScanner = mobileDocumentScanner;

  PhysicalDocumentScanner? get physicalDocument => _physicalDocumentScanner;
  MobileDocumentScanner? get mobileDocument => _mobileDocumentScanner;

  @override
  Map<String, dynamic> toMap() {
    return {
      'physicalDocument': _physicalDocumentScanner?.toMap(),
      'mobileDocument': _mobileDocumentScanner?.toMap(),
    };
  }
}
