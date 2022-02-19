/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import ScanditIdCapture
import scandit_flutter_datacapture_core

extension ScanditFlutterDataCaptureId {
    func registerDeserializer() {
        let idCaptureDeserializer = IdCaptureDeserializer()
        idCaptureDeserializer.delegate = self
        ScanditFlutterDataCaptureCore.register(modeDeserializer: idCaptureDeserializer)
    }
}

extension ScanditFlutterDataCaptureId: IdCaptureDeserializerDelegate {
    public func idCaptureDeserializer(_ deserializer: IdCaptureDeserializer,
                                      didStartDeserializingMode mode: IdCapture,
                                      from JSONValue: JSONValue) {}

    public func idCaptureDeserializer(_ deserializer: IdCaptureDeserializer,
                                      didFinishDeserializingMode mode: IdCapture,
                                      from JSONValue: JSONValue) {
        if JSONValue.containsKey("enabled") {
            mode.isEnabled = JSONValue.bool(forKey: "enabled")
        }
        idCapture = mode
    }

    public func idCaptureDeserializer(_ deserializer: IdCaptureDeserializer,
                                      didStartDeserializingSettings settings: IdCaptureSettings,
                                      from JSONValue: JSONValue) {}

    public func idCaptureDeserializer(_ deserializer: IdCaptureDeserializer, didFinishDeserializingSettings settings:
                                      IdCaptureSettings,
                                      from JSONValue: JSONValue) {}

    public func idCaptureDeserializer(_ deserializer: IdCaptureDeserializer,
                                      didStartDeserializingOverlay overlay: IdCaptureOverlay,
                                      from JSONValue: JSONValue) {}

    public func idCaptureDeserializer(_ deserializer: IdCaptureDeserializer,
                                      didFinishDeserializingOverlay overlay: IdCaptureOverlay,
                                      from JSONValue: JSONValue) {}
}
