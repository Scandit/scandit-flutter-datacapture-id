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
        switch call.method {
        case "executeId":
            guard let args = call.params() else {
                result(FlutterError(code: "-1", message: "Missing arguments", details: nil))
                return
            }

            let coreModuleName = String(describing: CoreModule.self)
            guard let coreModule = DefaultServiceLocator.shared.resolve(clazzName: coreModuleName) as? CoreModule else {
                result(
                    FlutterError(
                        code: "-1",
                        message: "Unable to retrieve the CoreModule from the locator.",
                        details: nil
                    )
                )
                return
            }

            let flutterResult = FlutterFrameworkResult(reply: result)
            let handled = coreModule.execute(
                FlutterFrameworksMethodCall(call),
                result: flutterResult,
                module: self.idModule
            )

            if !handled {
                let methodName = call.stringValue(for: "methodName", from: args) ?? "unknown"
                result(FlutterError(code: "-1", message: "Unknown Core method: \(methodName)", details: nil))
            }
        case "getDefaults":
            do {
                let defaults = idModule.getDefaults()
                let defaultsJSONString = String(
                    data: try JSONSerialization.data(
                        withJSONObject: defaults,
                        options: []
                    ),
                    encoding: .utf8
                )
                result(defaultsJSONString)
            } catch {
                result(error)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

}
