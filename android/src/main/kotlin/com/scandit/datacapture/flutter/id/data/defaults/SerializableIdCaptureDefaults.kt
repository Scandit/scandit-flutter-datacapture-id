package com.scandit.datacapture.flutter.id.data.defaults

import com.scandit.datacapture.frameworks.core.data.SerializableData
import com.scandit.datacapture.frameworks.core.data.defaults.BrushDefaults
import com.scandit.datacapture.frameworks.core.data.defaults.CameraSettingsDefaults
import com.scandit.datacapture.id.capture.IdCapture
import com.scandit.datacapture.id.ui.overlay.IdCaptureOverlay
import org.json.JSONObject

class SerializableIdCaptureDefaults(
    private val recommendedCameraSettings: CameraSettingsDefaults,
    private val idCaptureOverlayDefaults: SerializableIdCaptureOverlayDefaults
) : SerializableData {

    override fun toMap(): Map<String, Any?> =
        mapOf(
            FIELD_RECOMMENDED_CAMERA_SETTINGS to recommendedCameraSettings.toMap(),
            FIELD_ID_CAPTURE_OVERLAY to idCaptureOverlayDefaults.toMap()
        )

    companion object {
        const val FIELD_RECOMMENDED_CAMERA_SETTINGS = "RecommendedCameraSettings"
        const val FIELD_ID_CAPTURE_OVERLAY = "IdCaptureOverlay"

        @JvmStatic
        fun createDefaults(): String {
            return JSONObject(
                SerializableIdCaptureDefaults(
                    CameraSettingsDefaults.create(
                        IdCapture.createRecommendedCameraSettings()
                    ),
                    SerializableIdCaptureOverlayDefaults(
                        BrushDefaults.get(IdCaptureOverlay.defaultCapturedBrush()),
                        BrushDefaults.get(IdCaptureOverlay.defaultLocalizedBrush()),
                        BrushDefaults.get(IdCaptureOverlay.defaultRejectedBrush())

                    )
                ).toMap()
            ).toString()
        }
    }
}
