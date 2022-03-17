/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import ScanditIdCapture

extension ScanditFlutterDataCaptureId: IdCaptureListener {
    public func idCapture(_ idCapture: IdCapture,
                          didCaptureIn session: IdCaptureSession,
                          frameData: FrameData) {        
        guard let value = idCapturedLock.wait(afterDoing: {
            return send(.didCaptureId, body: ["session": session.jsonString])
        }) else { return }
        self.idCapture?.isEnabled = value
    }

    public func idCapture(_ idCapture: IdCapture,
                          didLocalizeIn session: IdCaptureSession,
                          frameData: FrameData) {
        send(.didLocalizeId, body: ["session": session.jsonString])
    }

    public func idCapture(_ idCapture: IdCapture,
                          didFailWithError error: Error,
                          session: IdCaptureSession,
                          frameData: FrameData) {
        send(.errorDidHappen, body: ["session": session.jsonString])
    }

    public func idCapture(_ idCapture: IdCapture,
                          didRejectIn session: IdCaptureSession,
                          frameData: FrameData) {
        send(.didRejectId, body: ["session": session.jsonString])
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
