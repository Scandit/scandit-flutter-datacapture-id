/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.id;

import androidx.annotation.NonNull;

import com.scandit.datacapture.flutter.core.utils.FlutterMethodCall;
import com.scandit.datacapture.flutter.core.utils.FlutterResult;
import com.scandit.datacapture.frameworks.core.FrameworkModule;
import com.scandit.datacapture.frameworks.core.locator.ServiceLocator;
import com.scandit.datacapture.frameworks.id.IdCaptureModule;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class IdCaptureMethodHandler implements MethodChannel.MethodCallHandler {

    public static final String EVENT_CHANNEL_NAME = "com.scandit.datacapture.id.capture/event_channel";
    public static final String METHOD_CHANNEL_NAME = "com.scandit.datacapture.id.capture/method_channel";

    private final ServiceLocator<FrameworkModule> serviceLocator;

    public IdCaptureMethodHandler(ServiceLocator<FrameworkModule> serviceLocator) {
        this.serviceLocator = serviceLocator;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        boolean executionResult = getSharedModule().execute(
                new FlutterMethodCall(call),
                new FlutterResult(result)
        );

        if (!executionResult) {
            result.notImplemented();
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
