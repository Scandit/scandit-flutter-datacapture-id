package com.scandit.datacapture.flutter.id.data.defaults

import com.scandit.datacapture.flutter.core.data.SerializableData
import com.scandit.datacapture.flutter.core.data.defaults.SerializableBrushDefaults
import org.json.JSONObject

class SerializableIdCaptureOverlayDefaults(
    private val capturedBrushDefaults: SerializableBrushDefaults,
    private val localizedBrushDefaults: SerializableBrushDefaults,
    private val rejectedBrushDefaults: SerializableBrushDefaults
) : SerializableData {
    override fun toJson(): JSONObject = JSONObject(
        mapOf(
            FIELD_DEFAULT_CAPTURED_BRUSH to capturedBrushDefaults.toJson(),
            FIELD_DEFAULT_LOCALIZED_BRUSH to localizedBrushDefaults.toJson(),
            FIELD_DEFAULT_REJECTED_BRUSH to rejectedBrushDefaults.toJson()
        )
    )

    private companion object {
        const val FIELD_DEFAULT_CAPTURED_BRUSH = "DefaultCapturedBrush"
        const val FIELD_DEFAULT_LOCALIZED_BRUSH = "DefaultLocalizedBrush"
        const val FIELD_DEFAULT_REJECTED_BRUSH = "DefaultRejectedBrush"
    }
}
