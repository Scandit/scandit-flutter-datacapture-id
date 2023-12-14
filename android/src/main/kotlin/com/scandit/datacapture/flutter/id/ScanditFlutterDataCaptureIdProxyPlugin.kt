package com.scandit.datacapture.flutter.id

import com.scandit.datacapture.flutter.core.extensions.getMethodChannel
import com.scandit.datacapture.flutter.core.utils.FlutterEmitter
import com.scandit.datacapture.frameworks.id.IdCaptureModule
import com.scandit.datacapture.frameworks.id.listeners.FrameworksIdCaptureListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

/** ScanditFlutterDataCaptureIdProxyPlugin */
class ScanditFlutterDataCaptureIdProxyPlugin : FlutterPlugin {
    companion object {
        @JvmStatic
        private val lock = ReentrantLock()

        @JvmStatic
        private var isPluginAttached = false
    }

    private var idCaptureModule: IdCaptureModule? = null

    private var idCaptureMethodChannel: MethodChannel? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        lock.withLock {
            val eventEmitter = FlutterEmitter(
                EventChannel(
                    binding.binaryMessenger,
                    IdCaptureMethodHandler.EVENT_CHANNEL_NAME
                )
            )
            idCaptureModule = IdCaptureModule(
                FrameworksIdCaptureListener(eventEmitter)
            ).also { module ->
                module.onCreate(binding.applicationContext)

                idCaptureMethodChannel = binding.getMethodChannel(
                    IdCaptureMethodHandler.METHOD_CHANNEL_NAME
                ).also {
                    it.setMethodCallHandler(IdCaptureMethodHandler(module))
                }
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        lock.withLock {
            idCaptureModule?.onDestroy()
            idCaptureMethodChannel?.setMethodCallHandler(null)
            isPluginAttached = false
        }
    }
}
