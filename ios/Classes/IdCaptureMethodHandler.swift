/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import Flutter
import ScanditFrameworksCore
import ScanditFrameworksId
import scandit_flutter_datacapture_core

class IdCaptureMethodHandler {

    private let idModule: IdCaptureModule

    init(idModule: IdCaptureModule) {
        self.idModule = idModule
    }

    @objc
    func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let methodCall = FlutterFrameworksMethodCall(call)
        let frameworkResult = FlutterFrameworkResult(reply: result)

        let executionResult = idModule.execute(method: methodCall, result: frameworkResult)

        if !executionResult {
            result(FlutterMethodNotImplemented)
        }
    }

}
