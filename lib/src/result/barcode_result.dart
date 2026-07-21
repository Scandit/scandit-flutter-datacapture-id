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
  final String? _firstName;
  final String? _lastName;
  final String? _fullName;
  final String? _sex;
  final DateResult? _dateOfBirth;
  final String? _nationality;
  final String? _address;
  final String? _documentNumber;
  final DateResult? _dateOfExpiry;
  final DateResult? _dateOfIssue;

  const BarcodeResult._({
    required int? aamvaVersion,
    required String? aliasFamilyName,
    required String? aliasGivenName,
    required String? aliasSuffixName,
    required String? bloodType,
    required String? branchOfService,
    required String? cardInstanceIdentifier,
    required DateResult? cardRevisionDate,
    required List<String> categories,
    required DateResult? champusEffectiveDate,
    required DateResult? champusExpiryDate,
    required String? citizenshipStatus,
    required String? civilianHealthCareFlagCode,
    required String? civilianHealthCareFlagDescription,
    required String? commissaryFlagCode,
    required String? commissaryFlagDescription,
    required String? countryOfBirth,
    required String? countryOfBirthIso,
    required int? deersDependentSuffixCode,
    required String? deersDependentSuffixDescription,
    required String? directCareFlagCode,
    required String? directCareFlagDescription,
    required String? documentCopy,
    required String? documentDiscriminatorNumber,
    required String? driverNamePrefix,
    required String? driverNameSuffix,
    required List<int> driverRestrictionCodes,
    required String? ediPersonIdentifier,
    required String? endorsementsCode,
    required String? exchangeFlagCode,
    required String? exchangeFlagDescription,
    required String? eyeColor,
    required int? familySequenceNumber,
    required String? firstNameTruncation,
    required String? firstNameWithoutMiddleName,
    required String? formNumber,
    required String? genevaConventionCategory,
    required String? hairColor,
    required int? heightCm,
    required int? heightInch,
    required String? iin,
    required String? identificationType,
    required String? issuingJurisdiction,
    required String? issuingJurisdictionIso,
    required String? jpegData,
    required int? jurisdictionVersion,
    required String? lastNameTruncation,
    required String? licenseCountryOfIssue,
    required String? middleName,
    required String? middleNameTruncation,
    required String? mwrFlagCode,
    required String? mwrFlagDescription,
    required String? payGrade,
    required String? payPlanCode,
    required String? payPlanGradeCode,
    required int? personDesignatorDocument,
    required String? personDesignatorTypeCode,
    required String? personMiddleInitial,
    required String? personalIdNumber,
    required String? personalIdNumberType,
    required String? personnelCategoryCode,
    required String? personnelEntitlementConditionType,
    required String? placeOfBirth,
    required ProfessionalDrivingPermit? professionalDrivingPermit,
    required String? race,
    required String? rank,
    required String? relationshipCode,
    required String? relationshipDescription,
    required String? restrictionsCode,
    required String? securityCode,
    required String? serviceCode,
    required String? sponsorFlag,
    required String? sponsorName,
    required int? sponsorPersonDesignatorIdentifier,
    required String? statusCode,
    required String? statusCodeDescription,
    required String? vehicleClass,
    required List<VehicleRestriction> vehicleRestrictions,
    required String? version,
    required int? weightKg,
    required int? weightLbs,
    required bool? isRealId,
    required Map<String, String> barcodeDataElements,
    required String? firstName,
    required String? lastName,
    required String? fullName,
    required String? sex,
    required DateResult? dateOfBirth,
    required String? nationality,
    required String? address,
    required String? documentNumber,
    required DateResult? dateOfExpiry,
    required DateResult? dateOfIssue,
  })  : _aamvaVersion = aamvaVersion,
        _aliasFamilyName = aliasFamilyName,
        _aliasGivenName = aliasGivenName,
        _aliasSuffixName = aliasSuffixName,
        _bloodType = bloodType,
        _branchOfService = branchOfService,
        _cardInstanceIdentifier = cardInstanceIdentifier,
        _cardRevisionDate = cardRevisionDate,
        _categories = categories,
        _champusEffectiveDate = champusEffectiveDate,
        _champusExpiryDate = champusExpiryDate,
        _citizenshipStatus = citizenshipStatus,
        _civilianHealthCareFlagCode = civilianHealthCareFlagCode,
        _civilianHealthCareFlagDescription = civilianHealthCareFlagDescription,
        _commissaryFlagCode = commissaryFlagCode,
        _commissaryFlagDescription = commissaryFlagDescription,
        _countryOfBirth = countryOfBirth,
        _countryOfBirthIso = countryOfBirthIso,
        _deersDependentSuffixCode = deersDependentSuffixCode,
        _deersDependentSuffixDescription = deersDependentSuffixDescription,
        _directCareFlagCode = directCareFlagCode,
        _directCareFlagDescription = directCareFlagDescription,
        _documentCopy = documentCopy,
        _documentDiscriminatorNumber = documentDiscriminatorNumber,
        _driverNamePrefix = driverNamePrefix,
        _driverNameSuffix = driverNameSuffix,
        _driverRestrictionCodes = driverRestrictionCodes,
        _ediPersonIdentifier = ediPersonIdentifier,
        _endorsementsCode = endorsementsCode,
        _exchangeFlagCode = exchangeFlagCode,
        _exchangeFlagDescription = exchangeFlagDescription,
        _eyeColor = eyeColor,
        _familySequenceNumber = familySequenceNumber,
        _firstNameTruncation = firstNameTruncation,
        _firstNameWithoutMiddleName = firstNameWithoutMiddleName,
        _formNumber = formNumber,
        _genevaConventionCategory = genevaConventionCategory,
        _hairColor = hairColor,
        _heightCm = heightCm,
        _heightInch = heightInch,
        _iin = iin,
        _identificationType = identificationType,
        _issuingJurisdiction = issuingJurisdiction,
        _issuingJurisdictionIso = issuingJurisdictionIso,
        _jpegData = jpegData,
        _jurisdictionVersion = jurisdictionVersion,
        _lastNameTruncation = lastNameTruncation,
        _licenseCountryOfIssue = licenseCountryOfIssue,
        _middleName = middleName,
        _middleNameTruncation = middleNameTruncation,
        _mwrFlagCode = mwrFlagCode,
        _mwrFlagDescription = mwrFlagDescription,
        _payGrade = payGrade,
        _payPlanCode = payPlanCode,
        _payPlanGradeCode = payPlanGradeCode,
        _personDesignatorDocument = personDesignatorDocument,
        _personDesignatorTypeCode = personDesignatorTypeCode,
        _personMiddleInitial = personMiddleInitial,
        _personalIdNumber = personalIdNumber,
        _personalIdNumberType = personalIdNumberType,
        _personnelCategoryCode = personnelCategoryCode,
        _personnelEntitlementConditionType = personnelEntitlementConditionType,
        _placeOfBirth = placeOfBirth,
        _professionalDrivingPermit = professionalDrivingPermit,
        _race = race,
        _rank = rank,
        _relationshipCode = relationshipCode,
        _relationshipDescription = relationshipDescription,
        _restrictionsCode = restrictionsCode,
        _securityCode = securityCode,
        _serviceCode = serviceCode,
        _sponsorFlag = sponsorFlag,
        _sponsorName = sponsorName,
        _sponsorPersonDesignatorIdentifier = sponsorPersonDesignatorIdentifier,
        _statusCode = statusCode,
        _statusCodeDescription = statusCodeDescription,
        _vehicleClass = vehicleClass,
        _vehicleRestrictions = vehicleRestrictions,
        _version = version,
        _weightKg = weightKg,
        _weightLbs = weightLbs,
        _isRealId = isRealId,
        _barcodeDataElements = barcodeDataElements,
        _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _sex = sex,
        _dateOfBirth = dateOfBirth,
        _nationality = nationality,
        _address = address,
        _documentNumber = documentNumber,
        _dateOfExpiry = dateOfExpiry,
        _dateOfIssue = dateOfIssue;

  factory BarcodeResult.fromJSON(Map<String, dynamic> json) {
    return BarcodeResult._(
      aamvaVersion: json['aamvaVersion'] as int?,
      aliasFamilyName: json['aliasFamilyName'] as String?,
      aliasGivenName: json['aliasGivenName'] as String?,
      aliasSuffixName: json['aliasSuffixName'] as String?,
      bloodType: json['bloodType'] as String?,
      branchOfService: json['branchOfService'] as String?,
      cardInstanceIdentifier: json['cardInstanceIdentifier'] as String?,
      cardRevisionDate: json['cardRevisionDate'] != null ? DateResult.fromJSON(json['cardRevisionDate']) : null,
      categories: (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList() ?? List.empty(),
      champusEffectiveDate:
          json['champusEffectiveDate'] != null ? DateResult.fromJSON(json['champusEffectiveDate']) : null,
      champusExpiryDate: json['champusExpiryDate'] != null ? DateResult.fromJSON(json['champusExpiryDate']) : null,
      citizenshipStatus: json['citizenshipStatus'] as String?,
      civilianHealthCareFlagCode: json['civilianHealthCareFlagCode'] as String?,
      civilianHealthCareFlagDescription: json['civilianHealthCareFlagDescription'] as String?,
      commissaryFlagCode: json['commissaryFlagCode'] as String?,
      commissaryFlagDescription: json['commissaryFlagDescription'] as String?,
      countryOfBirth: json['countryOfBirth'] as String?,
      countryOfBirthIso: json['countryOfBirthIso'] as String?,
      deersDependentSuffixCode: json['deersDependentSuffixCode'] as int?,
      deersDependentSuffixDescription: json['deersDependentSuffixDescription'] as String?,
      directCareFlagCode: json['directCareFlagCode'] as String?,
      directCareFlagDescription: json['directCareFlagDescription'] as String?,
      documentCopy: json['documentCopy'] as String?,
      documentDiscriminatorNumber: json['documentDiscriminatorNumber'] as String?,
      driverNamePrefix: json['driverNamePrefix'] as String?,
      driverNameSuffix: json['driverNameSuffix'] as String?,
      driverRestrictionCodes: (json['driverRestrictionCodes'] as List<dynamic>?)?.cast<int>().toList() ?? List.empty(),
      ediPersonIdentifier: json['ediPersonIdentifier'] as String?,
      endorsementsCode: json['endorsementsCode'] as String?,
      exchangeFlagCode: json['exchangeFlagCode'] as String?,
      exchangeFlagDescription: json['exchangeFlagDescription'] as String?,
      eyeColor: json['eyeColor'] as String?,
      familySequenceNumber: json['familySequenceNumber'] as int?,
      firstNameTruncation: json['firstNameTruncation'] as String?,
      firstNameWithoutMiddleName: json['firstNameWithoutMiddleName'] as String?,
      formNumber: json['formNumber'] as String?,
      genevaConventionCategory: json['genevaConventionCategory'] as String?,
      hairColor: json['hairColor'] as String?,
      heightCm: json['heightCm'] as int?,
      heightInch: json['heightInch'] as int?,
      iin: json['iin'] as String?,
      identificationType: json['identificationType'] as String?,
      issuingJurisdiction: json['issuingJurisdiction'] as String?,
      issuingJurisdictionIso: json['issuingJurisdictionIso'] as String?,
      jpegData: json['jpegData'] as String?,
      jurisdictionVersion: json['jurisdictionVersion'] as int?,
      lastNameTruncation: json['lastNameTruncation'] as String?,
      licenseCountryOfIssue: json['licenseCountryOfIssue'] as String?,
      middleName: json['middleName'] as String?,
      middleNameTruncation: json['middleNameTruncation'] as String?,
      mwrFlagCode: json['mwrFlagCode'] as String?,
      mwrFlagDescription: json['mwrFlagDescription'] as String?,
      payGrade: json['payGrade'] as String?,
      payPlanCode: json['payPlanCode'] as String?,
      payPlanGradeCode: json['payPlanGradeCode'] as String?,
      personDesignatorDocument: json['personDesignatorDocument'] as int?,
      personDesignatorTypeCode: json['personDesignatorTypeCode'] as String?,
      personMiddleInitial: json['personMiddleInitial'] as String?,
      personalIdNumber: json['personalIdNumber'] as String?,
      personalIdNumberType: json['personalIdNumberType'] as String?,
      personnelCategoryCode: json['personnelCategoryCode'] as String?,
      personnelEntitlementConditionType: json['personnelEntitlementConditionType'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      professionalDrivingPermit: json['professionalDrivingPermit'] != null
          ? ProfessionalDrivingPermit.fromJSON(json['professionalDrivingPermit'])
          : null,
      race: json['race'] as String?,
      rank: json['rank'] as String?,
      relationshipCode: json['relationshipCode'] as String?,
      relationshipDescription: json['relationshipDescription'] as String?,
      restrictionsCode: json['restrictionsCode'] as String?,
      securityCode: json['securityCode'] as String?,
      serviceCode: json['serviceCode'] as String?,
      sponsorFlag: json['sponsorFlag'] as String?,
      sponsorName: json['sponsorName'] as String?,
      sponsorPersonDesignatorIdentifier: json['sponsorPersonDesignatorIdentifier'] as int?,
      statusCode: json['statusCode'] as String?,
      statusCodeDescription: json['statusCodeDescription'] as String?,
      vehicleClass: json['vehicleClass'] as String?,
      vehicleRestrictions:
          (json['vehicleRestrictions'] as List<dynamic>?)?.map((e) => VehicleRestriction.fromJSON(e)).toList() ??
              List.empty(),
      version: json['version'] as String?,
      weightKg: json['weightKg'] as int?,
      weightLbs: json['weightLbs'] as int?,
      isRealId: json['isRealId'] as bool?,
      barcodeDataElements:
          (json['barcodeDataElements'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as String)) ??
              {},
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      fullName: json['fullName']?.toString(),
      sex: json['sex']?.toString(),
      dateOfBirth: json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null,
      nationality: json['nationality']?.toString(),
      address: json['address']?.toString(),
      documentNumber: json['documentNumber']?.toString(),
      dateOfExpiry: json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null,
      dateOfIssue: json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null,
    );
  }

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
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get fullName => _fullName;
  String? get sex => _sex;
  DateResult? get dateOfBirth => _dateOfBirth;
  String? get nationality => _nationality;
  String? get address => _address;
  String? get documentNumber => _documentNumber;
  DateResult? get dateOfExpiry => _dateOfExpiry;
  DateResult? get dateOfIssue => _dateOfIssue;
}
