/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/mobile_document_scanner.dart';
import 'package:scandit_flutter_datacapture_id/src/physical_document_scanner.dart';

/// Configures the scanner for capturing identity documents. This data class allows configuring both physical document scanning (ID cards, passports, driver’s licenses) and mobile document scanning (ISO 18013-5 mDL).
///
/// Added in version 8.0.0
class IdCaptureScanner implements Serializable {
  final PhysicalDocumentScanner? _physicalDocumentScanner;
  final MobileDocumentScanner? _mobileDocumentScanner;
  final Map<String, dynamic> _properties = {};

  /// Creates a new IdCaptureScanner instance.
  ///
  /// Param PhysicalDocumentScanner? physicalDocumentConfiguration for scanning physical documents. See [PhysicalDocumentScanner] for options.Param MobileDocumentScanner? mobileDocumentConfiguration for scanning mobile documents. See [MobileDocumentScanner] for options.
  ///
  /// Added in version 8.0.0
  IdCaptureScanner({PhysicalDocumentScanner? physicalDocumentScanner, MobileDocumentScanner? mobileDocumentScanner})
      : _physicalDocumentScanner = physicalDocumentScanner,
        _mobileDocumentScanner = mobileDocumentScanner;

  /// Configuration for scanning physical documents (cards and booklets). Can be null if only mobile documents are to be scanned.
  ///
  /// Added in version 8.0.0
  PhysicalDocumentScanner? get physicalDocument => _physicalDocumentScanner;
  /// Configuration for scanning mobile documents. Can be null if only physical documents are to be scanned.
  ///
  /// Added in version 8.0.0
  MobileDocumentScanner? get mobileDocument => _mobileDocumentScanner;

  /// Sets a property to the provided value. Use this method to set properties that are not yet part of a stable API. Properties set through this method may change in a future release.
  ///
  /// Added in version 8.7.0
  void setProperty<T>(String name, T value) {
    _properties[name] = value;
  }

  /// Retrieves the value of a previously set property. In case the property does not exist, *null* is returned when `T` is nullable, otherwise a `TypeError` is thrown.
  ///
  /// Added in version 8.7.0
  T getProperty<T>(String name) {
    return _properties[name] as T;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'physicalDocument': _physicalDocumentScanner?.toMap(),
      'mobileDocument': _mobileDocumentScanner?.toMap(),
      ..._properties,
    };
  }
}
