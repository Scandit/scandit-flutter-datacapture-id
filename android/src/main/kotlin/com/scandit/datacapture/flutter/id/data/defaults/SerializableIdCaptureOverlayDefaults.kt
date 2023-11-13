package com.scandit.datacapture.flutter.id.data.defaults

import com.scandit.datacapture.frameworks.core.data.SerializableData

class SerializableIdCaptureOverlayDefaults(
    private val capturedBrushDefaults: Map<String, Any?>,
    private val localizedBrushDefaults: Map<String, Any?>,
    private val rejectedBrushDefaults: Map<String, Any?>
) : SerializableData {
    override fun toMap(): Map<String, Any?> =
        mapOf(
            FIELD_DEFAULT_CAPTURED_BRUSH to capturedBrushDefaults,
            FIELD_DEFAULT_LOCALIZED_BRUSH to localizedBrushDefaults,
            FIELD_DEFAULT_REJECTED_BRUSH to rejectedBrushDefaults
        )

    private companion object {
        const val FIELD_DEFAULT_CAPTURED_BRUSH = "DefaultCapturedBrush"
        const val FIELD_DEFAULT_LOCALIZED_BRUSH = "DefaultLocalizedBrush"
        const val FIELD_DEFAULT_REJECTED_BRUSH = "DefaultRejectedBrush"
    }
}
