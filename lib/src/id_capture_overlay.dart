/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/base_controller.dart';
import 'package:scandit_flutter_datacapture_id/src/id_capture.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/generated/id_method_handler.dart';

import 'internal/function_names.dart';
import 'internal/id_capture_defaults.dart';
import 'id_layout.dart';

/// Overlay that guides the user through the [IdCapture] process.
///
/// In order to display this overlay, add it to data capture view ([DataCaptureView]).
///
/// This overlay shows a viewfinder, automatically selected based on IdCaptureSettings.AcceptedDocuments and IdCaptureSettings.Scanner, along with animations and textual hints, that allow the user to capture smoothly and avoid common pitfalls. It is designed to work out-of-the-box for a wide range of use-cases.
///
/// You can tweak the look of the viewfinder by setting [IdCaptureOverlay.idLayoutStyle] and [IdCaptureOverlay.idLayoutLineStyle]. Additionally you can configure the brush used to highlight localized, captured, or rejected documents.
///
/// You can translate the texts used by the viewfinder into various languages by adding adding string resources with the following ids to your app:
///
/// | Resource id | Comment |
/// | --- | --- |
/// | scandit_id_capture_camera_too_far | Document cannot be captured, because the camera is too far. |
/// | scandit_id_capture_document_partially_visible | Document cannot be captured, because it’s only partially visible - either covered or not fully fitting the frame of the camera. |
/// | scandit_id_capture_tap_shutter_to_scan | Ask the user to tap the shutter button to let [IdCapture] start capturing a document |
/// | scandit_id_capture_looking_for_document | Tell the user that [IdCapture] is looking for a document to capture |
/// | scandit_id_capture_hold_still | Ask the user to hold still the device so that the document can be captured |
/// | scandit_id_capture_show_document | Ask the user to show a document, front of card capture scenario or multiple document types selected. |
/// | scandit_id_capture_show_passport | Ask the user to show the passport. |
/// | scandit_id_capture_show_front_of_document | Ask the user to show the front side of a document in the front & back capture scenario. |
/// | scandit_id_capture_show_back_of_document | Ask the user to show the back side of a document in the front & back capture scenario. |
/// | scandit_id_capture_show_barcode_on_document | Ask the user to show the barcode on a document, either when a barcode type is selected or the back side of a document in the front & back capture scenario contains only a barcode. |
/// | scandit_id_capture_show_visa | Ask the user to show the visa. |
///
/// Added in version 6.11.0
class IdCaptureOverlay extends DataCaptureOverlay {
  DataCaptureView? _view;
  _IdCaptureOverlayController? _controller;
  final IdCapture _mode;

  String? _frontSideTextHint;
  String? _backSideTextHint;
  bool _showTextHints = true;

  TextHintPosition _textHintPosition = TextHintPosition.aboveViewfinder;

  /// The view this data capture overlay is attached to. When the data capture overlay is currently not attached to a view, *null* is returned.
  ///
  /// Added in version 6.11.0
  @override
  DataCaptureView? get view => _view;

  /// The view this data capture overlay is attached to. When the data capture overlay is currently not attached to a view, *null* is returned.
  ///
  /// Added in version 6.11.0
  @override
  set view(DataCaptureView? newValue) {
    if (newValue == null) {
      _view = null;
      _controller = null;
      return;
    }

    _view = newValue;
    _controller ??= _IdCaptureOverlayController(this);
  }

  IdCaptureOverlay._(this._mode) : super('idCapture');

  /// Constructs a new IdCaptureOverlay. For the overlay to be displayed on screen, it must be added to a [DataCaptureView].
  ///
  /// Added in version 7.6.0
  IdCaptureOverlay(IdCapture mode) : this._(mode);

  IdLayoutStyle _idLayoutStyle = defaultIdLayoutStyle;

  /// Returns the default value for the ID layout style of the overlay.
  ///
  /// Added in version 8.0.0
  static IdLayoutStyle get defaultIdLayoutStyle {
    return IdCaptureDefaults.idCaptureOverlayDefaults.idLayoutStyle;
  }

  /// The ID layout style of the overlay. By default this is [IdLayoutStyle.rounded].
  ///
  /// Added in version 6.11.0
  IdLayoutStyle get idLayoutStyle {
    return _idLayoutStyle;
  }

  /// The ID layout style of the overlay. By default this is [IdLayoutStyle.rounded].
  ///
  /// Added in version 6.11.0
  set idLayoutStyle(IdLayoutStyle newValue) {
    _idLayoutStyle = newValue;
    _controller?.update();
  }

  IdLayoutLineStyle _idLayoutLineStyle = defaultIdLayoutLineStyle;

  /// Returns the default value for the ID layout line style of the overlay.
  ///
  /// Added in version 8.0.0
  static IdLayoutLineStyle get defaultIdLayoutLineStyle {
    return IdCaptureDefaults.idCaptureOverlayDefaults.idLayoutLineStyle;
  }

  /// The ID layout line style. By default this is [IdLayoutLineStyle.light].
  ///
  /// Added in version 6.11.0
  IdLayoutLineStyle get idLayoutLineStyle {
    return _idLayoutLineStyle;
  }

  /// The ID layout line style. By default this is [IdLayoutLineStyle.light].
  ///
  /// Added in version 6.11.0
  set idLayoutLineStyle(IdLayoutLineStyle newValue) {
    _idLayoutLineStyle = newValue;
    _controller?.update();
  }

  /// The default brush used to draw rectangular highlights around captured personal identification documents or their parts such as barcodes or Machine Readable Zones (MRZs). By default, the stroke of a highlight is 3dp white and the fill is transparent.
  ///
  /// Added in version 6.11.0
  static Brush get defaultCapturedBrush {
    return IdCaptureDefaults.idCaptureOverlayDefaults.defaultCapturedBrush;
  }

  Brush _capturedBrush = defaultCapturedBrush;

  /// The brush used to draw rectangular highlights around captured personal identification documents or their parts such as barcodes or Machine Readable Zones (MRZs). By default it equals DefaultCapturedBrush.
  ///
  /// To disable highlights use [Brush.transparent].
  ///
  /// Added in version 6.11.0
  Brush get capturedBrush {
    return _capturedBrush;
  }

  /// The brush used to draw rectangular highlights around captured personal identification documents or their parts such as barcodes or Machine Readable Zones (MRZs). By default it equals DefaultCapturedBrush.
  ///
  /// To disable highlights use [Brush.transparent].
  ///
  /// Added in version 6.11.0
  set capturedBrush(Brush newValue) {
    _capturedBrush = newValue;
    _controller?.update();
  }

  /// The default brush used to draw rectangular highlights around localized personal identification documents or their parts such as barcodes or Machine Readable Zones (MRZs). A document or its part is considered localized when it’s detected in a frame, but its data is not yet extracted. By default, the fill of the highlight is white (alpha 50%) and the border is transparent.
  ///
  /// Added in version 6.11.0
  static Brush get defaultLocalizedBrush {
    return IdCaptureDefaults.idCaptureOverlayDefaults.defaultLocalizedBrush;
  }

  Brush _localizedBrush = defaultLocalizedBrush;

  /// The brush used to draw rectangular highlights around localized personal identification documents or their parts such as barcodes or Machine Readable Zones (MRZs). A document or its part is considered localized when it’s detected in a frame, but its data is not yet extracted. By default it equals DefaultLocalizedBrush.
  ///
  /// To disable highlights use [Brush.transparent].
  ///
  /// Added in version 6.11.0
  Brush get localizedBrush {
    return _localizedBrush;
  }

  /// The brush used to draw rectangular highlights around localized personal identification documents or their parts such as barcodes or Machine Readable Zones (MRZs). A document or its part is considered localized when it’s detected in a frame, but its data is not yet extracted. By default it equals DefaultLocalizedBrush.
  ///
  /// To disable highlights use [Brush.transparent].
  ///
  /// Added in version 6.11.0
  set localizedBrush(Brush newValue) {
    _localizedBrush = newValue;
    _controller?.update();
  }

  /// The default brush used to draw rectangular highlights around personal identification documents or their parts (such as barcodes), which were detected in a frame, but rejected. For example, data encoded in a barcode may have an unsupported format. By default, the fill of the highlight is white (alpha 50%) and the border is transparent.
  ///
  /// Added in version 6.11.0
  static Brush get defaultRejectedBrush {
    return IdCaptureDefaults.idCaptureOverlayDefaults.defaultRejectedBrush;
  }

  Brush _rejectedBrush = defaultRejectedBrush;

  /// The brush used to draw rectangular highlights around personal identification documents or their parts (such as barcodes), which were detected in a frame but rejected. For example, data encoded in a barcode may have an unsupported format. By default it equals DefaultRejectedBrush.
  ///
  /// To disable highlights use [Brush.transparent].
  ///
  /// Added in version 6.11.0
  Brush get rejectedBrush {
    return _rejectedBrush;
  }

  /// The brush used to draw rectangular highlights around personal identification documents or their parts (such as barcodes), which were detected in a frame but rejected. For example, data encoded in a barcode may have an unsupported format. By default it equals DefaultRejectedBrush.
  ///
  /// To disable highlights use [Brush.transparent].
  ///
  /// Added in version 6.11.0
  set rejectedBrush(Brush newValue) {
    _rejectedBrush = newValue;
    _controller?.update();
  }

  /// Sets text for textual hint displayed when scanning the front of document.
  ///
  /// Added in version 6.22.0
  Future<void> setFrontSideTextHint(String text) {
    _frontSideTextHint = text;
    return _controller?.update() ?? Future.value();
  }

  /// Sets text for textual hint displayed when scanning the back of document.
  ///
  /// Added in version 6.22.0
  Future<void> setBackSideTextHint(String text) {
    _backSideTextHint = text;
    return _controller?.update() ?? Future.value();
  }

  /// The text hint position of the overlay. By default this is [TextHintPosition.aboveViewfinder].
  ///
  /// Added in version 6.22.0
  TextHintPosition get textHintPosition {
    return _textHintPosition;
  }

  /// The text hint position of the overlay. By default this is [TextHintPosition.aboveViewfinder].
  ///
  /// Added in version 6.22.0
  set textHintPosition(TextHintPosition newValue) {
    _textHintPosition = newValue;
    _controller?.update();
  }

  /// Indicates whether text hints are shown or not. True by default.
  ///
  /// Added in version 6.22.0
  bool get showTextHints {
    return _showTextHints;
  }

  /// Indicates whether text hints are shown or not. True by default.
  ///
  /// Added in version 6.22.0
  set showTextHints(bool newValue) {
    _showTextHints = newValue;
    _controller?.update();
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
    json['modeId'] = _mode.toMap()['modeId'];
    return json;
  }
}

class _IdCaptureOverlayController extends BaseController {
  final IdCaptureOverlay _overlay;
  late final IdMethodHandler idMethodHandler;

  _IdCaptureOverlayController(this._overlay) : super(IdCaptureFunctionNames.methodsChannelName) {
    idMethodHandler = IdMethodHandler(methodChannel);
  }

  Future<void> update() {
    return idMethodHandler.updateIdCaptureOverlay(overlayJson: jsonEncode(_overlay.toMap())).onError(onError);
  }
}
