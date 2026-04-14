/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';
// ignore: implementation_imports
import 'package:scandit_flutter_datacapture_core/src/internal/image_extensions.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/chip_verification_status.dart';
import 'package:scandit_flutter_datacapture_id/src/internal/clone_detection_status.dart';
import 'package:scandit_flutter_datacapture_id/src/result/date_result.dart';

@immutable
class NfcResult {
  final String? _firstName;
  final String? _lastName;
  final String? _fullName;
  final String? _documentNumber;
  final String? _documentAdditionalNumber;
  final String? _issuingCountryIso;
  final String? _issuingCountry;
  final String? _issuingAuthority;
  final DateResult? _dateOfIssue;
  final DateResult? _dateOfExpiry;
  final DateResult? _dateOfBirth;
  final Image? _faceImage;
  final Image? _signatureImage;
  final ChipVerificationStatus _chipVerificationStatus;
  final CloneDetectionStatus _cloneDetectionStatus;

  const NfcResult(
    this._firstName,
    this._lastName,
    this._fullName,
    this._documentNumber,
    this._documentAdditionalNumber,
    this._issuingCountryIso,
    this._issuingCountry,
    this._issuingAuthority,
    this._dateOfIssue,
    this._dateOfExpiry,
    this._dateOfBirth,
    this._faceImage,
    this._signatureImage,
    this._chipVerificationStatus,
    this._cloneDetectionStatus,
  );

  factory NfcResult.fromJSON(Map<String, dynamic> json) {
    return NfcResult(
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['fullName'] as String?,
      json['documentNumber'] as String?,
      json['documentAdditionalNumber'] as String?,
      json['issuingCountryIso'] as String?,
      json['issuingCountry'] as String?,
      json['issuingAuthority'] as String?,
      json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null,
      json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null,
      json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null,
      (json['faceImage'] as String?).toImage(),
      (json['signatureImage'] as String?).toImage(),
      ChipVerificationStatus.fromJson(json['chipVerificationStatus'] as String),
      CloneDetectionStatusSerializer.fromJson(json['cloneDetectionStatus'] as String),
    );
  }

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  String? get documentNumber => _documentNumber;

  String? get documentAdditionalNumber => _documentAdditionalNumber;

  String? get issuingCountryIso => _issuingCountryIso;

  String? get issuingCountry => _issuingCountry;

  String? get issuingAuthority => _issuingAuthority;

  DateResult? get dateOfIssue => _dateOfIssue;

  DateResult? get dateOfExpiry => _dateOfExpiry;

  DateResult? get dateOfBirth => _dateOfBirth;

  Image? get faceImage => _faceImage;

  Image? get signatureImage => _signatureImage;

  ChipVerificationStatus get chipVerificationStatus => _chipVerificationStatus;

  CloneDetectionStatus get cloneDetectionStatus => _cloneDetectionStatus;
}
