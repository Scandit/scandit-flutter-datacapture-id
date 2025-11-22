/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'captured_id.dart';
import 'function_names.dart';
import 'result/aamva_barcode_verification_result.dart';

class AamvaBarcodeVerifier {
  final _AamvaBarcodeVerifierController _controller;
  // ignore: unused_field
  DataCaptureContext? _context;

  AamvaBarcodeVerifier._(this._controller);

  static Future<AamvaBarcodeVerifier> create(DataCaptureContext context) {
    var verifier = AamvaBarcodeVerifier._(_AamvaBarcodeVerifierController());
    return verifier._controller.create().then((value) {
      verifier._context = context;
      return verifier;
    });
  }

  Future<AamvaBarcodeVerificationResult> verify(CapturedId capturedId) {
    return _controller.verify(capturedId);
  }
}

class _AamvaBarcodeVerifierController {
  final MethodChannel _methodChannel = const MethodChannel(IdCaptureFunctionNames.methodsChannelName);

  Future<void> create() {
    return _methodChannel.invokeMethod(IdCaptureFunctionNames.createAamvaBarcodeVerifier);
  }

  Future<AamvaBarcodeVerificationResult> verify(CapturedId captureId) {
    return _methodChannel
        .invokeMethod(IdCaptureFunctionNames.verifyCapturedIdBarcode, jsonEncode(captureId.toMap()))
        .then((value) => AamvaBarcodeVerificationResult.fromJSON(jsonDecode(value)));
  }
}
