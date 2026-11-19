/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdLayoutStyle {
  rounded('rounded'),
  square('square');

  const IdLayoutStyle(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdLayoutStyleDeserializer on IdLayoutStyle {
  static IdLayoutStyle fromJSON(String jsonValue) {
    return IdLayoutStyle.values.firstWhere((element) => element.toString() == jsonValue);
  }
}

enum IdLayoutLineStyle {
  light('light'),
  bold('bold');

  const IdLayoutLineStyle(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdLayoutLineStyleDeserializer on IdLayoutLineStyle {
  static IdLayoutLineStyle fromJSON(String jsonValue) {
    return IdLayoutLineStyle.values.firstWhere((element) => element.toString() == jsonValue);
  }
}

enum TextHintPosition {
  aboveViewfinder('aboveViewfinder'),
  belowViewfinder('belowViewfinder');

  const TextHintPosition(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension TextHintPositionDeserializer on TextHintPosition {
  static TextHintPosition fromJSON(String jsonValue) {
    return TextHintPosition.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
