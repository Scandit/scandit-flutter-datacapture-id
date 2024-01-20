package com.scandit.datacapture.flutter.id

import com.scandit.datacapture.flutter.core.extensions.getMethodChannel
import com.scandit.datacapture.flutter.core.utils.FlutterEmitter
import com.scandit.datacapture.frameworks.id.IdCaptureModule
import com.scandit.datacapture.frameworks.id.listeners.FrameworksIdCaptureListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.lang.ref.WeakReference
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

/** ScanditFlutterDataCaptureIdProxyPlugin */
class ScanditFlutterDataCaptureIdProxyPlugin : FlutterPlugin, ActivityAware {
    companion object {
        @JvmStatic
        private val lock = ReentrantLock()

        @JvmStatic
        private var isPluginAttached = false
    }

    private var idCaptureModule: IdCaptureModule? = null

    private var idCaptureMethodChannel: MethodChannel? = null

    private var flutterPluginBinding: WeakReference<FlutterPluginBinding?> = WeakReference(null)

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        flutterPluginBinding = WeakReference(binding)
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        flutterPluginBinding = WeakReference(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        onAttached()
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetached()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttached()
    }

    override fun onDetachedFromActivity() {
        onDetached()
    }

    private fun onAttached() {
        lock.withLock {
            if (isPluginAttached) return

            val flutterBinding = flutterPluginBinding.get() ?: return

            setupModule(flutterBinding)

            isPluginAttached = true
        }
    }

    private fun onDetached() {
        lock.withLock {
            disposeModule()
            isPluginAttached = false
        }
    }

    private fun setupModule(binding: FlutterPluginBinding) {
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

    private fun disposeModule() {
        idCaptureModule?.onDestroy()
        idCaptureMethodChannel?.setMethodCallHandler(null)
    }
}
