/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

enum RejectionReason {
  documentTypeNotEnabled('documentTypeNotEnabled'),
  incorrectBarcodeFormat('incorrectBarcodeFormat'),
  documentVoided('documentVoided');

  const RejectionReason(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension RejectionReasonDeserializer on RejectionReason {
  static RejectionReason fromJSON(String jsonValue) {
    return RejectionReason.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
