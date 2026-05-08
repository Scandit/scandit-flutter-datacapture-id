/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'captured_id.dart';
import 'function_names.dart';
import 'result/date_result.dart';

enum VizMrzComparisonCheckResult {
  passed('passed'),
  failed('failed'),
  skipped('skipped');

  const VizMrzComparisonCheckResult(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension VizMrzComparisonCheckResultDeserializer on VizMrzComparisonCheckResult {
  static VizMrzComparisonCheckResult fromJSON(String jsonValue) {
    return VizMrzComparisonCheckResult.values.firstWhere((element) => element.toString() == jsonValue);
  }
}

abstract class VizMrzComparisonCheck<T> {
  VizMrzComparisonCheckResult get checkResult;

  String get resultDescription;

  T? get mrzValue;

  T? get vizValue;
}

class VizMrzComparisonResult {
  final bool _checksPassed;
  final VizMrzComparisonCheck<String> _fullNamesMatch;
  final VizMrzComparisonCheck<String> _documentNumbersMatch;
  final VizMrzComparisonCheck<DateResult> _datesOfBirthMatch;
  final VizMrzComparisonCheck<DateResult> _datesOfExpiryMatch;
  final VizMrzComparisonCheck<String> _issuingCountryIsoMatch;
  final String _resultDescription;

  VizMrzComparisonResult._(this._checksPassed, this._fullNamesMatch, this._documentNumbersMatch,
      this._datesOfBirthMatch, this._datesOfExpiryMatch, this._issuingCountryIsoMatch, this._resultDescription);

  bool get checksPassed {
    return _checksPassed;
  }

  VizMrzComparisonCheck<String> get fullNamesMatch {
    return _fullNamesMatch;
  }

  VizMrzComparisonCheck<String> get documentNumbersMatch {
    return _documentNumbersMatch;
  }

  VizMrzComparisonCheck<DateResult> get datesOfBirthMatch {
    return _datesOfBirthMatch;
  }

  VizMrzComparisonCheck<DateResult> get datesOfExpiryMatch {
    return _datesOfExpiryMatch;
  }

  VizMrzComparisonCheck<String> get issuingCountryIsoMatch {
    return _issuingCountryIsoMatch;
  }

  String get resultDescription {
    return _resultDescription;
  }

  factory VizMrzComparisonResult.fromJSON(Map<String, dynamic> json) {
    return VizMrzComparisonResult._(
        json["checksPassed"] as bool,
        _StringComparisonCheck.fromJSON(json["fullNamesMatch"]),
        _StringComparisonCheck.fromJSON(json["documentNumbersMatch"]),
        _DateComparisonCheck.fromJSON(json["datesOfBirth"]),
        _DateComparisonCheck.fromJSON(json["datesOfExpiry"]),
        _StringComparisonCheck.fromJSON(json["issuingCountryIsoMatch"]),
        json["resultDescription"] as String);
  }
}

@immutable
class _StringComparisonCheck implements VizMrzComparisonCheck<String> {
  final VizMrzComparisonCheckResult _checkResult;
  final String? _mrzValue;
  final String _resultDescription;
  final String? _vizValue;

  _StringComparisonCheck._(this._checkResult, this._resultDescription, this._mrzValue, this._vizValue);

  factory _StringComparisonCheck.fromJSON(Map<String, dynamic> json) {
    String? aamvaBarcodeValue;
    if (json.containsKey("mrzValue")) {
      aamvaBarcodeValue = json["mrzValue"] as String?;
    }

    String? vizValue;
    if (json.containsKey("vizValue")) {
      vizValue = json["vizValue"] as String?;
    }

    return _StringComparisonCheck._(VizMrzComparisonCheckResultDeserializer.fromJSON(json["checkResult"] as String),
        json["resultDescription"] as String, aamvaBarcodeValue, vizValue);
  }

  @override
  VizMrzComparisonCheckResult get checkResult => _checkResult;

  @override
  String get resultDescription => _resultDescription;

  @override
  String? get vizValue => _vizValue;

  @override
  String? get mrzValue => _mrzValue;
}

@immutable
class _DateComparisonCheck implements VizMrzComparisonCheck<DateResult> {
  final VizMrzComparisonCheckResult _checkResult;
  final DateResult? _mrzValue;
  final String _resultDescription;
  final DateResult? _vizValue;

  _DateComparisonCheck._(this._checkResult, this._resultDescription, this._mrzValue, this._vizValue);

  factory _DateComparisonCheck.fromJSON(Map<String, dynamic> json) {
    DateResult? mrzValue;
    if (json.containsKey("mrzValue") && json["mrzValue"] != null) {
      mrzValue = DateResult.fromJSON(json["mrzValue"]);
    }

    DateResult? vizValue;
    if (json.containsKey("vizValue") && json["vizValue"] != null) {
      vizValue = DateResult.fromJSON(json["vizValue"]);
    }

    return _DateComparisonCheck._(VizMrzComparisonCheckResultDeserializer.fromJSON(json["checkResult"] as String),
        json["resultDescription"] as String, mrzValue, vizValue);
  }

  @override
  DateResult? get mrzValue => _mrzValue;

  @override
  VizMrzComparisonCheckResult get checkResult => _checkResult;

  @override
  String get resultDescription => _resultDescription;

  @override
  DateResult? get vizValue => _vizValue;
}

class VizMrzComparisonVerifier {
  final MethodChannel _methodChannel = MethodChannel(IdCaptureFunctionNames.methodsChannelName);

  VizMrzComparisonVerifier._();

  factory VizMrzComparisonVerifier.create() {
    return VizMrzComparisonVerifier._();
  }

  Future<VizMrzComparisonResult> verify(CapturedId capturedId) async {
    var encodedCapturedId = jsonEncode(capturedId.toMap());
    var result = await _methodChannel.invokeMethod(IdCaptureFunctionNames.vizMrzComparisonVerifier, encodedCapturedId);
    var jsonResult = jsonDecode(result);
    return VizMrzComparisonResult.fromJSON(jsonResult);
  }
}
