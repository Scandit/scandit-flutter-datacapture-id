/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.id;

import androidx.annotation.NonNull;

import com.scandit.datacapture.flutter.core.utils.FlutterResult;
import com.scandit.datacapture.flutter.core.utils.ResultUtils;
import com.scandit.datacapture.frameworks.core.FrameworkModule;
import com.scandit.datacapture.frameworks.core.errors.FrameDataNullError;
import com.scandit.datacapture.frameworks.core.locator.ServiceLocator;
import com.scandit.datacapture.frameworks.core.utils.DefaultLastFrameData;
import com.scandit.datacapture.frameworks.core.utils.LastFrameData;
import com.scandit.datacapture.frameworks.id.IdCaptureModule;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import org.json.JSONObject;

public class IdCaptureMethodHandler implements MethodChannel.MethodCallHandler {

    public static final String EVENT_CHANNEL_NAME = "com.scandit.datacapture.id.capture/event_channel";
    public static final String METHOD_CHANNEL_NAME = "com.scandit.datacapture.id.capture/method_channel";

    private final ServiceLocator<FrameworkModule> serviceLocator;
    private final LastFrameData lastFrameData;

    public IdCaptureMethodHandler(ServiceLocator<FrameworkModule> serviceLocator) {
        this(serviceLocator, DefaultLastFrameData.getInstance());
    }

    public IdCaptureMethodHandler(ServiceLocator<FrameworkModule> serviceLocator, LastFrameData lastFrameData) {
        this.serviceLocator = serviceLocator;
        this.lastFrameData = lastFrameData;
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "addIdCaptureListener":
                getSharedModule().addListener();
                result.success(null);
                break;

            case "removeIdCaptureListener":
                getSharedModule().removeListener();
                result.success(null);
                break;

            case "addIdCaptureAsyncListener":
                getSharedModule().addAsyncListener();
                result.success(null);
                break;

            case "removeIdCaptureAsyncListener":
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

            case "finishDidLocalizeId":
                getSharedModule().finishDidLocalizeId(Boolean.TRUE.equals(call.arguments()));
                result.success(null);
                break;

            case "finishDidTimeout":
                getSharedModule().finishDidTimeout(Boolean.TRUE.equals(call.arguments()));
                result.success(null);
                break;

            case "getDefaults":
                result.success(new JSONObject(getSharedModule().getDefaults()).toString());
                break;

            case "reset":
                getSharedModule().resetMode();
                result.success(null);
                break;

            case "verify":
                assert call.arguments() != null;
                getSharedModule().verifyCaptureId(call.arguments(), new FlutterResult(result));
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

            case "vizMrzComparisonVerifier":
                assert call.arguments() != null;
                getSharedModule().vizMrzVerification(call.arguments(), new FlutterResult(result));
                break;

            case "getLastFrameData":
                lastFrameData.getLastFrameDataBytes(bytes -> {
                    if (bytes == null) {
                        ResultUtils.rejectKotlinError(result, new FrameDataNullError());
                    } else {
                        result.success(bytes);
                    }
                    return null;
                });
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
