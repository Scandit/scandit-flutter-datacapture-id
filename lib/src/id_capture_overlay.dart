/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'id_capture.dart';
import 'id_capture_defaults.dart';
import 'id_layout.dart';

class IdCaptureOverlay extends DataCaptureOverlay {
  IdCapture _idCapture;
  IdLayout _idLayout = IdLayout.auto;

  @override
  DataCaptureView? view;

  IdCaptureOverlay._(this._idCapture, this.view) : super("idCapture") {
    view?.addOverlay(this);
  }

  IdCaptureOverlay.withIdCaptureForView(IdCapture idCapture, DataCaptureView? view) : this._(idCapture, view);

  IdCaptureOverlay.withIdCapture(IdCapture idCapture) : this.withIdCaptureForView(idCapture, null);

  IdLayoutStyle _idLayoutStyle = IdLayoutStyle.rounded;

  IdLayoutStyle get idLayoutStyle {
    return _idLayoutStyle;
  }

  set idLayoutStyle(IdLayoutStyle newValue) {
    _idLayoutStyle = newValue;
    _idCapture.didChange();
  }

  IdLayoutLineStyle _idLayoutLineStyle = IdLayoutLineStyle.light;

  IdLayoutLineStyle get idLayoutLineStyle {
    return _idLayoutLineStyle;
  }

  set idLayoutLineStyle(IdLayoutLineStyle newValue) {
    _idLayoutLineStyle = newValue;
    _idCapture.didChange();
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
    _idCapture.didChange();
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
    _idCapture.didChange();
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
    _idCapture.didChange();
  }

  void setIdLayout(IdLayout idLayout) {
    _idLayout = idLayout;
    _idCapture.didChange();
  }

  @override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json.addAll({
      "idLayout": _idLayout.jsonValue,
      "idLayoutStyle": _idLayoutStyle.jsonValue,
      "idLayoutLineStyle": _idLayoutLineStyle.jsonValue,
      "capturedBrush": capturedBrush.toMap(),
      "localizedBrush": localizedBrush.toMap(),
      "rejectedBrush": rejectedBrush.toMap()
    });
    return json;
  }
}
