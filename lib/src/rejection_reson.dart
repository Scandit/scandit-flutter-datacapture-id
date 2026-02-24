/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

enum RejectionReason {
  notAcceptedDocumentType('notAcceptedDocumentType'),
  invalidFormat('invalidFormat'),
  documentVoided('documentVoided'),
  timeout('timeout'),
  singleImageNotRecognized('singleImageNotRecognized'),
  documentExpired('documentExpired'),
  documentExpiresSoon('documentExpiresSoon'),
  notRealIdCompliant('notRealIdCompliant'),
  holderUnderage('holderUnderage'),
  forgedAamvaBarcode('forgedAamvaBarcode'),
  inconsistentData('inconsistentData');

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
