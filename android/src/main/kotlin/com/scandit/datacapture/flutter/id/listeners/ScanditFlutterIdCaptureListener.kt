package com.scandit.datacapture.flutter.id.listeners

import com.scandit.datacapture.core.data.FrameData
import com.scandit.datacapture.flutter.core.common.LastFrameDataHolder
import com.scandit.datacapture.flutter.core.utils.EventHandler
import com.scandit.datacapture.flutter.core.utils.EventSinkWithResult
import com.scandit.datacapture.id.capture.IdCapture
import com.scandit.datacapture.id.capture.IdCaptureListener
import com.scandit.datacapture.id.capture.IdCaptureSession
import org.json.JSONObject

class ScanditFlutterIdCaptureListener(
    private val eventHandler: EventHandler,
    private val onIdCaptured: EventSinkWithResult<Boolean> =
        EventSinkWithResult(ON_ID_CAPTURED),
    private val onIdLocalized: EventSinkWithResult<Boolean> =
        EventSinkWithResult(ON_ID_LOCALIZED),
    private val onError: EventSinkWithResult<Boolean> =
        EventSinkWithResult(ON_ERROR),
    private val onIdRejected: EventSinkWithResult<Boolean> =
        EventSinkWithResult(ON_ID_REJECTED)
) : IdCaptureListener {
    companion object {
        private const val ON_ID_CAPTURED = "idCaptureListener-didCaptureId"
        private const val ON_ID_LOCALIZED = "idCaptureListener-didLocalizeId"
        private const val ON_ERROR = "idCaptureListener-didFail"
        private const val ON_ID_REJECTED = "idCaptureListener-didRejectId"

        private const val FIELD_EVENT = "event"
        private const val FIELD_SESSION = "session"

        const val CHANNEL_NAME =
            "com.scandit.datacapture.id.capture.event/id_capture_listener"
    }

    fun enableListener() {
        eventHandler.enableListener()
    }

    fun disableListener() {
        eventHandler.disableListener()
        onIdCaptured.onCancel()
    }

    override fun onIdCaptured(mode: IdCapture, session: IdCaptureSession, data: FrameData) {
        emit(onIdCaptured, mode, ON_ID_CAPTURED, session, data)
    }

    override fun onIdLocalized(mode: IdCapture, session: IdCaptureSession, data: FrameData) {
        emit(onIdLocalized, mode, ON_ID_LOCALIZED, session, data)
    }

    override fun onErrorEncountered(
        mode: IdCapture,
        error: Throwable,
        session: IdCaptureSession,
        data: FrameData
    ) {
        emit(onError, mode, ON_ERROR, session, data)
    }

    override fun onIdRejected(mode: IdCapture, session: IdCaptureSession, data: FrameData) {
        emit(onIdRejected, mode, ON_ID_REJECTED, session, data)
    }

    fun finishDidCaptureId(enabled: Boolean) {
        onIdCaptured.onResult(enabled)
    }

    private fun emit(
        eventSinkWithResult: EventSinkWithResult<Boolean>,
        mode: IdCapture,
        event: String,
        session: IdCaptureSession,
        data: FrameData
    ) {
        LastFrameDataHolder.frameData = data
        eventHandler.getCurrentEventSink()?.let {
            val params = JSONObject(
                mapOf(
                    FIELD_EVENT to event,
                    FIELD_SESSION to session.toJson()
                )
            ).toString()
            mode.isEnabled =
                eventSinkWithResult.emitForResult(it, params, mode.isEnabled)
        }
        LastFrameDataHolder.frameData = null
    }

    fun finishDidRejectId(enabled: Boolean) {
        onIdRejected.onResult(enabled)
    }

    fun finishDidLocalizeId(enabled: Boolean) {
        onIdLocalized.onResult(enabled)
    }

    fun finishDidFail(enabled: Boolean) {
        onError.onResult(enabled)
    }
}
