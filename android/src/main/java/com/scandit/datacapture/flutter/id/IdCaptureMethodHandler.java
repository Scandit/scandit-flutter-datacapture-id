/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.id;

import androidx.annotation.NonNull;

import com.scandit.datacapture.flutter.core.utils.FlutterResult;
import com.scandit.datacapture.frameworks.core.FrameworkModule;
import com.scandit.datacapture.frameworks.core.locator.ServiceLocator;
import com.scandit.datacapture.frameworks.id.IdCaptureModule;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import org.json.JSONObject;

public class IdCaptureMethodHandler implements MethodChannel.MethodCallHandler {

    public static final String EVENT_CHANNEL_NAME = "com.scandit.datacapture.id.capture/event_channel";
    public static final String METHOD_CHANNEL_NAME = "com.scandit.datacapture.id.capture/method_channel";

    private final ServiceLocator<FrameworkModule> serviceLocator;

    public IdCaptureMethodHandler(ServiceLocator<FrameworkModule> serviceLocator) {
        this.serviceLocator = serviceLocator;
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "addIdCaptureListener":
                getSharedModule().addAsyncListener();
                result.success(null);
                break;

            case "removeIdCaptureListener":
                getSharedModule().removeAsyncListener();
                result.success(null);
                break;

            case "finishDidCaptureId":
                getSharedModule().finishDidCaptureId(Boolean.TRUE.equals(call.arguments()));
                result.success(null);
                break;

            case "finishDidRejectId":
                getSharedModule().finishDidRejectId(Boolean.TRUE.equals(call.arguments()));
                result.success(null);
                break;

            case "getDefaults":
                result.success(new JSONObject(getSharedModule().getDefaults()).toString());
                break;

            case "reset":
                getSharedModule().resetMode();
                result.success(null);
                break;

            case "createAamvaBarcodeVerifier":
                getSharedModule().createContextForBarcodeVerification(new FlutterResult(result));
                break;

            case "verifyCapturedIdBarcode":
                assert call.arguments() != null;
                getSharedModule().verifyCapturedIdBarcode(
                        call.arguments(),
                        new FlutterResult(result)
                );
                break;
                
            case "getLastFrameData":
                result.success(null);
                break;

            case "setModeEnabledState":
                getSharedModule().setModeEnabled(Boolean.TRUE.equals(call.arguments()));
                break;

            case "updateIdCaptureMode":
                assert call.arguments() != null;
                getSharedModule().updateModeFromJson(call.arguments(), new FlutterResult(result));
                break;

            case "applyIdCaptureModeSettings":
                assert call.arguments() != null;
                getSharedModule().applyModeSettings(call.arguments(), new FlutterResult(result));
                break;

            case "updateIdCaptureOverlay":
                assert call.arguments() != null;
                getSharedModule().updateOverlay(call.arguments(), new FlutterResult(result));
                break;

            case "updateFeedback":
                assert call.arguments() != null;
                getSharedModule().updateFeedback(call.arguments(), new FlutterResult(result));
                break;
        }
    }

    private volatile IdCaptureModule sharedModuleInstance;

    private IdCaptureModule getSharedModule() {
        if (sharedModuleInstance == null) {
            synchronized (this) {
                if (sharedModuleInstance == null) {
                    sharedModuleInstance = (IdCaptureModule)this.serviceLocator.resolve(IdCaptureModule.class.getName());
                }
            }
        }
        return sharedModuleInstance;
    }
}
