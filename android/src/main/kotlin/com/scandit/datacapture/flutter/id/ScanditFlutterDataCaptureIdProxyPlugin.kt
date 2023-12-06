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
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

/** ScanditFlutterDataCaptureIdProxyPlugin */
class ScanditFlutterDataCaptureIdProxyPlugin : FlutterPlugin, MethodCallHandler {
    companion object {
        @JvmStatic
        private val lock = ReentrantLock()

        @JvmStatic
        private var isPluginAttached = false
    }

    private var scanditFlutterDataCaptureIdCapturePlugin:
        ScanditFlutterDataCaptureIdCaptureHandler? = null

    override fun onAttachedToEngine(
        @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    ) {
        lock.withLock {
            if (isPluginAttached) return

            scanditFlutterDataCaptureIdCapturePlugin = ScanditFlutterDataCaptureIdCaptureHandler(
                provideScanditFlutterIdCaptureListener(
                    flutterPluginBinding.binaryMessenger
                )
            )
            scanditFlutterDataCaptureIdCapturePlugin?.onAttachedToEngine(flutterPluginBinding)

            isPluginAttached = true
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        result.notImplemented()
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        lock.withLock {
            scanditFlutterDataCaptureIdCapturePlugin?.onDetachedFromEngine(binding)
            scanditFlutterDataCaptureIdCapturePlugin = null
            isPluginAttached = false
        }
    }

    private fun provideScanditFlutterIdCaptureListener(
        binaryMessenger: BinaryMessenger
    ) =
        ScanditFlutterIdCaptureListener(
            EventHandler(
                EventChannel(
                    binaryMessenger,
                    ScanditFlutterIdCaptureListener.CHANNEL_NAME
                )
            )
        )
}
