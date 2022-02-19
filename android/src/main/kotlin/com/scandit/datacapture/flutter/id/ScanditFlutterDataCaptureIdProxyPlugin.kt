package com.scandit.datacapture.flutter.id

import androidx.annotation.NonNull
import com.scandit.datacapture.flutter.core.utils.EventHandler
import com.scandit.datacapture.flutter.id.listeners.ScanditFlutterIdCaptureListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ScanditFlutterDataCaptureIdProxyPlugin */
class ScanditFlutterDataCaptureIdProxyPlugin : FlutterPlugin, MethodCallHandler {
    private var scanditFlutterDataCaptureIdCapturePlugin:
        ScanditFlutterDataCaptureIdCaptureHandler? = null

    override fun onAttachedToEngine(
        @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    ) {
        scanditFlutterDataCaptureIdCapturePlugin = ScanditFlutterDataCaptureIdCaptureHandler(
            provideScanditFlutterIdCaptureListener(flutterPluginBinding.binaryMessenger)
        )
        scanditFlutterDataCaptureIdCapturePlugin?.onAttachedToEngine(flutterPluginBinding)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        result.notImplemented()
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        scanditFlutterDataCaptureIdCapturePlugin?.onDetachedFromEngine(binding)
        scanditFlutterDataCaptureIdCapturePlugin = null
    }

    private fun provideScanditFlutterIdCaptureListener(binaryMessenger: BinaryMessenger) =
        ScanditFlutterIdCaptureListener(
            EventHandler(
                EventChannel(
                    binaryMessenger,
                    ScanditFlutterIdCaptureListener.CHANNEL_NAME
                )
            )
        )
}
