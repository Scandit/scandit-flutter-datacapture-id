/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_id/src/id_capture_defaults.dart';

class IdCaptureFeedback implements Serializable {
  Feedback idCaptured = IdCaptureDefaults.idCaptureFeedbackDefaults.idCaptured;
  Feedback idRejected = IdCaptureDefaults.idCaptureFeedbackDefaults.idRejected;
  Feedback idCaptureTimeout = IdCaptureDefaults.idCaptureFeedbackDefaults.idCaptureTimeout;

  static IdCaptureFeedback get defaultFeedback => IdCaptureFeedback();

  @override
  Map<String, dynamic> toMap() {
    return {
      'idCaptured': idCaptured.toMap(),
      'idRejected': idRejected.toMap(),
      'idCaptureTimeout': idCaptureTimeout.toMap(),
    };
  }
}
