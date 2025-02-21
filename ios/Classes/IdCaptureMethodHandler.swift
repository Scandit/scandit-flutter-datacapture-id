/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import Flutter
import scandit_flutter_datacapture_core
import ScanditFrameworksId
import ScanditFrameworksCore

 class IdCaptureMethodHandler {
     private enum FunctionNames {
         static let getDefaults = "getDefaults"
         static let addListener = "addIdCaptureListener"
         static let removeListener = "removeIdCaptureListener"
         static let finishDidCaptureId = "finishDidCaptureId"
         static let reset = "reset"
         static let getLastFrameData = "getLastFrameData"
         static let finishDidRejectId = "finishDidRejectId"
         static let createAamvaBarcodeVerifier = "createAamvaBarcodeVerifier"
         static let verifyCapturedIdBarcode = "verifyCapturedIdBarcode"
         static let setModeEnabledState = "setModeEnabledState"
         static let updateIdCaptureMode = "updateIdCaptureMode"
         static let applyIdCaptureModeSettings = "applyIdCaptureModeSettings"
         static let updateIdCaptureOverlay = "updateIdCaptureOverlay"
         static let updateFeedback = "updateFeedback"
     }

     private let idModule: IdCaptureModule

     init(idModule: IdCaptureModule) {
         self.idModule = idModule
     }

     @objc
     func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
         switch call.method {
         case FunctionNames.getDefaults:
             defaults(result)
         case FunctionNames.addListener:
             idModule.addAsyncListener()
             result(nil)
         case FunctionNames.removeListener:
             idModule.removeAsyncListener()
             result(nil)
         case FunctionNames.finishDidCaptureId:
             idModule.finishDidCaptureId(enabled: call.arguments as? Bool ?? false)
             result(nil)
         case FunctionNames.reset:
             idModule.resetMode()
             result(nil)
         case FunctionNames.getLastFrameData:
             result(nil)
         case FunctionNames.finishDidRejectId:
             idModule.finishDidRejectId(enabled: call.arguments as? Bool ?? false)
         case FunctionNames.createAamvaBarcodeVerifier:
             idModule.createAamvaBarcodeVerifier(result: FlutterFrameworkResult(reply: result))
         case FunctionNames.verifyCapturedIdBarcode:
             guard let jsonString = call.arguments as? String else {
                 result(FlutterError(code: "-2", message: "Invalid json passed", details: nil))
                 return
             }
             idModule.verifyCapturedIdWithCloud(jsonString: jsonString,
                                                result: FlutterFrameworkResult(reply: result))
         case FunctionNames.setModeEnabledState:
            idModule.setModeEnabled(enabled: call.arguments as! Bool)
            result(nil)
         case FunctionNames.updateIdCaptureMode:
             idModule.updateModeFromJson(modeJson: call.arguments as! String, result: FlutterFrameworkResult(reply: result))
         case FunctionNames.applyIdCaptureModeSettings:
             idModule.applyModeSettings(modeSettingsJson: call.arguments as! String, result: FlutterFrameworkResult(reply: result))
         case FunctionNames.updateIdCaptureOverlay:
             idModule.updateOverlay(overlayJson: call.arguments as! String, result: FlutterFrameworkResult(reply: result))
         case FunctionNames.updateFeedback:
             idModule.updateFeedback(feedbackJson: call.arguments as! String, result: FlutterFrameworkResult(reply: result))
         default:
             result(FlutterMethodNotImplemented)
         }
     }

     private func defaults(_ result: FlutterResult) {
         do {
             let defaultsData = try JSONSerialization.data(withJSONObject: idModule.defaults.toEncodable(),
                                                           options: [])
             let jsonString = String(data: defaultsData, encoding: .utf8)
             result(jsonString)
         } catch {
             result(FlutterError(code: "-1", message: "Unable to load the defaults. \(error)", details: nil))
         }
     }
 }
