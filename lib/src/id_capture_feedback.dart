/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/id_capture_defaults.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/generated/schema_types.dart' show buildIdCaptureFeedback;

/// Determines what feedback (vibration, sound) should be emitted during the ID Capture process.
///
/// The feedback is specified for each [IdCapture] instance separately and can be changed through the [IdCapture.feedback] property by either modifying an existing instance of this class, or by assigning a new one.
///
/// Added in version 6.22.0
class IdCaptureFeedback extends ChangeNotifier implements Serializable {
  /// Empty constructor. Constructs a new feedback that will not emit any sound, nor vibration.
  ///
  /// Added in version 8.0.0
  IdCaptureFeedback();

  Feedback _idCaptured = IdCaptureDefaults.idCaptureFeedbackDefaults.idCaptured;

  /// A [Feedback] that is emitted when IdCaptureListener.didCaptureId() event is triggered.
  ///
  /// Added in version 6.22.0
  Feedback get idCaptured => _idCaptured;

  /// A [Feedback] that is emitted when IdCaptureListener.didCaptureId() event is triggered.
  ///
  /// Added in version 6.22.0
  set idCaptured(Feedback newValue) {
    _idCaptured = newValue;
    notifyListeners();
  }

  Feedback _idRejected = IdCaptureDefaults.idCaptureFeedbackDefaults.idRejected;

  /// A [Feedback] that is emitted when IdCaptureListener.didRejectId() event is triggered.
  ///
  /// Added in version 6.22.0
  Feedback get idRejected => _idRejected;

  /// A [Feedback] that is emitted when IdCaptureListener.didRejectId() event is triggered.
  ///
  /// Added in version 6.22.0
  set idRejected(Feedback newValue) {
    _idRejected = newValue;
    notifyListeners();
  }

  /// Returns an id capture feedback with default configuration:
  ///
  /// - default beep sound is loaded,
  /// - beeping for the id captured event is enabled,
  /// - vibration for the id captured event is enabled,
  /// - beeping for the id rejected event is disabled,
  /// - vibration for the id rejected event is disabled,
  /// - beeping for the id capture timeout event is disabled,
  /// - vibration for the id capture timeout event is disabled.
  ///
  /// Added in version 6.22.0
  static IdCaptureFeedback get defaultFeedback => IdCaptureFeedback();

  /// Returns the default success sound
  ///
  /// Added in version 8.0.0
  static Sound get defaultSuccessSound => IdCaptureDefaults.idCaptureFeedbackDefaults.defaultSuccessSound;
  /// Returns the default failure sound
  ///
  /// Added in version 8.0.0
  static Sound get defaultFailureSound => IdCaptureDefaults.idCaptureFeedbackDefaults.defaultFailureSound;

  @override
  Map<String, dynamic> toMap() {
    return buildIdCaptureFeedback(
      idCaptured: idCaptured.toMap(),
      idRejected: idRejected.toMap(),
    );
  }
}
