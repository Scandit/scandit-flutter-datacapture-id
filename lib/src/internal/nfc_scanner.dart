/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_id/src/captured_id.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/nfc_flow_builder.dart';

class NfcScanner {
  final String _scannerId;

  NfcScanner._(this._scannerId);

  static Future<NfcScanner> newInstance() async {
    // Call native method to create scanner (will be implemented by framework bridge)
    final scannerId = await _createNfcScanner();
    return NfcScanner._(scannerId);
  }

  NFCFlowBuilder captureNfcFrom(CapturedId capturedId) {
    return NFCFlowBuilder(_scannerId, capturedId);
  }

  Future<void> dispose() async {
    await _disposeNfcScanner(_scannerId);
  }

  static Future<String> _createNfcScanner() async {
    // This will be implemented by the native bridge
    throw UnimplementedError('createNfcScanner not implemented');
  }

  static Future<void> _disposeNfcScanner(String scannerId) async {
    // This will be implemented by the native bridge
    throw UnimplementedError('disposeNfcScanner not implemented');
  }
}
