/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';

import 'date_result.dart';

@immutable
class UsUniformedServicesBarcodeResult {
  final int _version;
  final String _sponsorFlag;
  final int _personDesignatorDocument;
  final int _familySequenceNumber;
  final int _deersDependentSuffixCode;
  final String _deersDependentSuffixDescription;
  final int _height;
  final int _weight;
  final String _hairColor;
  final String _eyeColor;
  final String _directCareFlagCode;
  final String _directCareFlagDescription;
  final String _civilianHealthCareFlagCode;
  final String _civilianHealthCareFlagDescription;
  final String _commissaryFlagCode;
  final String _commissaryFlagDescription;
  final String _mwrFlagCode;
  final String _mwrFlagDescription;
  final String _exchangeFlagCode;
  final String _exchangeFlagDescription;
  final DateResult? _champusEffectiveDate;
  final DateResult? _champusExpiryDate;
  final String _formNumber;
  final String _securityCode;
  final String _serviceCode;
  final String _statusCode;
  final String _statusCodeDescription;
  final String _branchOfService;
  final String _rank;
  final String? _payGrade;
  final String? _sponsorName;
  final int? _sponsorPersonDesignatorIdentifier;
  final String? _relationshipCode;
  final String? _relationshipDescription;
  final String? _jpegData;
  final String? _genevaConventionCategory;
  final String? _bloodType;

  UsUniformedServicesBarcodeResult._(
      this._version,
      this._sponsorFlag,
      this._personDesignatorDocument,
      this._familySequenceNumber,
      this._deersDependentSuffixCode,
      this._deersDependentSuffixDescription,
      this._height,
      this._weight,
      this._hairColor,
      this._eyeColor,
      this._directCareFlagCode,
      this._directCareFlagDescription,
      this._civilianHealthCareFlagCode,
      this._civilianHealthCareFlagDescription,
      this._commissaryFlagCode,
      this._commissaryFlagDescription,
      this._mwrFlagCode,
      this._mwrFlagDescription,
      this._exchangeFlagCode,
      this._exchangeFlagDescription,
      this._champusEffectiveDate,
      this._champusExpiryDate,
      this._formNumber,
      this._securityCode,
      this._serviceCode,
      this._statusCode,
      this._statusCodeDescription,
      this._branchOfService,
      this._rank,
      this._payGrade,
      this._sponsorName,
      this._sponsorPersonDesignatorIdentifier,
      this._relationshipCode,
      this._relationshipDescription,
      this._jpegData,
      this._genevaConventionCategory,
      this._bloodType);

  factory UsUniformedServicesBarcodeResult.fromJSON(Map<String, dynamic> json) {
    DateResult? champusEffectiveDate;
    if (json.containsKey("champusEffectiveDate") && json["champusEffectiveDate"] != null) {
      champusEffectiveDate = DateResult.fromJSON(json["champusEffectiveDate"] as Map<String, dynamic>);
    }

    DateResult? champusExpiryDate;
    if (json.containsKey("champusExpiryDate") && json["champusExpiryDate"] != null) {
      champusExpiryDate = DateResult.fromJSON(json["champusExpiryDate"] as Map<String, dynamic>);
    }

    return UsUniformedServicesBarcodeResult._(
        json["version"] as int,
        json["sponsorFlag"] as String,
        json["personDesignatorDocument"] as int,
        json["familySequenceNumber"] as int,
        json["deersDependentSuffixCode"] as int,
        json["deersDependentSuffixDescription"] as String,
        json["height"] as int,
        json["weight"] as int,
        json["hairColor"] as String,
        json["eyeColor"] as String,
        json["directCareFlagCode"] as String,
        json["directCareFlagDescription"] as String,
        json["civilianHealthCareFlagCode"] as String,
        json["civilianHealthCareFlagDescription"] as String,
        json["commissaryFlagCode"] as String,
        json["commissaryFlagDescription"] as String,
        json["mwrFlagCode"] as String,
        json["mwrFlagDescription"] as String,
        json["exchangeFlagCode"] as String,
        json["exchangeFlagDescription"] as String,
        champusEffectiveDate,
        champusExpiryDate,
        json["formNumber"] as String,
        json["securityCode"] as String,
        json["serviceCode"] as String,
        json["statusCode"] as String,
        json["statusCodeDescription"] as String,
        json["branchOfService"] as String,
        json["rank"] as String,
        json["payGrade"] as String?,
        json["sponsorName"] as String?,
        json["sponsorPersonDesignatorIdentifier"] as int?,
        json["relationshipCode"] as String?,
        json["relationshipDescription"] as String?,
        json["jpegData"] as String?,
        json["genevaConventionCategory"] as String?,
        json["bloodType"] as String?);
  }

  int get version {
    return _version;
  }

  String get sponsorFlag {
    return _sponsorFlag;
  }

  int get personDesignatorDocument {
    return _personDesignatorDocument;
  }

  int get familySequenceNumber {
    return _familySequenceNumber;
  }

  int get deersDependentSuffixCode {
    return _deersDependentSuffixCode;
  }

  String get deersDependentSuffixDescription {
    return _deersDependentSuffixDescription;
  }

  int get height {
    return _height;
  }

  int get weight {
    return _weight;
  }

  String get hairColor {
    return _hairColor;
  }

  String get eyeColor {
    return _eyeColor;
  }

  String get directCareFlagCode {
    return _directCareFlagCode;
  }

  String get directCareFlagDescription {
    return _directCareFlagDescription;
  }

  String get civilianHealthCareFlagCode {
    return _civilianHealthCareFlagCode;
  }

  String get civilianHealthCareFlagDescription {
    return _civilianHealthCareFlagDescription;
  }

  String get commissaryFlagCode {
    return _commissaryFlagCode;
  }

  String get commissaryFlagDescription {
    return _commissaryFlagDescription;
  }

  String get mwrFlagCode {
    return _mwrFlagCode;
  }

  String get mwrFlagDescription {
    return _mwrFlagDescription;
  }

  String get exchangeFlagCode {
    return _exchangeFlagCode;
  }

  String get exchangeFlagDescription {
    return _exchangeFlagDescription;
  }

  DateResult? get champusEffectiveDate {
    return _champusEffectiveDate;
  }

  DateResult? get champusExpiryDate {
    return _champusExpiryDate;
  }

  String get formNumber {
    return _formNumber;
  }

  String get securityCode {
    return _securityCode;
  }

  String get serviceCode {
    return _serviceCode;
  }

  String get statusCode {
    return _statusCode;
  }

  String get statusCodeDescription {
    return _statusCodeDescription;
  }

  String get branchOfService {
    return _branchOfService;
  }

  String get rank {
    return _rank;
  }

  String? get payGrade {
    return _payGrade;
  }

  String? get sponsorName {
    return _sponsorName;
  }

  int? get sponsorPersonDesignatorIdentifier {
    return _sponsorPersonDesignatorIdentifier;
  }

  String? get relationshipCode {
    return _relationshipCode;
  }

  String? get relationshipDescription {
    return _relationshipDescription;
  }

  String? get jpegData {
    return _jpegData;
  }

  String? get genevaConventionCategory {
    return _genevaConventionCategory;
  }

  String? get bloodType {
    return _bloodType;
  }
}
