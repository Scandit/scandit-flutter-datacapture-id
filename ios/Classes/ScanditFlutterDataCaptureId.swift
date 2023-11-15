/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Flutter
import Foundation
import scandit_flutter_datacapture_core
import ScanditIdCapture
import ScanditFrameworksCore

@objc
public protocol ScanditFlutterDataCaptureIdProtocol {
    func addListener(result: FlutterResult)
    func removeListener(result: FlutterResult)
    func finishDidCaptureId(enabled: Bool, result: FlutterResult)
    func reset(result: FlutterResult)
    func dispose()
}

@objc
public class ScanditFlutterDataCaptureId: NSObject, DeserializationLifeCycleObserver {
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

    private let methodChannel: FlutterMethodChannel
    private let eventChannel: FlutterEventChannel
    var eventSink: FlutterEventSink?
    var hasListeners = false
    var listenerCallbackTimeout = 2.0
    
    private var context: DataCaptureContext?
    var barcodeVerifier: AamvaBarcodeVerifier?

    private var idCaptureMode: IdCapture?
    var idCapture: IdCapture? {
        get {
            return idCaptureMode
        }
        set {
            idCaptureMode?.removeListener(self)
            idCaptureMode = newValue
            idCaptureMode?.addListener(self)
        }
    }

    var idCapturedLock = CallbackLock<Bool>(name: ScanditFlutterDataCaptureIdEvent.didCaptureId.rawValue)

    var didLocalizeIdLock = CallbackLock<Bool>(name: ScanditFlutterDataCaptureIdEvent.didLocalizeId.rawValue)

    var didRejectIdLock = CallbackLock<Bool>(name: ScanditFlutterDataCaptureIdEvent.didRejectId.rawValue)

    var didTimeoutLock = CallbackLock<Bool>(name: ScanditFlutterDataCaptureIdEvent.didTimeout.rawValue)

    @objc
    public init(with messenger: FlutterBinaryMessenger) {
        let prefix = "com.scandit.datacapture.id.capture"
        methodChannel = FlutterMethodChannel(name: "\(prefix)/method_channel",
                                             binaryMessenger: messenger)
        eventChannel = FlutterEventChannel(name: "\(prefix)/event_channel",
                                           binaryMessenger: messenger)
        super.init()
        registerDeserializer()
        methodChannel.setMethodCallHandler(handleMethodCall(_:result:))
        eventChannel.setStreamHandler(self)
        DeserializationLifeCycleDispatcher.shared.attach(observer: self)
    }

    @objc
    public func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case FunctionNames.getDefaults:
            defaults(result)
        case FunctionNames.addListener:
            addListener(result: result)
        case FunctionNames.removeListener:
            removeListener(result: result)
        case FunctionNames.finishDidCaptureId:
            finishDidCaptureId(enabled: call.arguments as? Bool ?? false, result: result)
        case FunctionNames.reset:
            reset(result: result)
        case FunctionNames.verify:
            verify(arguments: call.arguments, result: result)
        case FunctionNames.getLastFrameData:
            ScanditFlutterDataCaptureCore.getLastFrameData(reply: result)
        case FunctionNames.finishDidRejectId:
            finishDidRejectId(enabled: call.arguments as? Bool ?? false, result: result)
        case FunctionNames.finishDidLocalizeId:
            finishDidLocalizeId(enabled: call.arguments as? Bool ?? false, result: result)
        case FunctionNames.finishDidTimeout:
            finishDidTimeout(enabled: call.arguments as? Bool ?? false, result: result)
        case FunctionNames.createAamvaBarcodeVerifier:
            createAamvaBarcodeVerifier(result: result)
        case FunctionNames.verifyCapturedIdBarcode:
            verifyCapturedIdBarcode(arguments: call.arguments, result: result)
        case FunctionNames.vizMrzComparisonVerifier:
            vizMrzComparisonVerifier(arguments: call.arguments, result: result)
        case FunctionNames.addIdCaptureAsyncListener:
            addIdCaptureAsyncListener(result: result)
        case FunctionNames.removeIdCaptureAsyncListener:
            removeIdCaptureAsyncListener(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func defaults(_ result: FlutterResult) {
        do {
            let defaultsData = try JSONSerialization.data(withJSONObject: defaults, options: [])
            let jsonString = String(data: defaultsData, encoding: .utf8)
            result(jsonString)
        } catch {
            result(FlutterError(code: "-1", message: "Unable to load the defaults. \(error)", details: nil))
        }
    }

    public func addListener(result: FlutterResult) {
        hasListeners = true
        result(nil)
    }

    public func removeListener(result: FlutterResult) {
        hasListeners = false
        result(nil)
    }
    
    public func addIdCaptureAsyncListener(result: FlutterResult) {
        listenerCallbackTimeout = 10.0 * 60 // 10 minutes timeout
        result(nil)
    }

    public func removeIdCaptureAsyncListener(result: FlutterResult) {
        listenerCallbackTimeout = 2.0
        result(nil)
    }


    public func finishDidCaptureId(enabled: Bool?, result: FlutterResult) {
        idCapturedLock.unlock(value: enabled)
        result(nil)
    }

    public func finishDidRejectId(enabled: Bool?, result: FlutterResult) {
        didRejectIdLock.unlock(value: enabled)
        result(nil)
    }

    public func finishDidLocalizeId(enabled: Bool?, result: FlutterResult) {
        didLocalizeIdLock.unlock(value: enabled)
        result(nil)
    }

    public func finishDidTimeout(enabled: Bool?, result: FlutterResult) {
        didTimeoutLock.unlock(value: enabled)
        result(nil)
    }

    public func reset(result: FlutterResult) {
        idCapture?.reset()
        result(nil)
    }

    public func verify(arguments: Any?, result: FlutterResult) {
        guard let capturedIdJson = arguments as? String else {
            result(nil)
            return
        }

        let capturedId = CapturedId(jsonString: capturedIdJson)
        result(AAMVAVizBarcodeComparisonVerifier().verify(capturedId).jsonString)
    }

    func createAamvaBarcodeVerifier(result: FlutterResult) {
        guard let context = self.context else {
            return result(FlutterError(code: "-1", message: "Data Capture Context not available.", details: nil))
        }
        barcodeVerifier = AamvaBarcodeVerifier(context: context)
        result(nil)
    }

    func verifyCapturedIdBarcode(arguments: Any?, result: @escaping FlutterResult) {
        guard let capturedIdJson = arguments as? String else {
            result(nil)
            return
        }
        let capturedId = CapturedId(jsonString: capturedIdJson)
        barcodeVerifier?.verify(capturedId, completionHandler: { verificationResult, error in
            if error != nil {
                result(FlutterError(code: "-1", message: "Erorr verifying the captured id.", details: nil))
                return
            }
            result(verificationResult?.jsonString)
        })
    }
    
    public func vizMrzComparisonVerifier(arguments: Any?, result: FlutterResult) {
        guard let capturedIdJson = arguments as? String else {
            result(nil)
            return
        }

        let capturedId = CapturedId(jsonString: capturedIdJson)
        let jsonResult = VizMrzComparisonVerifier().verify(capturedId).jsonString
        result(jsonResult)
    }

    
    public func dataCaptureContext(deserialized context: DataCaptureContext?) {
        self.context = context
    }

    @objc
    public func dispose() {
        methodChannel.setMethodCallHandler(nil)
        eventChannel.setStreamHandler(nil)
        idCapturedLock.reset()
        DeserializationLifeCycleDispatcher.shared.detach(observer: self)
    }
}
