package com.scandit.datacapture.flutter.id

import com.scandit.datacapture.flutter.core.utils.FlutterResult
import com.scandit.datacapture.flutter.core.utils.rejectKotlinError
import com.scandit.datacapture.frameworks.core.errors.FrameDataNullError
import com.scandit.datacapture.frameworks.core.utils.DefaultLastFrameData
import com.scandit.datacapture.frameworks.core.utils.LastFrameData
import com.scandit.datacapture.frameworks.id.IdCaptureModule
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class IdCaptureMethodHandler(
    private val idCaptureModule: IdCaptureModule,
    private val lastFrameData: LastFrameData = DefaultLastFrameData.getInstance()
) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            METHOD_ADD_LISTENER -> {
                idCaptureModule.addListener()
                result.success(null)
            }

            METHOD_REMOVE_LISTENER -> {
                idCaptureModule.removeListener()
                result.success(null)
            }

            METHOD_ADD_ASYNC_LISTENER -> {
                idCaptureModule.addAsyncListener()
                result.success(null)
            }

            METHOD_REMOVE_ASYNC_LISTENER -> {
                idCaptureModule.removeAsyncListener()
                result.success(null)
            }

            METHOD_FINISH_DID_CAPTURE -> {
                idCaptureModule.finishDidCaptureId(call.arguments as Boolean)
                result.success(null)
            }

            METHOD_FINISH_DID_REJECT -> {
                idCaptureModule.finishDidRejectId(call.arguments as Boolean)
                result.success(null)
            }

            METHOD_FINISH_DID_LOCALIZE -> {
                idCaptureModule.finishDidLocalizeId(call.arguments as Boolean)
                result.success(null)
            }

            METHOD_FINISH_DID_TIMEOUT -> {
                idCaptureModule.finishDidTimeout(call.arguments as Boolean)
                result.success(null)
            }

            METHOD_GET_DEFAULTS -> {
                val defaults = idCaptureModule.getDefaults()
                result.success(JSONObject(defaults).toString())
            }

            METHOD_RESET -> {
                idCaptureModule.resetMode()
                result.success(null)
            }

            METHOD_VERIFY ->
                idCaptureModule.verifyCaptureId(call.arguments as String, FlutterResult(result))

            METHOD_CREATE_AAMVA_BARCODE_VERIFIER ->
                idCaptureModule.createContextForBarcodeVerification(FlutterResult(result))

            METHOD_VERIFY_CAPTURED_ID_BARCODE ->
                idCaptureModule.verifyCapturedIdBarcode(
                    call.arguments as String,
                    FlutterResult(result)
                )

            METHOD_VIZ_MRZ_COMPARISON_VERIFIER ->
                idCaptureModule.vizMrzVerification(
                    call.arguments as String,
                    FlutterResult(result)
                )

            METHOD_GET_LAST_FRAME -> lastFrameData.getLastFrameDataBytes {
                if (it == null) {
                    result.rejectKotlinError(FrameDataNullError())
                    return@getLastFrameDataBytes
                }
                result.success(it)
            }

            METHOD_SET_ENABLED_STATE -> idCaptureModule.setModeEnabled(call.arguments as Boolean)

            METHOD_UPDATE_MODE -> idCaptureModule.updateModeFromJson(
                call.arguments as String,
                FlutterResult(result)
            )

            METHOD_APPLY_SETTINGS -> idCaptureModule.applyModeSettings(
                call.arguments as String,
                FlutterResult(result)
            )

            METHOD_UPDATE_OVERLAY -> idCaptureModule.updateOverlay(
                call.arguments as String,
                FlutterResult(result)
            )
        }
    }

    companion object {
        const val EVENT_CHANNEL_NAME =
            "com.scandit.datacapture.id.capture/event_channel"
        const val METHOD_CHANNEL_NAME =
            "com.scandit.datacapture.id.capture/method_channel"

        private const val METHOD_UPDATE_OVERLAY = "updateIdCaptureOverlay"
        private const val METHOD_APPLY_SETTINGS = "applyIdCaptureModeSettings"
        private const val METHOD_UPDATE_MODE = "updateIdCaptureMode"
        private const val METHOD_SET_ENABLED_STATE = "setModeEnabledState"
        private const val METHOD_GET_LAST_FRAME = "getLastFrameData"
        private const val METHOD_VIZ_MRZ_COMPARISON_VERIFIER = "vizMrzComparisonVerifier"
        private const val METHOD_VERIFY_CAPTURED_ID_BARCODE = "verifyCapturedIdBarcode"
        private const val METHOD_CREATE_AAMVA_BARCODE_VERIFIER = "createAamvaBarcodeVerifier"
        private const val METHOD_VERIFY = "verify"
        private const val METHOD_RESET = "reset"
        private const val METHOD_GET_DEFAULTS = "getDefaults"
        private const val METHOD_FINISH_DID_TIMEOUT = "finishDidTimeout"
        private const val METHOD_FINISH_DID_LOCALIZE = "finishDidLocalizeId"
        private const val METHOD_FINISH_DID_REJECT = "finishDidRejectId"
        private const val METHOD_FINISH_DID_CAPTURE = "finishDidCaptureId"
        private const val METHOD_REMOVE_ASYNC_LISTENER = "removeIdCaptureAsyncListener"
        private const val METHOD_ADD_ASYNC_LISTENER = "addIdCaptureAsyncListener"
        private const val METHOD_ADD_LISTENER = "addIdCaptureListener"
        private const val METHOD_REMOVE_LISTENER = "removeIdCaptureListener"
    }
}
