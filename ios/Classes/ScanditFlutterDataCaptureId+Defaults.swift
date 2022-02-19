/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Foundation
import ScanditIdCapture
import scandit_flutter_datacapture_core

extension ScanditFlutterDataCaptureId {
    var defaults: [String: Any] {
        return [
            "RecommendedCameraSettings": recommendedCameraSettings,
            "IdCaptureOverlay": overlayDefaults
        ]
    }

    private var recommendedCameraSettings: [String: Any] {
        return IdCapture.recommendedCameraSettings.defaults
    }

    private var overlayDefaults: [String: Any] {
        return [
            "DefaultCapturedBrush": IdCaptureOverlay.defaultCapturedBrush.defaults,
            "DefaultLocalizedBrush": IdCaptureOverlay.defaultLocalizedBrush.defaults,
            "DefaultRejectedBrush": IdCaptureOverlay.defaultRejectedBrush.defaults
        ]
    }
}
