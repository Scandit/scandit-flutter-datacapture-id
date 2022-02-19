/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

#import "ScanditFlutterDataCaptureIdPlugin.h"

#import <scandit_flutter_datacapture_id/scandit_flutter_datacapture_id-Swift.h>

@interface ScanditFlutterDataCaptureIdPlugin ()

@property (class, nonatomic, strong) ScanditFlutterDataCaptureIdPlugin *instance;

@property (nonatomic, strong) ScanditFlutterDataCaptureId *idInstance;

- (instancetype)initWithIdInstance:(ScanditFlutterDataCaptureId *)idInstance;

@end

@implementation ScanditFlutterDataCaptureIdPlugin

static ScanditFlutterDataCaptureIdPlugin *_instance;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    ScanditFlutterDataCaptureId *idInstance = [[ScanditFlutterDataCaptureId alloc]
        initWith:registrar.messenger];
    ScanditFlutterDataCaptureIdPlugin *idPlugin = [[ScanditFlutterDataCaptureIdPlugin alloc]
        initWithIdInstance:idInstance];
    [ScanditFlutterDataCaptureIdPlugin setInstance:idPlugin];
}

+ (ScanditFlutterDataCaptureIdPlugin *)instance {
    return _instance;
}

+ (void)setInstance:(ScanditFlutterDataCaptureIdPlugin *)instance {
    _instance = instance;
}

- (instancetype)initWithIdInstance:(ScanditFlutterDataCaptureId *)idInstance {
    if (self = [super init]) {
        _idInstance = idInstance;
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    result(FlutterMethodNotImplemented);
}

- (void)detachFromEngineForRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    [self.idInstance dispose];
    [ScanditFlutterDataCaptureIdPlugin setInstance:nil];
}

@end
