/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2022- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'date_result.dart';

enum ComparisonCheckResult {
  passed('passed'),
  failed('failed'),
  skipped('skipped');

  const ComparisonCheckResult(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension ComparisonCheckResultDeserializer on ComparisonCheckResult {
  static ComparisonCheckResult fromJSON(String jsonValue) {
    return ComparisonCheckResult.values.firstWhere((element) => element.toString() == jsonValue);
  }
}

abstract class ComparisonCheck<T> {
  ComparisonCheckResult get checkResult;
  String get resultDescription;
  T? get aamvaBarcodeValue;
  T? get vizValue;
}

@immutable
class _StringComparisonCheck implements ComparisonCheck<String> {
  final ComparisonCheckResult _checkResult;
  final String? _aamvaBarcodeValue;
  final String _resultDescription;
  final String? _vizValue;

  _StringComparisonCheck._(this._checkResult, this._resultDescription, this._aamvaBarcodeValue, this._vizValue);

  factory _StringComparisonCheck.fromJSON(Map<String, dynamic> json) {
    String? aamvaBarcodeValue;
    if (json.containsKey("aamvaBarcodeValue")) {
      aamvaBarcodeValue = json["aamvaBarcodeValue"] as String?;
    }

    String? vizValue;
    if (json.containsKey("vizValue")) {
      vizValue = json["vizValue"] as String?;
    }

    return _StringComparisonCheck._(ComparisonCheckResultDeserializer.fromJSON(json["checkResult"] as String),
        json["resultDescription"] as String, aamvaBarcodeValue, vizValue);
  }

  @override
  String? get aamvaBarcodeValue => _aamvaBarcodeValue;

  @override
  ComparisonCheckResult get checkResult => _checkResult;

  @override
  String get resultDescription => _resultDescription;

  @override
  String? get vizValue => _vizValue;
}

@immutable
class _DateComparisonCheck implements ComparisonCheck<DateResult> {
  final ComparisonCheckResult _checkResult;
  final DateResult? _aamvaBarcodeValue;
  final String _resultDescription;
  final DateResult? _vizValue;

  _DateComparisonCheck._(this._checkResult, this._resultDescription, this._aamvaBarcodeValue, this._vizValue);

  factory _DateComparisonCheck.fromJSON(Map<String, dynamic> json) {
    DateResult? aamvaBarcodeValue;
    if (json.containsKey("aamvaBarcodeValue") && json["aamvaBarcodeValue"] != null) {
      aamvaBarcodeValue = DateResult.fromJSON(json["aamvaBarcodeValue"]);
    }

    DateResult? vizValue;
    if (json.containsKey("vizValue") && json["vizValue"] != null) {
      vizValue = DateResult.fromJSON(json["vizValue"]);
    }

    return _DateComparisonCheck._(ComparisonCheckResultDeserializer.fromJSON(json["checkResult"] as String),
        json["resultDescription"] as String, aamvaBarcodeValue, vizValue);
  }

  @override
  DateResult? get aamvaBarcodeValue => _aamvaBarcodeValue;

  @override
  ComparisonCheckResult get checkResult => _checkResult;

  @override
  String get resultDescription => _resultDescription;

  @override
  DateResult? get vizValue => _vizValue;
}

@immutable
class AamvaVizBarcodeComparisonResult {
  final bool _checksPassed;
  final ComparisonCheck<String> _issuingCountryIsoMatch;
  final ComparisonCheck<String> _issuingJurisdictionIsoMatch;
  final ComparisonCheck<String> _documentNumbersMatch;
  final ComparisonCheck<String> _fullNamesMatch;
  final ComparisonCheck<DateResult> _datesOfBirthMatch;
  final ComparisonCheck<DateResult> _datesOfExpiryMatch;
  final ComparisonCheck<DateResult> _datesOfIssueMatch;
  final String? _frontMismatchImageBase64Encoded;
  final String _resultDescription;

  AamvaVizBarcodeComparisonResult._(
      this._checksPassed,
      this._resultDescription,
      this._issuingCountryIsoMatch,
      this._issuingJurisdictionIsoMatch,
      this._documentNumbersMatch,
      this._fullNamesMatch,
      this._datesOfBirthMatch,
      this._datesOfExpiryMatch,
      this._datesOfIssueMatch,
      this._frontMismatchImageBase64Encoded);

  bool get checksPassed => _checksPassed;

  ComparisonCheck<String> get issuingCountryIsoMatch => _issuingCountryIsoMatch;

  ComparisonCheck<String> get issuingJurisdictionIsoMatch => _issuingJurisdictionIsoMatch;

  ComparisonCheck<String> get documentNumbersMatch => _documentNumbersMatch;

  ComparisonCheck<String> get fullNamesMatch => _fullNamesMatch;

  ComparisonCheck<DateResult> get datesOfBirthMatch => _datesOfBirthMatch;

  ComparisonCheck<DateResult> get datesOfExpiryMatch => _datesOfExpiryMatch;

  ComparisonCheck<DateResult> get datesOfIssueMatch => _datesOfIssueMatch;

  String get resultDescription => _resultDescription;

  Image? get frontMismatchImage {
    final base64EncodedImage = _frontMismatchImageBase64Encoded;
    if (base64EncodedImage == null) return null;
    return Image.memory(base64Decode(base64EncodedImage));
  }

  factory AamvaVizBarcodeComparisonResult.fromJSON(Map<String, dynamic> json) {
    return AamvaVizBarcodeComparisonResult._(
        json["checksPassed"] as bool,
        json["resultDescription"] as String,
        _StringComparisonCheck.fromJSON(json["issuingCountryIsoMatch"]),
        _StringComparisonCheck.fromJSON(json["issuingJurisdictionIsoMatch"]),
        _StringComparisonCheck.fromJSON(json["documentNumbersMatch"]),
        _StringComparisonCheck.fromJSON(json["fullNamesMatch"]),
        _DateComparisonCheck.fromJSON(json["datesOfBirthMatch"]),
        _DateComparisonCheck.fromJSON(json["datesOfExpiryMatch"]),
        _DateComparisonCheck.fromJSON(json["datesOfIssueMatch"]),
        json["frontMismatchImage"] as String?);
  }
}
