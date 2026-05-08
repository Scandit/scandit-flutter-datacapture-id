/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

abstract class IdCaptureFunctionNames {
  static const String methodsChannelName = 'com.scandit.datacapture.id.capture/method_channel';
  static const String eventsChannelName = 'com.scandit.datacapture.id.capture/event_channel';

  static const String createAamvaBarcodeVerifier = 'createAamvaBarcodeVerifier';
  static const String verifyCapturedIdBarcode = 'verifyCapturedIdBarcode';
  static const String aamvaVizBarcodeComparisonVerifier = 'verify';
  static const String vizMrzComparisonVerifier = 'vizMrzComparisonVerifier';
  static const String addIdCaptureAsyncListener = 'addIdCaptureAsyncListener';
  static const String removeIdCaptureAsyncListener = 'removeIdCaptureAsyncListener';
  static const String getLastFrameDataName = 'getLastFrameData';
  static const String removeIdCaptureListenerName = 'removeIdCaptureListener';
  static const String addIdCaptureListenerName = 'addIdCaptureListener';
  static const String resetName = 'reset';
  static const String finishDidCaptureIdName = 'finishDidCaptureId';
  static const String finishDidLocalizeIdName = 'finishDidLocalizeId';
  static const String finishDidRejectIdName = 'finishDidRejectId';
  static const String finishDidTimeoutName = 'finishDidTimeout';
  static const String setModeEnabledState = 'setModeEnabledState';
  static const String applyIdCaptureModeSettings = 'applyIdCaptureModeSettings';
  static const String updateIdCaptureOverlay = 'updateIdCaptureOverlay';
  static const String updateIdCaptureMode = 'updateIdCaptureMode';
  static const String updateFeedback = 'updateFeedback';
}
