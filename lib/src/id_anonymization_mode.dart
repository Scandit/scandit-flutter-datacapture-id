/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

/// This enum specifies what type of anonymization should be applied. Note: This only affects specific fields on certain documents.
///
/// Added in version 6.19.0
enum IdAnonymizationMode {
  /// No Anonymization, the result will contain all data.
  ///
  /// Added in version 6.19.0
  none('none'),
  /// Sensitive data is removed from result fields.
  ///
  /// Added in version 6.19.0
  fieldsOnly('fieldsOnly'),
  /// Black boxes cover sensitive data in result images. Note: Frame anonymization requires that relevant fields are successfully captured by the SDK. For Visual Inspection Zone (VIZ) data anonymization, IdImageType.CroppedDocument must be enabled.
  ///
  /// Added in version 6.19.0
  imagesOnly('imagesOnly'),
  /// A combination of ImagesOnly and FieldsOnly modes. Note: Frame anonymization requires that relevant fields are successfully captured by the SDK. For Visual Inspection Zone (VIZ) data anonymization, IdImageType.CroppedDocument must be enabled.
  ///
  /// Added in version 6.19.0
  fieldsAndImages('fieldsAndImages');

  const IdAnonymizationMode(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdAnonymizationModeDeserializer on IdAnonymizationMode {
  static IdAnonymizationMode fromJSON(String jsonValue) {
    return IdAnonymizationMode.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
