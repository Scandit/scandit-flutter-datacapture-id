/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

/// The layout style of the [IdCaptureOverlay].
///
/// Added in version 6.11.0
enum IdLayoutStyle {
  /// Layout style with rounded corners.
  ///
  /// Added in version 6.11.0
  rounded('rounded'),
  /// Layout style with square corners.
  ///
  /// Added in version 6.11.0
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

/// The style of the lines drawn as part of the IdLayout.
///
/// Added in version 6.11.0
enum IdLayoutLineStyle {
  /// Draws lines with a width of 3 dips/points.
  ///
  /// Added in version 6.11.0
  light('light'),
  /// Draws lines with a width of 5 dips/points.
  ///
  /// Added in version 6.11.0
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

/// Sets the position of the textual hints.
///
/// Added in version 6.22.0
enum TextHintPosition {
  /// Places the text hint above viewfinder.
  ///
  /// Added in version 6.22.0
  aboveViewfinder('aboveViewfinder'),
  /// Places the text hint below viewfinder.
  ///
  /// Added in version 6.22.0
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
