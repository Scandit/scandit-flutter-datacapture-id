/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Flutter
import Foundation
import scandit_flutter_datacapture_core
import ScanditIdCapture

@objc
public protocol ScanditFlutterDataCaptureIdProtocol {
    func addListener(result: FlutterResult)
    func removeListener(result: FlutterResult)
    func finishDidCaptureId(enabled: Bool, result: FlutterResult)
    func reset(result: FlutterResult)
    func dispose()
}

@objc
public class ScanditFlutterDataCaptureId: NSObject {
    private enum FunctionNames {
        static let getDefaults = "getDefaults"
        static let addListener = "addIdCaptureListener"
        static let removeListener = "removeIdCaptureListener"
        static let finishDidCaptureId = "finishDidCaptureId"
        static let reset = "reset"
    }

    private let defaultsMethodChannel: FlutterMethodChannel
    private let listenerMethodChannel: FlutterMethodChannel
    private let eventChannel: FlutterEventChannel
    var eventSink: FlutterEventSink?
    var hasListeners = false

    private var _idCapture: IdCapture?
    var idCapture: IdCapture? {
        get {
            return _idCapture
        }
        set {
            _idCapture?.removeListener(self)
            _idCapture = newValue
            _idCapture?.addListener(self)
        }
    }

    var idCapturedLock = CallbackLock<Bool>(name: ScanditFlutterDataCaptureIdEvent.didCaptureId.rawValue)

    @objc
    public init(with messenger: FlutterBinaryMessenger) {
        let prefix = "com.scandit.datacapture.id.capture"
        defaultsMethodChannel = FlutterMethodChannel(name: "\(prefix).method/id_capture_defaults",
                                                     binaryMessenger: messenger)
        listenerMethodChannel = FlutterMethodChannel(name: "\(prefix).method/id_capture_listener",
                                                     binaryMessenger: messenger)
        eventChannel = FlutterEventChannel(name: "\(prefix).event/id_capture_listener",
                                           binaryMessenger: messenger)
        super.init()
        registerDeserializer()
        defaultsMethodChannel.setMethodCallHandler(handleMethodCall(_:result:))
        listenerMethodChannel.setMethodCallHandler(handleMethodCall(_:result:))
        eventChannel.setStreamHandler(self)
    }

    @objc
    public func handleMethodCall(_ call: FlutterMethodCall, result: FlutterResult) {
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
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func defaults(_ result: FlutterResult) {
        let defaultsData = try! JSONSerialization.data(withJSONObject: defaults, options: [])
        let jsonString = String(data: defaultsData, encoding: .utf8)
        result(jsonString)
    }

    public func addListener(result: FlutterResult) {
        hasListeners = true
        result(nil)
    }

    public func removeListener(result: FlutterResult) {
        hasListeners = false
        result(nil)
    }

    public func finishDidCaptureId(enabled: Bool?, result: FlutterResult) {
        idCapturedLock.unlock(value: enabled)
        result(nil)
    }

    public func reset(result: FlutterResult) {
        idCapture?.reset()
        result(nil)
    }

    @objc
    public func dispose() {
        defaultsMethodChannel.setMethodCallHandler(nil)
        listenerMethodChannel.setMethodCallHandler(nil)
        eventChannel.setStreamHandler(nil)
        idCapturedLock.reset()
    }
}
