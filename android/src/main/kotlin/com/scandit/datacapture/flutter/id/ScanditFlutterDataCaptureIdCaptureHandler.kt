package com.scandit.datacapture.flutter.id

import com.scandit.datacapture.core.json.JsonValue
import com.scandit.datacapture.flutter.core.common.LastFrameDataHolder
import com.scandit.datacapture.flutter.core.deserializers.Deserializers
import com.scandit.datacapture.flutter.id.data.defaults.SerializableIdCaptureDefaults
import com.scandit.datacapture.flutter.id.listeners.ScanditFlutterIdCaptureListener
import com.scandit.datacapture.id.capture.IdCapture
import com.scandit.datacapture.id.capture.serialization.IdCaptureDeserializer
import com.scandit.datacapture.id.capture.serialization.IdCaptureDeserializerListener
import com.scandit.datacapture.id.data.CapturedId
import com.scandit.datacapture.id.verification.aamvavizbarcode.AamvaVizBarcodeComparisonResult
import com.scandit.datacapture.id.verification.aamvavizbarcode.AamvaVizBarcodeComparisonVerifier
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ScanditFlutterDataCaptureIdCaptureHandler(
    private val idCaptureListener: ScanditFlutterIdCaptureListener,
    private val idCaptureDeserializer: IdCaptureDeserializer = IdCaptureDeserializer()
) : FlutterPlugin,
    IdCaptureDeserializerListener,
    MethodChannel.MethodCallHandler {
    private var idCaptureListenerChannel: MethodChannel? = null
    private var idCaptureDefaultsChannel: MethodChannel? = null
    private var idCaptureAamvaVizBarcodeComparisonVerifierChannel: MethodChannel? = null

    private var idCapture: IdCapture? = null
        private set(value) {
            field?.removeListener(idCaptureListener)
            field = value?.also { it.addListener(idCaptureListener) }
        }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        idCaptureDeserializer.listener = this
        Deserializers.Factory.addModeDeserializer(idCaptureDeserializer)
        idCaptureListenerChannel = MethodChannel(
            binding.binaryMessenger,
            "com.scandit.datacapture.id.capture.method/id_capture_listener"
        ).also {
            it.setMethodCallHandler(this)
        }
        idCaptureDefaultsChannel = MethodChannel(
            binding.binaryMessenger,
            "com.scandit.datacapture.id.capture.method/id_capture_defaults"
        ).also {
            it.setMethodCallHandler(this)
        }
        idCaptureAamvaVizBarcodeComparisonVerifierChannel = MethodChannel(
            binding.binaryMessenger,
            "com.scandit.datacapture.id.capture.method/aamva_viz_barcode_comparison_verifier"
        ).also {
            it.setMethodCallHandler(this)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Deserializers.Factory.removeModeDeserializer(idCaptureDeserializer)
        idCaptureListenerChannel?.setMethodCallHandler(null)
        idCaptureDefaultsChannel?.setMethodCallHandler(null)
        idCaptureAamvaVizBarcodeComparisonVerifierChannel?.setMethodCallHandler(null)
        idCaptureDeserializer.listener = null
        idCapture = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "addIdCaptureListener" -> {
                idCaptureListener.enableListener()
                result.success(null)
            }
            "removeIdCaptureListener" -> {
                idCaptureListener.disableListener()
                result.success(null)
            }
            "finishDidCaptureId" -> {
                idCaptureListener.finishDidCaptureId(call.arguments as Boolean)
                result.success(null)
            }
            "finishDidRejectId" -> {
                idCaptureListener.finishDidRejectId(call.arguments as Boolean)
                result.success(null)
            }
            "finishDidLocalizeId" -> {
                idCaptureListener.finishDidLocalizeId(call.arguments as Boolean)
                result.success(null)
            }
            "finishDidFail" -> {
                idCaptureListener.finishDidFail(call.arguments as Boolean)
                result.success(null)
            }
            "getDefaults" ->
                result.success(SerializableIdCaptureDefaults.createDefaults())
            "reset" -> {
                idCapture?.reset()
                result.success(null)
            }
            "verify" -> {
                val verificationResult = verify(call.arguments as String)
                result.success(verificationResult.toJson())
            }
            "getLastFrameData" -> LastFrameDataHolder.handleGetRequest(result)
        }
    }

    private fun verify(capturedIdJson: String): AamvaVizBarcodeComparisonResult {
        val capturedId = CapturedId.fromJson(capturedIdJson)
        return AamvaVizBarcodeComparisonVerifier.create().verify(capturedId)
    }

    override fun onModeDeserializationFinished(
        deserializer: IdCaptureDeserializer,
        mode: IdCapture,
        json: JsonValue
    ) {
        idCapture = mode.also {
            if (json.contains("enabled")) {
                it.isEnabled = json.requireByKeyAsBoolean("enabled")
            }
        }
    }
}
