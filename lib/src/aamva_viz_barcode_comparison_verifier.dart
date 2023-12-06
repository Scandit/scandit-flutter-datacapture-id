/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2022- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';

import '../scandit_flutter_datacapture_id.dart';

class AamvaVizBarcodeComparisonVerifier {
  final MethodChannel _methodChannel =
      MethodChannel('com.scandit.datacapture.id.capture.method/aamva_viz_barcode_comparison_verifier');

  AamvaVizBarcodeComparisonVerifier._();

  factory AamvaVizBarcodeComparisonVerifier.create() {
    return AamvaVizBarcodeComparisonVerifier._();
  }

  Future<AamvaVizBarcodeComparisonResult> verify(CapturedId capturedId) async {
    var encodedCapturedId = jsonEncode(capturedId.toMap());
    var result = await _methodChannel.invokeMethod("verify", encodedCapturedId);
    var jsonResult = jsonDecode(result);
    return AamvaVizBarcodeComparisonResult.fromJSON(jsonResult);
  }
}
