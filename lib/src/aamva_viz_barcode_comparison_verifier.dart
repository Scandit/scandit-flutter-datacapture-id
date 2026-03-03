/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2022- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/services.dart';

import '../scandit_flutter_datacapture_id.dart';
import 'function_names.dart';

class AamvaVizBarcodeComparisonVerifier {
  final MethodChannel _methodChannel = MethodChannel(IdCaptureFunctionNames.methodsChannelName);

  AamvaVizBarcodeComparisonVerifier._();

  factory AamvaVizBarcodeComparisonVerifier.create() {
    return AamvaVizBarcodeComparisonVerifier._();
  }

  Future<AamvaVizBarcodeComparisonResult> verify(CapturedId capturedId) async {
    var encodedCapturedId = jsonEncode(capturedId.toMap());
    var result =
        await _methodChannel.invokeMethod(IdCaptureFunctionNames.aamvaVizBarcodeComparisonVerifier, encodedCapturedId);
    var jsonResult = jsonDecode(result);
    return AamvaVizBarcodeComparisonResult.fromJSON(jsonResult);
  }
}
