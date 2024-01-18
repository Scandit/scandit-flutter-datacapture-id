/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import Flutter
import scandit_flutter_datacapture_core
import ScanditFrameworksId
 
 class IdCaptureMethodHandler {
     private enum FunctionNames {
         static let getDefaults = "getDefaults"
         static let addListener = "addIdCaptureListener"
         static let removeListener = "removeIdCaptureListener"
         static let finishDidCaptureId = "finishDidCaptureId"
         static let reset = "reset"
         static let verify = "verify"
         static let getLastFrameData = "getLastFrameData"
         static let finishDidRejectId = "finishDidRejectId"
         static let finishDidLocalizeId = "finishDidLocalizeId"
         static let finishDidTimeout = "finishDidTimeout"
         static let createAamvaBarcodeVerifier = "createAamvaBarcodeVerifier"
         static let verifyCapturedIdBarcode = "verifyCapturedIdBarcode"
         static let vizMrzComparisonVerifier = "vizMrzComparisonVerifier"
         static let addIdCaptureAsyncListener = "addIdCaptureAsyncListener"
         static let removeIdCaptureAsyncListener = "removeIdCaptureAsyncListener"
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
             idModule.addListener()
             result(nil)
         case FunctionNames.removeListener:
             idModule.removeListener()
             result(nil)
         case FunctionNames.finishDidCaptureId:
             idModule.finishDidCaptureId(enabled: call.arguments as? Bool ?? false)
             result(nil)
         case FunctionNames.reset:
             idModule.resetMode()
             result(nil)
         case FunctionNames.verify:
             guard let jsonString = call.arguments as? String else {
                 result(FlutterError(code: "-2", message: "Invalid json passed", details: nil))
                 return
             }
             idModule.verifyCapturedIdAamvaViz(jsonString: jsonString,
                                               result: FlutterFrameworkResult(reply: result))
         case FunctionNames.getLastFrameData:
             ScanditFlutterDataCaptureCore.getLastFrameData(reply: result)
         case FunctionNames.finishDidRejectId:
             idModule.finishDidRejectId(enabled: call.arguments as? Bool ?? false)
         case FunctionNames.finishDidLocalizeId:
             idModule.finishDidLocalizeId(enabled: call.arguments as? Bool ?? false)
         case FunctionNames.finishDidTimeout:
             idModule.finishTimeout(enabled: call.arguments as? Bool ?? false)
         case FunctionNames.createAamvaBarcodeVerifier:
             idModule.createAamvaBarcodeVerifier(result: FlutterFrameworkResult(reply: result))
         case FunctionNames.verifyCapturedIdBarcode:
             guard let jsonString = call.arguments as? String else {
                 result(FlutterError(code: "-2", message: "Invalid json passed", details: nil))
                 return
             }
             idModule.verifyCapturedIdWithCloud(jsonString: jsonString,
                                                result: FlutterFrameworkResult(reply: result))
         case FunctionNames.vizMrzComparisonVerifier:
             guard let jsonString = call.arguments as? String else {
                 result(FlutterError(code: "-2", message: "Invalid json passed", details: nil))
                 return
             }
             idModule.verifyCaptureIdMrzViz(jsonString: jsonString,
                                            result: FlutterFrameworkResult(reply: result))
         case FunctionNames.addIdCaptureAsyncListener:
             idModule.addAsyncListener()
             result(nil)
         case FunctionNames.removeIdCaptureAsyncListener:
             idModule.removeAsyncListener()
             result(nil)
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
