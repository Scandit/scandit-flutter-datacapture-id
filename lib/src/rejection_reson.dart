/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

/// Possible reasons why a document can be rejected.
///
/// When multiple rejection conditions apply, only the highest-priority reason is reported. The evaluation order, from highest to lowest priority, is:
///
/// 1. [RejectionReason.notAcceptedDocumentType] — document is in the rejected list
/// 2. [RejectionReason.notAcceptedDocumentType] — document is not in the accepted list
/// 3. [RejectionReason.forgedAamvaBarcode]
/// 4. [RejectionReason.notRealIdCompliant]
/// 5. [RejectionReason.inconsistentData]
/// 6. [RejectionReason.holderUnderage]
/// 7. [RejectionReason.documentExpired]
/// 8. [RejectionReason.documentExpiresSoon]
/// 9. [RejectionReason.timeout]
/// 10. [RejectionReason.documentVoided], [RejectionReason.invalidFormat], and others
///
/// Although [RejectionReason.invalidFormat] has the lowest priority in the evaluation order, it arises when a document cannot be parsed at all. In that case, document type and authenticity cannot be determined, so higher-priority reasons are not applicable in practice.
///
/// For two-sided documents, [RejectionReason.inconsistentData] is only evaluated after both sides have been captured. If the front side triggers a rejection — such as [RejectionReason.holderUnderage], [RejectionReason.documentExpired], or [RejectionReason.documentExpiresSoon] — the back side is not scanned and [RejectionReason.inconsistentData] is never evaluated, even though it ranks higher in the precedence order.
///
/// Added in version 6.25.0
enum RejectionReason {
  /// The type of the presented document is not enabled in the settings.
  ///
  /// Added in version 6.25.0
  notAcceptedDocumentType('notAcceptedDocumentType'),
  /// The document format is incorrect.
  ///
  /// Added in version 6.25.0
  invalidFormat('invalidFormat'),
  /// The document is voided.
  ///
  /// Added in version 6.25.0
  documentVoided('documentVoided'),
  /// The capture process resulted in a timeout.
  ///
  /// Added in version 7.0.0
  timeout('timeout'),
  /// The capture process resulted in no result. This reason is only used in conjunction with a single image frame source. ID Capture is automatically :meth:id.IdCapture.Reset when this rejection happens. Currently only used by the Web platform
  ///
  /// Added in version 7.0.0
  singleImageNotRecognized('singleImageNotRecognized'),
  /// The document is expired.
  ///
  /// Added in version 7.1.0
  documentExpired('documentExpired'),
  /// The document will expire soon.
  ///
  /// Added in version 7.1.0
  documentExpiresSoon('documentExpiresSoon'),
  /// The document is not REAL ID compliant.
  ///
  /// Added in version 7.1.0
  notRealIdCompliant('notRealIdCompliant'),
  /// The document’s holder is underage.
  ///
  /// Added in version 7.1.0
  holderUnderage('holderUnderage'),
  /// The document has a forged AAMVA barcode.
  ///
  /// Added in version 7.1.0
  forgedAamvaBarcode('forgedAamvaBarcode'),
  /// The document has inconsistent data.
  ///
  /// Added in version 7.1.0
  inconsistentData('inconsistentData'),
  /// An error occurred while retrieving the document data via Bluetooth.
  ///
  /// Added in version 7.5.0
  bluetoothCommunicationError('bluetoothCommunicationError'),
  /// Bluetooth is not supported, disabled, or missing required permissions on your device.
  ///
  /// Added in version 7.5.0
  bluetoothUnavailable('bluetoothUnavailable'),
  /// A request to the cloud failed. The service may be temporarily unavailable.
  ///
  /// Added in version 8.7.0
  cloudRequestFailed('cloudRequestFailed'),
  /// The cloud manipulation check flagged the document as manipulated.
  ///
  /// Added in version 8.7.0
  manipulatedDocument('manipulatedDocument');

  const RejectionReason(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension RejectionReasonDeserializer on RejectionReason {
  static RejectionReason fromJSON(String jsonValue) {
    return RejectionReason.values.firstWhere((element) => element.toString() == jsonValue);
  }

  /// Null when the wire value is one this enum does not carry, so a caller can decline the event
  /// explicitly instead of catching the `StateError` [fromJSON] throws.
  static RejectionReason? tryFromJSON(String jsonValue) {
    for (final reason in RejectionReason.values) {
      if (reason.toString() == jsonValue) {
        return reason;
      }
    }
    return null;
  }
}
