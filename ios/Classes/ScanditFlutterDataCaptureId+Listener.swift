/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import ScanditIdCapture
import scandit_flutter_datacapture_core

extension ScanditFlutterDataCaptureId: IdCaptureListener {
    public func idCapture(_ idCapture: IdCapture,
                          didCaptureIn session: IdCaptureSession,
                          frameData: FrameData) {
        ScanditFlutterDataCaptureCore.lastFrame = frameData
        guard let value = idCapturedLock.wait(afterDoing: {
            return send(.didCaptureId, body: ["session": session.jsonString])
        }, timeout: listenerCallbackTimeout) else { return }
        self.idCapture?.isEnabled = value
        ScanditFlutterDataCaptureCore.lastFrame = nil
    }

    public func idCapture(_ idCapture: IdCapture,
                          didLocalizeIn session: IdCaptureSession,
                          frameData: FrameData) {
        ScanditFlutterDataCaptureCore.lastFrame = frameData
        guard let value = didLocalizeIdLock.wait(afterDoing: {
            return send(.didLocalizeId, body: ["session": session.jsonString])
        }, timeout: listenerCallbackTimeout) else { return }
        self.idCapture?.isEnabled = value
        ScanditFlutterDataCaptureCore.lastFrame = nil
    }

    public func idCapture(_ idCapture: IdCapture,
                          didRejectIn session: IdCaptureSession,
                          frameData: FrameData) {
        ScanditFlutterDataCaptureCore.lastFrame = frameData
        guard let value = didRejectIdLock.wait(afterDoing: {
            return send(.didRejectId, body: ["session": session.jsonString])
        }, timeout: listenerCallbackTimeout) else { return }
        self.idCapture?.isEnabled = value
        ScanditFlutterDataCaptureCore.lastFrame = nil
    }
    
    public func idCapture(_ idCapture: IdCapture,
                          didTimeoutIn session: IdCaptureSession,
                          frameData: FrameData) {
        ScanditFlutterDataCaptureCore.lastFrame = frameData
        guard let value = didTimeoutLock.wait(afterDoing: {
            return send(.didTimeout, body: ["session": session.jsonString])
        }, timeout: listenerCallbackTimeout) else { return }
        self.idCapture?.isEnabled = value
        ScanditFlutterDataCaptureCore.lastFrame = nil
    }
}

extension ScanditFlutterDataCaptureId: FlutterStreamHandler {
    public func onListen(withArguments arguments: Any?,
                         eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}
