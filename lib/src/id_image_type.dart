/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdImageType {
  face('face'),
  idFront('idFront'),
  idBack('idBack');

  const IdImageType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdImageTypeDeserializer on IdImageType {
  static IdImageType fromJSON(String jsonValue) {
    return IdImageType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
