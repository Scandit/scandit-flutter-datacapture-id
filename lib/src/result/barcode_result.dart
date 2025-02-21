/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'date_result.dart';
import 'professional_driving_permit.dart';
import 'vehicle_restriction.dart';

class BarcodeResult {
  final int? _aamvaVersion;
  final String? _aliasFamilyName;
  final String? _aliasGivenName;
  final String? _aliasSuffixName;
  final String? _bloodType;
  final String? _branchOfService;
  final String? _cardInstanceIdentifier;
  final DateResult? _cardRevisionDate;
  final List<String> _categories;
  final DateResult? _champusEffectiveDate;
  final DateResult? _champusExpiryDate;
  final String? _citizenshipStatus;
  final String? _civilianHealthCareFlagCode;
  final String? _civilianHealthCareFlagDescription;
  final String? _commissaryFlagCode;
  final String? _commissaryFlagDescription;
  final String? _countryOfBirth;
  final String? _countryOfBirthIso;
  final int? _deersDependentSuffixCode;
  final String? _deersDependentSuffixDescription;
  final String? _directCareFlagCode;
  final String? _directCareFlagDescription;
  final String? _documentCopy;
  final String? _documentDiscriminatorNumber;
  final String? _driverNamePrefix;
  final String? _driverNameSuffix;
  final List<int> _driverRestrictionCodes;
  final String? _ediPersonIdentifier;
  final String? _endorsementsCode;
  final String? _exchangeFlagCode;
  final String? _exchangeFlagDescription;
  final String? _eyeColor;
  final int? _familySequenceNumber;
  final String? _firstNameTruncation;
  final String? _firstNameWithoutMiddleName;
  final String? _formNumber;
  final String? _genevaConventionCategory;
  final String? _hairColor;
  final int? _heightCm;
  final int? _heightInch;
  final String? _iin;
  final String? _identificationType;
  final String? _issuingJurisdiction;
  final String? _issuingJurisdictionIso;
  final String? _jpegData;
  final int? _jurisdictionVersion;
  final String? _lastNameTruncation;
  final String? _licenseCountryOfIssue;
  final String? _middleName;
  final String? _middleNameTruncation;
  final String? _mwrFlagCode;
  final String? _mwrFlagDescription;
  final String? _payGrade;
  final String? _payPlanCode;
  final String? _payPlanGradeCode;
  final int? _personDesignatorDocument;
  final String? _personDesignatorTypeCode;
  final String? _personMiddleInitial;
  final String? _personalIdNumber;
  final String? _personalIdNumberType;
  final String? _personnelCategoryCode;
  final String? _personnelEntitlementConditionType;
  final String? _placeOfBirth;
  final ProfessionalDrivingPermit? _professionalDrivingPermit;
  final String? _race;
  final String? _rank;
  final String? _relationshipCode;
  final String? _relationshipDescription;
  final String? _restrictionsCode;
  final String? _securityCode;
  final String? _serviceCode;
  final String? _sponsorFlag;
  final String? _sponsorName;
  final int? _sponsorPersonDesignatorIdentifier;
  final String? _statusCode;
  final String? _statusCodeDescription;
  final String? _vehicleClass;
  final List<VehicleRestriction> _vehicleRestrictions;
  final String? _version;
  final int? _weightKg;
  final int? _weightLbs;
  final bool? _isRealId;
  final Map<String, String> _barcodeDataElements;

  BarcodeResult._(
    this._aamvaVersion,
    this._aliasFamilyName,
    this._aliasGivenName,
    this._aliasSuffixName,
    this._bloodType,
    this._branchOfService,
    this._cardInstanceIdentifier,
    this._cardRevisionDate,
    this._categories,
    this._champusEffectiveDate,
    this._champusExpiryDate,
    this._citizenshipStatus,
    this._civilianHealthCareFlagCode,
    this._civilianHealthCareFlagDescription,
    this._commissaryFlagCode,
    this._commissaryFlagDescription,
    this._countryOfBirth,
    this._countryOfBirthIso,
    this._deersDependentSuffixCode,
    this._deersDependentSuffixDescription,
    this._directCareFlagCode,
    this._directCareFlagDescription,
    this._documentCopy,
    this._documentDiscriminatorNumber,
    this._driverNamePrefix,
    this._driverNameSuffix,
    this._driverRestrictionCodes,
    this._ediPersonIdentifier,
    this._endorsementsCode,
    this._exchangeFlagCode,
    this._exchangeFlagDescription,
    this._eyeColor,
    this._familySequenceNumber,
    this._firstNameTruncation,
    this._firstNameWithoutMiddleName,
    this._formNumber,
    this._genevaConventionCategory,
    this._hairColor,
    this._heightCm,
    this._heightInch,
    this._iin,
    this._identificationType,
    this._issuingJurisdiction,
    this._issuingJurisdictionIso,
    this._jpegData,
    this._jurisdictionVersion,
    this._lastNameTruncation,
    this._licenseCountryOfIssue,
    this._middleName,
    this._middleNameTruncation,
    this._mwrFlagCode,
    this._mwrFlagDescription,
    this._payGrade,
    this._payPlanCode,
    this._payPlanGradeCode,
    this._personDesignatorDocument,
    this._personDesignatorTypeCode,
    this._personMiddleInitial,
    this._personalIdNumber,
    this._personalIdNumberType,
    this._personnelCategoryCode,
    this._personnelEntitlementConditionType,
    this._placeOfBirth,
    this._professionalDrivingPermit,
    this._race,
    this._rank,
    this._relationshipCode,
    this._relationshipDescription,
    this._restrictionsCode,
    this._securityCode,
    this._serviceCode,
    this._sponsorFlag,
    this._sponsorName,
    this._sponsorPersonDesignatorIdentifier,
    this._statusCode,
    this._statusCodeDescription,
    this._vehicleClass,
    this._vehicleRestrictions,
    this._version,
    this._weightKg,
    this._weightLbs,
    this._isRealId,
    this._barcodeDataElements,
  );

  BarcodeResult.fromJSON(Map<String, dynamic> json)
      : this._(
          json['aamvaVersion'] as int?,
          json['aliasFamilyName'] as String?,
          json['aliasGivenName'] as String?,
          json['aliasSuffixName'] as String?,
          json['bloodType'] as String?,
          json['branchOfService'] as String?,
          json['cardInstanceIdentifier'] as String?,
          json['cardRevisionDate'] != null ? DateResult.fromJSON(json['cardRevisionDate']) : null,
          (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList() ?? List.empty(),
          json['champusEffectiveDate'] != null ? DateResult.fromJSON(json['champusEffectiveDate']) : null,
          json['champusExpiryDate'] != null ? DateResult.fromJSON(json['champusExpiryDate']) : null,
          json['citizenshipStatus'] as String?,
          json['civilianHealthCareFlagCode'] as String?,
          json['civilianHealthCareFlagDescription'] as String?,
          json['commissaryFlagCode'] as String?,
          json['commissaryFlagDescription'] as String?,
          json['countryOfBirth'] as String?,
          json['countryOfBirthIso'] as String?,
          json['deersDependentSuffixCode'] as int?,
          json['deersDependentSuffixDescription'] as String?,
          json['directCareFlagCode'] as String?,
          json['directCareFlagDescription'] as String?,
          json['documentCopy'] as String?,
          json['documentDiscriminatorNumber'] as String?,
          json['driverNamePrefix'] as String?,
          json['driverNameSuffix'] as String?,
          (json['driverRestrictionCodes'] as List<dynamic>?)?.cast<int>().toList() ?? List.empty(),
          json['ediPersonIdentifier'] as String?,
          json['endorsementsCode'] as String?,
          json['exchangeFlagCode'] as String?,
          json['exchangeFlagDescription'] as String?,
          json['eyeColor'] as String?,
          json['familySequenceNumber'] as int?,
          json['firstNameTruncation'] as String?,
          json['firstNameWithoutMiddleName'] as String?,
          json['formNumber'] as String?,
          json['genevaConventionCategory'] as String?,
          json['hairColor'] as String?,
          json['heightCm'] as int?,
          json['heightInch'] as int?,
          json['iin'] as String?,
          json['identificationType'] as String?,
          json['issuingJurisdiction'] as String?,
          json['issuingJurisdictionIso'] as String?,
          json['jpegData'] as String?,
          json['jurisdictionVersion'] as int?,
          json['lastNameTruncation'] as String?,
          json['licenseCountryOfIssue'] as String?,
          json['middleName'] as String?,
          json['middleNameTruncation'] as String?,
          json['mwrFlagCode'] as String?,
          json['mwrFlagDescription'] as String?,
          json['payGrade'] as String?,
          json['payPlanCode'] as String?,
          json['payPlanGradeCode'] as String?,
          json['personDesignatorDocument'] as int?,
          json['personDesignatorTypeCode'] as String?,
          json['personMiddleInitial'] as String?,
          json['personalIdNumber'] as String?,
          json['personalIdNumberType'] as String?,
          json['personnelCategoryCode'] as String?,
          json['personnelEntitlementConditionType'] as String?,
          json['placeOfBirth'] as String?,
          json['professionalDrivingPermit'] != null
              ? ProfessionalDrivingPermit.fromJSON(json['professionalDrivingPermit'])
              : null,
          json['race'] as String?,
          json['rank'] as String?,
          json['relationshipCode'] as String?,
          json['relationshipDescription'] as String?,
          json['restrictionsCode'] as String?,
          json['securityCode'] as String?,
          json['serviceCode'] as String?,
          json['sponsorFlag'] as String?,
          json['sponsorName'] as String?,
          json['sponsorPersonDesignatorIdentifier'] as int?,
          json['statusCode'] as String?,
          json['statusCodeDescription'] as String?,
          json['vehicleClass'] as String?,
          (json['vehicleRestrictions'] as List<dynamic>?)?.map((e) => VehicleRestriction.fromJSON(e)).toList() ??
              List.empty(),
          json['version'] as String?,
          json['weightKg'] as int?,
          json['weightLbs'] as int?,
          json['isRealId'] as bool?,
          (json['barcodeDataElements'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as String)) ??
              {},
        );

  int? get aamvaVersion => _aamvaVersion;
  String? get aliasFamilyName => _aliasFamilyName;
  String? get aliasGivenName => _aliasGivenName;
  String? get aliasSuffixName => _aliasSuffixName;
  String? get bloodType => _bloodType;
  String? get branchOfService => _branchOfService;
  String? get cardInstanceIdentifier => _cardInstanceIdentifier;
  DateResult? get cardRevisionDate => _cardRevisionDate;
  List<String> get categories => _categories;
  DateResult? get champusEffectiveDate => _champusEffectiveDate;
  DateResult? get champusExpiryDate => _champusExpiryDate;
  String? get citizenshipStatus => _citizenshipStatus;
  String? get civilianHealthCareFlagCode => _civilianHealthCareFlagCode;
  String? get civilianHealthCareFlagDescription => _civilianHealthCareFlagDescription;
  String? get commissaryFlagCode => _commissaryFlagCode;
  String? get commissaryFlagDescription => _commissaryFlagDescription;
  String? get countryOfBirth => _countryOfBirth;
  String? get countryOfBirthIso => _countryOfBirthIso;
  int? get deersDependentSuffixCode => _deersDependentSuffixCode;
  String? get deersDependentSuffixDescription => _deersDependentSuffixDescription;
  String? get directCareFlagCode => _directCareFlagCode;
  String? get directCareFlagDescription => _directCareFlagDescription;
  String? get documentCopy => _documentCopy;
  String? get documentDiscriminatorNumber => _documentDiscriminatorNumber;
  String? get driverNamePrefix => _driverNamePrefix;
  String? get driverNameSuffix => _driverNameSuffix;
  List<int> get driverRestrictionCodes => _driverRestrictionCodes;
  String? get ediPersonIdentifier => _ediPersonIdentifier;
  String? get endorsementsCode => _endorsementsCode;
  String? get exchangeFlagCode => _exchangeFlagCode;
  String? get exchangeFlagDescription => _exchangeFlagDescription;
  String? get eyeColor => _eyeColor;
  int? get familySequenceNumber => _familySequenceNumber;
  String? get firstNameTruncation => _firstNameTruncation;
  String? get firstNameWithoutMiddleName => _firstNameWithoutMiddleName;
  String? get formNumber => _formNumber;
  String? get genevaConventionCategory => _genevaConventionCategory;
  String? get hairColor => _hairColor;
  int? get heightCm => _heightCm;
  int? get heightInch => _heightInch;
  String? get iIN => _iin;
  String? get identificationType => _identificationType;
  String? get issuingJurisdiction => _issuingJurisdiction;
  String? get issuingJurisdictionIso => _issuingJurisdictionIso;
  String? get jpegData => _jpegData;
  int? get jurisdictionVersion => _jurisdictionVersion;
  String? get lastNameTruncation => _lastNameTruncation;
  String? get licenseCountryOfIssue => _licenseCountryOfIssue;
  String? get middleName => _middleName;
  String? get middleNameTruncation => _middleNameTruncation;
  String? get mwrFlagCode => _mwrFlagCode;
  String? get mwrFlagDescription => _mwrFlagDescription;
  String? get payGrade => _payGrade;
  String? get payPlanCode => _payPlanCode;
  String? get payPlanGradeCode => _payPlanGradeCode;
  int? get personDesignatorDocument => _personDesignatorDocument;
  String? get personDesignatorTypeCode => _personDesignatorTypeCode;
  String? get personMiddleInitial => _personMiddleInitial;
  String? get personalIdNumber => _personalIdNumber;
  String? get personalIdNumberType => _personalIdNumberType;
  String? get personnelCategoryCode => _personnelCategoryCode;
  String? get personnelEntitlementConditionType => _personnelEntitlementConditionType;
  String? get placeOfBirth => _placeOfBirth;
  ProfessionalDrivingPermit? get professionalDrivingPermit => _professionalDrivingPermit;
  String? get race => _race;
  String? get rank => _rank;
  String? get relationshipCode => _relationshipCode;
  String? get relationshipDescription => _relationshipDescription;
  String? get restrictionsCode => _restrictionsCode;
  String? get securityCode => _securityCode;
  String? get serviceCode => _serviceCode;
  String? get sponsorFlag => _sponsorFlag;
  String? get sponsorName => _sponsorName;
  int? get sponsorPersonDesignatorIdentifier => _sponsorPersonDesignatorIdentifier;
  String? get statusCode => _statusCode;
  String? get statusCodeDescription => _statusCodeDescription;
  String? get vehicleClass => _vehicleClass;
  List<VehicleRestriction> get vehicleRestrictions => _vehicleRestrictions;
  String? get version => _version;
  int? get weightKg => _weightKg;
  int? get weightLbs => _weightLbs;
  bool? get isRealId => _isRealId;
  Map<String, String> get barcodeDataElements => _barcodeDataElements;
}
