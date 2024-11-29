/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */
package com.scandit.datacapture.flutter.id;

import androidx.annotation.NonNull;

import com.scandit.datacapture.flutter.core.extensions.MethodChannelExtensions;
import com.scandit.datacapture.flutter.core.utils.FlutterEmitter;
import com.scandit.datacapture.frameworks.core.FrameworkModule;
import com.scandit.datacapture.frameworks.core.locator.DefaultServiceLocator;
import com.scandit.datacapture.frameworks.core.locator.ServiceLocator;
import com.scandit.datacapture.frameworks.id.IdCaptureModule;
import com.scandit.datacapture.frameworks.id.listeners.FrameworksIdCaptureListener;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodChannel;

import java.lang.ref.WeakReference;
import java.util.concurrent.locks.ReentrantLock;

public class ScanditFlutterDataCaptureIdProxyPlugin implements FlutterPlugin, ActivityAware {
    private static final ReentrantLock lock = new ReentrantLock();

    private final static FlutterEmitter idEmitter = new FlutterEmitter(IdCaptureMethodHandler.EVENT_CHANNEL_NAME);

    private final ServiceLocator<FrameworkModule> serviceLocator = DefaultServiceLocator.getInstance();

    private WeakReference<FlutterPlugin.FlutterPluginBinding> flutterPluginBinding = new WeakReference<>(null);

    private MethodChannel idCaptureMethodChannel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        flutterPluginBinding = new WeakReference<>(binding);
        setupModules(binding);
        setupMethodChannels(binding);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        flutterPluginBinding = new WeakReference<>(null);
        disposeMethodChannels();
        disposeModules();
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

    private void setupMethodChannels(@NonNull FlutterPlugin.FlutterPluginBinding binding) {
        idCaptureMethodChannel = MethodChannelExtensions.getMethodChannel(
                binding,
                IdCaptureMethodHandler.METHOD_CHANNEL_NAME
        );
        idCaptureMethodChannel.setMethodCallHandler(new IdCaptureMethodHandler(serviceLocator));
    }

    private void disposeMethodChannels() {
        if (idCaptureMethodChannel != null) {
            idCaptureMethodChannel.setMethodCallHandler(null);
            idCaptureMethodChannel = null;
        }
    }

    private void setupEventChannels() {
        FlutterPluginBinding binding = flutterPluginBinding.get();
        if (binding != null) {
            idEmitter.addChannel(binding.getBinaryMessenger());
        }
    }

    private void disposeEventChannels() {
        FlutterPluginBinding binding = flutterPluginBinding.get();
        if (binding != null) {
            idEmitter.removeChannel(binding.getBinaryMessenger());
        }
    }

    private void setupModules(@NonNull FlutterPlugin.FlutterPluginBinding binding) {
        lock.lock();
        try {
            IdCaptureModule idCaptureModule = (IdCaptureModule) serviceLocator.resolve(IdCaptureModule.class.getName());
            if (idCaptureModule != null) return;

            idCaptureModule = IdCaptureModule.create(
                    FrameworksIdCaptureListener.create(idEmitter)
            );
            idCaptureModule.onCreate(binding.getApplicationContext());

            serviceLocator.register(idCaptureModule);
        } finally {
            lock.unlock();
        }
    }

    private void disposeModules() {
        lock.lock();
        try {
            IdCaptureModule idCaptureModule = (IdCaptureModule) serviceLocator.remove(IdCaptureModule.class.getName());
            if (idCaptureModule != null) {
                idCaptureModule.onDestroy();
            }
        } finally {
            lock.unlock();
        }
    }
}
