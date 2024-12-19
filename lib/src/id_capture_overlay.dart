/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'function_names.dart';
import 'id_capture.dart';
import 'id_capture_defaults.dart';
import 'id_layout.dart';

class IdCaptureOverlay extends DataCaptureOverlay {
  // ignore: unused_field
  final IdCapture _idCapture;
  late _IdCaptureOverlayController _controller;

  String? _frontSideTextHint;
  String? _backSideTextHint;
  bool _showTextHints = true;

  TextHintPosition _textHintPosition = TextHintPosition.aboveViewfinder;

  @override
  DataCaptureView? view;

  IdCaptureOverlay._(this._idCapture, this.view) : super('idCapture') {
    view?.addOverlay(this);
    _controller = _IdCaptureOverlayController(this);
  }

  IdCaptureOverlay.withIdCaptureForView(IdCapture idCapture, DataCaptureView? view) : this._(idCapture, view);

  IdCaptureOverlay.withIdCapture(IdCapture idCapture) : this.withIdCaptureForView(idCapture, null);

  IdLayoutStyle _idLayoutStyle = IdLayoutStyle.rounded;

  IdLayoutStyle get idLayoutStyle {
    return _idLayoutStyle;
  }

  set idLayoutStyle(IdLayoutStyle newValue) {
    _idLayoutStyle = newValue;
    _controller.update();
  }

  IdLayoutLineStyle _idLayoutLineStyle = IdLayoutLineStyle.light;

  IdLayoutLineStyle get idLayoutLineStyle {
    return _idLayoutLineStyle;
  }

  set idLayoutLineStyle(IdLayoutLineStyle newValue) {
    _idLayoutLineStyle = newValue;
    _controller.update();
  }

  static Brush get defaultCapturedBrush {
    return IdCaptureDefaults.idCaptureOverlayDefaults.defaultCapturedBrush;
  }

  Brush _capturedBrush = defaultCapturedBrush;

  Brush get capturedBrush {
    return _capturedBrush;
  }

  set capturedBrush(Brush newValue) {
    _capturedBrush = newValue;
    _controller.update();
  }

  static Brush get defaultLocalizedBrush {
    return IdCaptureDefaults.idCaptureOverlayDefaults.defaultLocalizedBrush;
  }

  Brush _localizedBrush = defaultLocalizedBrush;

  Brush get localizedBrush {
    return _localizedBrush;
  }

  set localizedBrush(Brush newValue) {
    _localizedBrush = newValue;
    _controller.update();
  }

  static Brush get defaultRejectedBrush {
    return IdCaptureDefaults.idCaptureOverlayDefaults.defaultRejectedBrush;
  }

  Brush _rejectedBrush = defaultLocalizedBrush;

  Brush get rejectedBrush {
    return _rejectedBrush;
  }

  set rejectedBrush(Brush newValue) {
    _rejectedBrush = newValue;
    _controller.update();
  }

  Future<void> setFrontSideTextHint(String text) {
    _frontSideTextHint = text;
    return _controller.update();
  }

  Future<void> setBackSideTextHint(String text) {
    _frontSideTextHint = text;
    return _controller.update();
  }

  TextHintPosition get textHintPosition {
    return _textHintPosition;
  }

  set textHintPosition(TextHintPosition newValue) {
    _textHintPosition = newValue;
    _controller.update();
  }

  bool get showTextHints {
    return _showTextHints;
  }

  set showTextHints(bool newValue) {
    _showTextHints = newValue;
    _controller.update();
  }

  @override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json.addAll({
      'idLayoutStyle': _idLayoutStyle.toString(),
      'idLayoutLineStyle': _idLayoutLineStyle.toString(),
      'capturedBrush': capturedBrush.toMap(),
      'localizedBrush': localizedBrush.toMap(),
      'rejectedBrush': rejectedBrush.toMap(),
      'textHintPosition': _textHintPosition.toString(),
      'showTextHints': _showTextHints,
    });

    if (_frontSideTextHint != null) {
      json['frontSideTextHint'] = _frontSideTextHint;
    }
    if (_backSideTextHint != null) {
      json['backSideTextHint'] = _backSideTextHint;
    }
    return json;
  }
}

class _IdCaptureOverlayController {
  late final MethodChannel _methodChannel = _getChannel();

  final IdCaptureOverlay _overlay;

  _IdCaptureOverlayController(this._overlay);

  Future<void> update() {
    return _methodChannel.invokeMethod(IdCaptureFunctionNames.updateIdCaptureOverlay, jsonEncode(_overlay.toMap()));
  }

  MethodChannel _getChannel() {
    return const MethodChannel(IdCaptureFunctionNames.methodsChannelName);
  }
}
