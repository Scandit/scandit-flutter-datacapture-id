package com.scandit.datacapture.flutter.id.data.defaults

import com.scandit.datacapture.flutter.core.data.SerializableData
import com.scandit.datacapture.flutter.core.data.defaults.SerializableBrushDefaults
import com.scandit.datacapture.flutter.core.data.defaults.SerializableCameraSettingsDefaults
import com.scandit.datacapture.id.capture.IdCapture
import com.scandit.datacapture.id.ui.overlay.IdCaptureOverlay
import org.json.JSONObject

class SerializableIdCaptureDefaults(
    private val recommendedCameraSettings: SerializableCameraSettingsDefaults,
    private val idCaptureOverlayDefaults: SerializableIdCaptureOverlayDefaults
) : SerializableData {

    override fun toJson(): JSONObject = JSONObject(
        mapOf(
            FIELD_RECOMMENDED_CAMERA_SETTINGS to recommendedCameraSettings.toJson(),
            FIELD_ID_CAPTURE_OVERLAY to idCaptureOverlayDefaults.toJson()
        )
    )

    companion object {
        const val FIELD_RECOMMENDED_CAMERA_SETTINGS = "RecommendedCameraSettings"
        const val FIELD_ID_CAPTURE_OVERLAY = "IdCaptureOverlay"

        @JvmStatic
        fun createDefaults(): String {
            return SerializableIdCaptureDefaults(
                SerializableCameraSettingsDefaults(
                    IdCapture.createRecommendedCameraSettings()
                ),
                SerializableIdCaptureOverlayDefaults(
                    SerializableBrushDefaults(IdCaptureOverlay.DEFAULT_CAPTURED_BRUSH),
                    SerializableBrushDefaults(IdCaptureOverlay.DEFAULT_LOCALIZED_BRUSH),
                    SerializableBrushDefaults(IdCaptureOverlay.DEFAULT_REJECTED_BRUSH)

                )
            ).toJson().toString()
        }
    }
}
