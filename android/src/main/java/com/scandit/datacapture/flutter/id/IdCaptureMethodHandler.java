/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.id;

import androidx.annotation.NonNull;

import com.scandit.datacapture.flutter.core.utils.FlutterMethodCall;
import com.scandit.datacapture.flutter.core.utils.FlutterResult;
import com.scandit.datacapture.frameworks.core.CoreModule;
import com.scandit.datacapture.frameworks.core.FrameworkModule;
import com.scandit.datacapture.frameworks.core.locator.ServiceLocator;
import com.scandit.datacapture.frameworks.id.IdCaptureModule;

import org.json.JSONObject;

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
        if (call.method.equals("executeId")) {
            CoreModule coreModule = (CoreModule) getModule(CoreModule.class.getSimpleName());
            if (coreModule == null) {
                result.error("-1", "Unable to retrieve the CoreModule from the locator.", null);
                return;
            }

            boolean executionResult = coreModule.execute(new FlutterMethodCall(call), new FlutterResult(result), getSharedModule());
            if (!executionResult) {
                String methodName = call.argument("methodName");
                if (methodName == null) {
                    methodName = "unknown";
                }

                result.error("METHOD_NOT_FOUND", "Unknown Core method: " + methodName, null);
            }
            return;
        } else if (call.method.equals("getDefaults")) {
            result.success(new JSONObject(getSharedModule().getDefaults()).toString());
            return;
        }
        result.notImplemented();
    }

    private volatile IdCaptureModule sharedModuleInstance;

    private IdCaptureModule getSharedModule() {
        if (sharedModuleInstance == null) {
            synchronized (this) {
                if (sharedModuleInstance == null) {
                    sharedModuleInstance = (IdCaptureModule) this.serviceLocator.resolve(IdCaptureModule.class.getSimpleName());
                }
            }
        }
        return sharedModuleInstance;
    }

    private FrameworkModule getModule(String moduleName) {
        return this.serviceLocator.resolve(moduleName);
    }
}
