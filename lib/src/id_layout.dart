/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

enum IdLayout {
  td1('td1'),
  td2('td2'),
  td3('td3'),
  mrvA('mrvA'),
  viz('viz'),
  pdf417('pdf417'),
  auto('auto'),
  none('none');

  const IdLayout(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdLayoutDeserializer on IdLayout {
  static IdLayout fromJSON(String jsonValue) {
    return IdLayout.values.firstWhere((element) => element.toString() == jsonValue);
  }
}

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
