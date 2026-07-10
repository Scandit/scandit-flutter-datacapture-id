/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2023- Scandit AG. All rights reserved.
 */

class CommonAccessCardBarcodeResult {
  final String _version;
  final int _personDesignatorDocument;
  final String _personDesignatorTypeCode;
  final String _ediPersonIdentifier;
  final String _personnelCategoryCode;
  final String _branchOfService;
  final String _personnelEntitlementConditionType;
  final String _rank;
  final String _payPlanCode;
  final String _payPlanGradeCode;
  final String _cardInstanceIdentifier;
  final String _personMiddleInitial;

  CommonAccessCardBarcodeResult._(
      this._version,
      this._personDesignatorDocument,
      this._personDesignatorTypeCode,
      this._ediPersonIdentifier,
      this._personnelCategoryCode,
      this._branchOfService,
      this._personnelEntitlementConditionType,
      this._rank,
      this._payPlanCode,
      this._payPlanGradeCode,
      this._cardInstanceIdentifier,
      this._personMiddleInitial);

  CommonAccessCardBarcodeResult.fromJSON(Map<String, dynamic> json)
      : this._(
            json['version'] as String,
            json['personDesignatorDocument'] as int,
            json['personDesignatorTypeCode'] as String,
            json['ediPersonIdentifier'] as String,
            json['personnelCategoryCode'] as String,
            json['branchOfService'] as String,
            json['personnelEntitlementConditionType'] as String,
            json['rank'] as String,
            json['payPlanCode'] as String,
            json['payPlanGradeCode'] as String,
            json['cardInstanceIdentifier'] as String,
            json['personMiddleInitial'] as String);

  String get version {
    return _version;
  }

  int get personDesignatorDocument {
    return _personDesignatorDocument;
  }

  String get personDesignatorTypeCode {
    return _personDesignatorTypeCode;
  }

  String get ediPersonIdentifier {
    return _ediPersonIdentifier;
  }

  String get personnelCategoryCode {
    return _personnelCategoryCode;
  }

  String get branchOfService {
    return _branchOfService;
  }

  String get personnelEntitlementConditionType {
    return _personnelEntitlementConditionType;
  }

  String get rank {
    return _rank;
  }

  String get payPlanCode {
    return _payPlanCode;
  }

  String get payPlanGradeCode {
    return _payPlanGradeCode;
  }

  String get cardInstanceIdentifier {
    return _cardInstanceIdentifier;
  }

  String get personMiddleInitial {
    return _personMiddleInitial;
  }
}
