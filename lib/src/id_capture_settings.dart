/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'id_document_type.dart';
import 'id_image_type.dart';
import 'supported_sides.dart';
import 'id_anonymization_mode.dart';
import 'id_capture_defaults.dart';

class IdCaptureSettings implements Serializable {
  final Map<String, dynamic> _properties = {};
  final Map<IdImageType, dynamic> _imageToResult = {};
  final Set<IdDocumentType> _supportedDocuments = {};

  SupportedSides supportedSides = SupportedSides.frontOnly;

  Set<IdDocumentType> get supportedDocuments {
    return _supportedDocuments;
  }

  void setProperty<T>(String name, T value) {
    _properties[name] = value;
  }

  T getProperty<T>(String name) {
    return _properties[name] as T;
  }

  // ignore: avoid_positional_boolean_parameters
  void setShouldPassImageTypeToResult(IdImageType type, bool shouldPass) {
    _imageToResult[type] = shouldPass;
  }

  bool getShouldPassImageTypeToResult(IdImageType type) {
    return _imageToResult.containsKey(type) ? _imageToResult[type] : false;
  }

  IdAnonymizationMode anonymizationMode = IdCaptureDefaults.captureSettingsDefaults.anonymizationMode;

  @override
  Map<String, dynamic> toMap() {
    return {
      "supportedDocuments": supportedDocuments.map((e) => e.toString()).toList(),
      "imageToResult": _imageToResult.map((key, value) => MapEntry(key.toString(), value)),
      "supportedSides": supportedSides.toString(),
      "anonymizationMode": anonymizationMode.name,
    };
  }
}
