/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_id/src/application_status.dart';

import 'date_result.dart';

@immutable
class VisaDetails {
  final ApplicationStatus? _applicationStatus;
  final DateResult? _dateOfIssue;
  final int? _durationInDays;
  final String? _issuingAuthority;
  final String? _fullName;
  final String? _geographicValidity;
  final String? _issuingCountryIso;
  final bool? _multipleEntries;
  final int? _numberOfEntries;
  final String? _passportNumber;
  final DateResult? _validFrom;
  final DateResult? _validUntil;
  final String? _visaNumber;
  final String? _visaType;
  final String? _foilNumber;

  const VisaDetails._({
    required ApplicationStatus? applicationStatus,
    required DateResult? dateOfIssue,
    required int? durationInDays,
    required String? issuingAuthority,
    required String? fullName,
    required String? geographicValidity,
    required String? issuingCountryIso,
    required bool? multipleEntries,
    required int? numberOfEntries,
    required String? passportNumber,
    required DateResult? validFrom,
    required DateResult? validUntil,
    required String? visaNumber,
    required String? visaType,
    required String? foilNumber,
  })  : _applicationStatus = applicationStatus,
        _dateOfIssue = dateOfIssue,
        _durationInDays = durationInDays,
        _issuingAuthority = issuingAuthority,
        _fullName = fullName,
        _geographicValidity = geographicValidity,
        _issuingCountryIso = issuingCountryIso,
        _multipleEntries = multipleEntries,
        _numberOfEntries = numberOfEntries,
        _passportNumber = passportNumber,
        _validFrom = validFrom,
        _validUntil = validUntil,
        _visaNumber = visaNumber,
        _visaType = visaType,
        _foilNumber = foilNumber;

  factory VisaDetails.fromJSON(Map<String, dynamic> json) {
    final applicationStatusJson = json['applicationStatus'] as String?;
    final applicationStatus =
        applicationStatusJson != null ? ApplicationStatusDeserializer.fromJSON(applicationStatusJson) : null;

    final dateOfIssue =
        json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue'] as Map<String, dynamic>) : null;
    final validFrom = json['validFrom'] != null ? DateResult.fromJSON(json['validFrom'] as Map<String, dynamic>) : null;
    final validUntil =
        json['validUntil'] != null ? DateResult.fromJSON(json['validUntil'] as Map<String, dynamic>) : null;

    return VisaDetails._(
      applicationStatus: applicationStatus,
      dateOfIssue: dateOfIssue,
      durationInDays: json['durationInDays'] as int?,
      issuingAuthority: json['issuingAuthority'] as String?,
      fullName: json['fullName'] as String?,
      geographicValidity: json['geographicValidity'] as String?,
      issuingCountryIso: json['issuingCountryIso'] as String?,
      multipleEntries: json['multipleEntries'] as bool?,
      numberOfEntries: json['numberOfEntries'] as int?,
      passportNumber: json['passportNumber'] as String?,
      validFrom: validFrom,
      validUntil: validUntil,
      visaNumber: json['visaNumber'] as String?,
      visaType: json['visaType'] as String?,
      foilNumber: json['foilNumber'] as String?,
    );
  }

  ApplicationStatus? get applicationStatus => _applicationStatus;

  DateResult? get dateOfIssue => _dateOfIssue;

  int? get durationInDays => _durationInDays;

  String? get issuingAuthority => _issuingAuthority;

  String? get fullName => _fullName;

  String? get geographicValidity => _geographicValidity;

  String? get issuingCountryIso => _issuingCountryIso;

  bool? get multipleEntries => _multipleEntries;

  int? get numberOfEntries => _numberOfEntries;

  String? get passportNumber => _passportNumber;

  DateResult? get validFrom => _validFrom;

  DateResult? get validUntil => _validUntil;

  String? get visaNumber => _visaNumber;

  String? get visaType => _visaType;

  String? get foilNumber => _foilNumber;
}
