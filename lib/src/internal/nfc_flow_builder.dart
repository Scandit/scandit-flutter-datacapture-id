/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'dart:convert';
import 'package:scandit_flutter_datacapture_id/src/captured_id.dart';

class NFCFlowBuilder {
  final String _scannerId;
  final CapturedId _capturedId;

  // ignore: unused_field
  Function(CapturedId)? _onSuccessCallback;
  // ignore: unused_field
  Function()? _onFailureCallback;
  // ignore: unused_field
  Function()? _onSkippedCallback;

  NFCFlowBuilder(this._scannerId, this._capturedId);

  NFCFlowBuilder onSuccess(Function(CapturedId) callback) {
    _onSuccessCallback = callback;
    return this;
  }

  NFCFlowBuilder onFailure(Function() callback) {
    _onFailureCallback = callback;
    return this;
  }

  NFCFlowBuilder onSkipped(Function() callback) {
    _onSkippedCallback = callback;
    return this;
  }

  Future<void> start() async {
    // Register listeners and start the flow
    // This will be implemented by the native bridge
    final capturedIdJson = jsonEncode(_capturedId.toMap());

    // The native side will emit events that need to be listened to
    await _startNfcFlow(_scannerId, capturedIdJson);
  }

  static Future<void> _startNfcFlow(String scannerId, String capturedIdJson) async {
    // This will be implemented by the native bridge
    throw UnimplementedError('startNfcFlow not implemented');
  }
}
