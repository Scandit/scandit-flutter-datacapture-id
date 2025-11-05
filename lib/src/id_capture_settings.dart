/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'id_capture_document.dart';
import 'id_capture_scanner.dart';
import 'id_image_type.dart';
import 'id_anonymization_mode.dart';
import 'id_capture_defaults.dart';

class IdCaptureSettings implements Serializable {
  final Map<String, dynamic> _properties = {};
  final Map<IdImageType, dynamic> _imageToResult = {};

  List<IdCaptureDocument> acceptedDocuments = [];

  List<IdCaptureDocument> rejectedDocuments = [];

  IdCaptureScanner scannerType = SingleSideScanner(false, false, false);

  void setProperty<T>(String name, T value) {
    _properties[name] = value;
  }

  T getProperty<T>(String name) {
    return _properties[name] as T;
  }

  void setShouldPassImageTypeToResult(IdImageType type, bool shouldPass) {
    _imageToResult[type] = shouldPass;
  }

  bool getShouldPassImageTypeToResult(IdImageType type) {
    return _imageToResult.containsKey(type) ? _imageToResult[type] : false;
  }

  IdAnonymizationMode anonymizationMode = IdCaptureDefaults.captureSettingsDefaults.anonymizationMode;

  bool rejectVoidedIds = IdCaptureDefaults.captureSettingsDefaults.rejectVoidedIds;

  bool decodeBackOfEuropeanDrivingLicense =
      IdCaptureDefaults.captureSettingsDefaults.decodeBackOfEuropeanDrivingLicense;

  @override
  Map<String, dynamic> toMap() {
    return {
      'imageToResult': _imageToResult.map((key, value) => MapEntry(key.toString(), value)),
      'anonymizationMode': anonymizationMode.name,
      'rejectVoidedIds': rejectVoidedIds,
      'decodeBackOfEuropeDrivingLicense': decodeBackOfEuropeanDrivingLicense,
      'scannerType': scannerType.toMap(),
      'acceptedDocuments': acceptedDocuments.map((doc) => doc.toMap()).toList(),
      'rejectedDocuments': rejectedDocuments.map((doc) => doc.toMap()).toList(),
    };
  }
}
