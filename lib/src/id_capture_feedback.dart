/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/id_capture_defaults.dart';

class IdCaptureFeedback extends ChangeNotifier implements Serializable {
  IdCaptureFeedback();

  Feedback _idCaptured = IdCaptureDefaults.idCaptureFeedbackDefaults.idCaptured;

  Feedback get idCaptured => _idCaptured;

  set idCaptured(Feedback newValue) {
    _idCaptured = newValue;
    notifyListeners();
  }

  Feedback _idRejected = IdCaptureDefaults.idCaptureFeedbackDefaults.idRejected;

  Feedback get idRejected => _idRejected;

  set idRejected(Feedback newValue) {
    _idRejected = newValue;
    notifyListeners();
  }

  static IdCaptureFeedback get defaultFeedback => IdCaptureFeedback();

  static Sound get defaultSuccessSound => IdCaptureDefaults.idCaptureFeedbackDefaults.defaultSuccessSound;
  static Sound get defaultFailureSound => IdCaptureDefaults.idCaptureFeedbackDefaults.defaultFailureSound;

  @override
  Map<String, dynamic> toMap() {
    return {
      'idCaptured': idCaptured.toMap(),
      'idRejected': idRejected.toMap(),
    };
  }
}
