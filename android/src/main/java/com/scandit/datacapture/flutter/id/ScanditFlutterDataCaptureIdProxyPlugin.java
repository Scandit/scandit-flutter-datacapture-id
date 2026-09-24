/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.id;

import androidx.annotation.NonNull;
import androidx.annotation.VisibleForTesting;

import com.scandit.datacapture.flutter.core.BaseFlutterPlugin;
import com.scandit.datacapture.flutter.core.utils.FlutterEmitter;
import com.scandit.datacapture.frameworks.core.FrameworkModule;
import com.scandit.datacapture.frameworks.core.locator.ServiceLocator;
import com.scandit.datacapture.frameworks.id.IdCaptureModule;
import com.scandit.datacapture.frameworks.id.listeners.FrameworksIdCaptureListener;

import java.util.concurrent.atomic.AtomicInteger;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodChannel;

public class ScanditFlutterDataCaptureIdProxyPlugin extends BaseFlutterPlugin implements FlutterPlugin, ActivityAware {
    private final static FlutterEmitter idEmitter = new FlutterEmitter(IdCaptureMethodHandler.EVENT_CHANNEL_NAME);

    private static final AtomicInteger activePluginInstances = new AtomicInteger(0);

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        activePluginInstances.incrementAndGet();
        super.onAttachedToEngine(binding);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        activePluginInstances.decrementAndGet();
        super.onDetachedFromEngine(binding);
    }

    @Override
    protected int getActivePluginInstanceCount() {
        return activePluginInstances.get();
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        setupEventChannels();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        disposeEventChannels();
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        onAttachedToActivity(binding);
    }

    @Override
    public void onDetachedFromActivity() {
        disposeEventChannels();
    }

    @Override
    protected void setupMethodChannels(FlutterPluginBinding binding, ServiceLocator<FrameworkModule> serviceLocator) {
        MethodChannel channel = createChannel(
                binding,
                IdCaptureMethodHandler.METHOD_CHANNEL_NAME
        );
        channel.setMethodCallHandler(new IdCaptureMethodHandler(serviceLocator));
        registerChannel(channel);
    }

    @Override
    protected void setupModules(FlutterPlugin.FlutterPluginBinding binding) {
        IdCaptureModule idCaptureModule = resolveModule(IdCaptureModule.class);
        if (idCaptureModule != null) return;

        idCaptureModule = IdCaptureModule.create(
                FrameworksIdCaptureListener.create(idEmitter)
        );
        idCaptureModule.onCreate(binding.getApplicationContext());

        registerModule(idCaptureModule);
    }

    private void setupEventChannels() {
        FlutterPluginBinding binding = getCurrentBinding();
        if (binding != null) {
            idEmitter.addChannel(binding.getBinaryMessenger());
        }
    }

    private void disposeEventChannels() {
        FlutterPluginBinding binding = getCurrentBinding();
        if (binding != null) {
            idEmitter.removeChannel(binding.getBinaryMessenger());
        }
    }

    @VisibleForTesting
    public static void resetActiveInstances() {
        activePluginInstances.set(0);
    }
}
