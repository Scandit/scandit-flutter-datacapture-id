/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

enum IdAnonymizationMode {
  none('none'),
  fieldsOnly('fieldsOnly'),
  imagesOnly('imagesOnly'),
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
