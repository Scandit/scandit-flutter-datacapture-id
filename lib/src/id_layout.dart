/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdLayout { td1, td2, td3, mrvA, viz, pdf417, auto, none }

extension IdLayoutDeserializer on IdLayout {
  static IdLayout fromJSON(String jsonValue) {
    return IdLayout.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}

enum IdLayoutStyle { rounded, square }

extension IdLayoutStyleDeserializer on IdLayoutStyle {
  static IdLayoutStyle fromJSON(String jsonValue) {
    return IdLayoutStyle.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}

enum IdLayoutLineStyle { light, bold }

extension IdLayoutLineStyleDeserializer on IdLayoutLineStyle {
  static IdLayoutLineStyle fromJSON(String jsonValue) {
    return IdLayoutLineStyle.values.firstWhere((element) => element.jsonValue == jsonValue);
  }

  String get jsonValue => _jsonValue();

  String _jsonValue() {
    return toString().split('.').last;
  }
}
