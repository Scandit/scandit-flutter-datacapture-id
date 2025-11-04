/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import Flutter
import Foundation
import scandit_flutter_datacapture_core
import ScanditFrameworksCore
import ScanditFrameworksId

@objc
public class ScanditFlutterDataCaptureId: NSObject, FlutterPlugin {
    private let idModule: IdCaptureModule
    private let idModuleMethodChannel: FlutterMethodChannel

    init(idModule: IdCaptureModule, idModuleMethodChannel: FlutterMethodChannel) {
        self.idModule = idModule
        self.idModuleMethodChannel = idModuleMethodChannel
    }

    @objc
    public static func register(with registrar: FlutterPluginRegistrar) {
        let prefix = "com.scandit.datacapture.id.capture"
        let methodChannel = FlutterMethodChannel(name: "\(prefix)/method_channel",
                                                 binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: "\(prefix)/event_channel",
                                               binaryMessenger: registrar.messenger())
        let emitter = FlutterEventEmitter(eventChannel: eventChannel)
        let idModule = IdCaptureModule(emitter: emitter)
        let methodCallHandler = IdCaptureMethodHandler(idModule: idModule)
        idModule.didStart()

        let plugin = ScanditFlutterDataCaptureId(idModule: idModule, idModuleMethodChannel: methodChannel)
        methodChannel.setMethodCallHandler(methodCallHandler.handleMethodCall(_:result:))
        registrar.publish(plugin)
    }

    @objc
    public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
        idModule.didStop()
        idModuleMethodChannel.setMethodCallHandler(nil)
    }
}
