package com.scandit.datacapture.flutter.id

import com.scandit.datacapture.flutter.core.utils.FlutterResult
import com.scandit.datacapture.flutter.core.utils.rejectKotlinError
import com.scandit.datacapture.frameworks.core.errors.FrameDataNullError
import com.scandit.datacapture.frameworks.core.utils.LastFrameData
import com.scandit.datacapture.frameworks.id.IdCaptureModule
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class IdCaptureMethodHandler(
    private val idCaptureModule: IdCaptureModule
) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "addIdCaptureListener" -> {
                idCaptureModule.addListener()
                result.success(null)
            }

            "removeIdCaptureListener" -> {
                idCaptureModule.removeListener()
                result.success(null)
            }

            "addIdCaptureAsyncListener" -> {
                idCaptureModule.addAsyncListener()
                result.success(null)
            }

            "removeIdCaptureAsyncListener" -> {
                idCaptureModule.removeAsyncListener()
                result.success(null)
            }

            "finishDidCaptureId" -> {
                idCaptureModule.finishDidCaptureId(call.arguments as Boolean)
                result.success(null)
            }

            "finishDidRejectId" -> {
                idCaptureModule.finishDidRejectId(call.arguments as Boolean)
                result.success(null)
            }

            "finishDidLocalizeId" -> {
                idCaptureModule.finishDidLocalizeId(call.arguments as Boolean)
                result.success(null)
            }

            "finishDidTimeout" -> {
                idCaptureModule.finishDidTimeout(call.arguments as Boolean)
                result.success(null)
            }

            "getDefaults" -> {
                val defaults = idCaptureModule.getDefaults()
                result.success(JSONObject(defaults).toString())
            }

            "reset" -> {
                idCaptureModule.resetMode()
                result.success(null)
            }

            "verify" ->
                idCaptureModule.verifyCaptureId(call.arguments as String, FlutterResult(result))

            "createAamvaBarcodeVerifier" ->
                idCaptureModule.createContextForBarcodeVerification(FlutterResult(result))

            "verifyCapturedIdBarcode" ->
                idCaptureModule.verifyCapturedIdBarcode(
                    call.arguments as String,
                    FlutterResult(result)
                )

            "vizMrzComparisonVerifier" ->
                idCaptureModule.vizMrzVerification(
                    call.arguments as String,
                    FlutterResult(result)
                )

            "getLastFrameData" -> LastFrameData.getLastFrameDataJson {
                if (it.isNullOrBlank()) {
                    result.rejectKotlinError(FrameDataNullError())
                    return@getLastFrameDataJson
                }
                result.success(it)
            }
        }
    }

    companion object {
        const val EVENT_CHANNEL_NAME =
            "com.scandit.datacapture.id.capture/event_channel"
        const val METHOD_CHANNEL_NAME =
            "com.scandit.datacapture.id.capture/method_channel"
    }
}
