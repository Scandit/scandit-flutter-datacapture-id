/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'date_result.dart';
import 'professional_driving_permit.dart';
import 'vehicle_restriction.dart';

/// This class represents the data extracted from a document’s barcode. It aggregates information from various barcode types supported by the library. Some properties may not apply to certain document types and will be set to *null* if the corresponding data is not encoded in the barcode. For a complete overview of supported barcode types, refer to our supported documents.
///
/// Added in version 7.0.0
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
      // Serialized natively as "dictionary"; exposed publicly as barcodeDataElements.
      barcodeDataElements:
          (json['dictionary'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as String)) ?? {},
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

  /// The version level of the PDF417 barcode format. See the AAMVA DL/ID Card Design Standard for more details.
  ///
  /// Added in version 7.0.0
  int? get aamvaVersion => _aamvaVersion;
  /// Other family name by which cardholder is known.
  ///
  /// Added in version 7.0.0
  String? get aliasFamilyName => _aliasFamilyName;
  /// Other given name by which cardholder is known.
  ///
  /// Added in version 7.0.0
  String? get aliasGivenName => _aliasGivenName;
  /// Other suffix name by which cardholder is known.
  ///
  /// Added in version 7.0.0
  String? get aliasSuffixName => _aliasSuffixName;
  /// The blood type of the holder in the Rh system (A+, A-, B+, B-, O+, O-, AB+ or AB-).
  ///
  /// Added in version 7.0.0
  String? get bloodType => _bloodType;
  /// The holder’s branch of service.
  ///
  /// Added in version 7.0.0
  String? get branchOfService => _branchOfService;
  /// Machine-generated code that is used for security purposes.
  ///
  /// Added in version 7.0.0
  String? get cardInstanceIdentifier => _cardInstanceIdentifier;
  /// Card revision date.
  ///
  /// Added in version 7.0.0
  DateResult? get cardRevisionDate => _cardRevisionDate;
  /// Driving license categories.
  ///
  /// Added in version 7.0.0
  List<String> get categories => _categories;
  /// The CHAMPUS effective date.
  ///
  /// Added in version 7.0.0
  DateResult? get champusEffectiveDate => _champusEffectiveDate;
  /// The CHAMPUS expiration date.
  ///
  /// Added in version 7.0.0
  DateResult? get champusExpiryDate => _champusExpiryDate;
  /// Whether the holder is a citizen or a permanent resident.
  ///
  /// Added in version 7.0.0
  String? get citizenshipStatus => _citizenshipStatus;
  /// The code of the civilian health care privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get civilianHealthCareFlagCode => _civilianHealthCareFlagCode;
  /// The description of the civilian health care privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get civilianHealthCareFlagDescription => _civilianHealthCareFlagDescription;
  /// The code of the commissary privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get commissaryFlagCode => _commissaryFlagCode;
  /// The description of the commissary privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get commissaryFlagDescription => _commissaryFlagDescription;
  /// The human-readable name of the holder’s country of birth.
  ///
  /// Added in version 7.0.0
  String? get countryOfBirth => _countryOfBirth;
  /// The three-letter country code (ISO 3166-1) of the holder’s country of birth.
  ///
  /// Added in version 7.0.0
  String? get countryOfBirthIso => _countryOfBirthIso;
  /// The code of the relationship of a dependent to his or her sponsor.
  ///
  /// Added in version 7.0.0
  int? get deersDependentSuffixCode => _deersDependentSuffixCode;
  /// The description of the relationship of a dependent to his or her sponsor.
  ///
  /// Added in version 7.0.0
  String? get deersDependentSuffixDescription => _deersDependentSuffixDescription;
  /// The code of the direct care privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get directCareFlagCode => _directCareFlagCode;
  /// The description of the direct care privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get directCareFlagDescription => _directCareFlagDescription;
  /// Identifies if the document has been duplicated.
  ///
  /// Added in version 7.0.0
  String? get documentCopy => _documentCopy;
  /// The document discriminator number.
  ///
  /// Added in version 7.0.0
  String? get documentDiscriminatorNumber => _documentDiscriminatorNumber;
  /// The name prefix of the card holder.
  ///
  /// Added in version 7.0.0
  String? get driverNamePrefix => _driverNamePrefix;
  /// The name suffix of the card holder.
  ///
  /// Added in version 7.0.0
  String? get driverNameSuffix => _driverNameSuffix;
  /// The driver restriction codes. Empty array means that there is no restrictions. Number 1 stands for glasses/contact lenses. Number 2 stands for artificial limbs.
  ///
  /// Added in version 7.0.0
  List<int> get driverRestrictionCodes => _driverRestrictionCodes;
  /// The holder’s DEERS-assigned numeric identifier.
  ///
  /// Added in version 7.0.0
  String? get ediPersonIdentifier => _ediPersonIdentifier;
  /// The endorsement code.
  ///
  /// Added in version 7.0.0
  String? get endorsementsCode => _endorsementsCode;
  /// The code of the exchange privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get exchangeFlagCode => _exchangeFlagCode;
  /// The description of the exchange privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get exchangeFlagDescription => _exchangeFlagDescription;
  /// The holder’s eye color.
  ///
  /// Added in version 7.0.0
  String? get eyeColor => _eyeColor;
  /// Used to distinguish among sponsors who have the same SSN.
  ///
  /// Added in version 7.0.0
  int? get familySequenceNumber => _familySequenceNumber;
  /// The first name truncation. A code that indicates whether a field has been truncated (‘T’), has not been truncated (‘N’), unknown whether truncated (‘U’), or the information is not present in the document (*null*).
  ///
  /// Added in version 7.0.0
  String? get firstNameTruncation => _firstNameTruncation;
  /// The first name of the document holder. It doesn’t contain middle name(s).
  ///
  /// Added in version 7.0.0
  String? get firstNameWithoutMiddleName => _firstNameWithoutMiddleName;
  /// The form number.
  ///
  /// Added in version 7.0.0
  String? get formNumber => _formNumber;
  /// The sponsor’s appropriate Geneva Convention Category.
  ///
  /// Added in version 7.0.0
  String? get genevaConventionCategory => _genevaConventionCategory;
  /// The holder’s hair color.
  ///
  /// Added in version 7.0.0
  String? get hairColor => _hairColor;
  /// The height of the card holder in centimeters.
  ///
  /// Added in version 7.0.0
  int? get heightCm => _heightCm;
  /// The height of the card holder in inches.
  ///
  /// Added in version 7.0.0
  int? get heightInch => _heightInch;
  /// The Issuer Identification Number which uniquely identifies the issuing jurisdiction.
  ///
  /// Added in version 7.0.0
  String? get iIN => _iin;
  /// The identification type of the driver’s license.
  ///
  /// Added in version 7.0.0
  String? get identificationType => _identificationType;
  /// The human readable name of the issuing jurisdiction (for example: an issuing state, territory or federal district for USA, or an issuing province or territory for Canada).
  ///
  /// Added in version 7.0.0
  String? get issuingJurisdiction => _issuingJurisdiction;
  /// The ISO code of the issuing jurisdiction (for example: an issuing state, territory or federal district for USA, or an issuing province or territory for Canada).
  ///
  /// Added in version 7.0.0
  String? get issuingJurisdictionIso => _issuingJurisdictionIso;
  /// A compressed version of the photograph printed on the front of the card.
  ///
  /// Added in version 7.0.0
  String? get jpegData => _jpegData;
  /// The jurisdiction specific version number of the implementation.
  ///
  /// Added in version 7.0.0
  int? get jurisdictionVersion => _jurisdictionVersion;
  /// The last name truncation. A code that indicates whether a field has been truncated (‘T’), has not been truncated (‘N’), unknown whether truncated (‘U’), or the information is not present in the document (*null*).
  ///
  /// Added in version 7.0.0
  String? get lastNameTruncation => _lastNameTruncation;
  /// The name of the country, where the Driver’s License was issued.
  ///
  /// Added in version 7.0.0
  String? get licenseCountryOfIssue => _licenseCountryOfIssue;
  /// The middle name of the card holder.
  ///
  /// Added in version 7.0.0
  String? get middleName => _middleName;
  /// The middle name truncation. A code that indicates whether a field has been truncated (‘T’), has not been truncated (‘N’), unknown whether truncated (‘U’), or the information is not present in the document (*null*).
  ///
  /// Added in version 7.0.0
  String? get middleNameTruncation => _middleNameTruncation;
  /// The code of the Morale, Welfare & Recreation (MWR) privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get mwrFlagCode => _mwrFlagCode;
  /// The description of the Morale, Welfare & Recreation (MWR) privilege/benefit flag.
  ///
  /// Added in version 7.0.0
  String? get mwrFlagDescription => _mwrFlagDescription;
  /// The pay grade of the sponsor. Available since version 2.
  ///
  /// Added in version 7.0.0
  String? get payGrade => _payGrade;
  /// The holder’s pay plan code.
  ///
  /// Added in version 7.0.0
  String? get payPlanCode => _payPlanCode;
  /// The holder’s pay plan grade code.
  ///
  /// Added in version 7.0.0
  String? get payPlanGradeCode => _payPlanGradeCode;
  /// The person’s designator identifier (usually, the cardholder’s SSN).
  ///
  /// Added in version 7.0.0
  int? get personDesignatorDocument => _personDesignatorDocument;
  /// The card’s person designator type code.
  ///
  /// Added in version 7.0.0
  String? get personDesignatorTypeCode => _personDesignatorTypeCode;
  /// The holder’s middle name initial.
  ///
  /// Added in version 7.0.0
  String? get personMiddleInitial => _personMiddleInitial;
  /// The personal ID number of this Driver’s License holder.
  ///
  /// Added in version 7.0.0
  String? get personalIdNumber => _personalIdNumber;
  /// The kind of personal ID number used - “02” means the number of the South Africa ID card.
  ///
  /// Added in version 7.0.0
  String? get personalIdNumberType => _personalIdNumberType;
  /// The holder’s personnel category code.
  ///
  /// Added in version 7.0.0
  String? get personnelCategoryCode => _personnelCategoryCode;
  /// The holder’s personnel entitlement condition type code.
  ///
  /// Added in version 7.0.0
  String? get personnelEntitlementConditionType => _personnelEntitlementConditionType;
  /// The place of birth of the card holder.
  ///
  /// Added in version 7.0.0
  String? get placeOfBirth => _placeOfBirth;
  /// Whether the holder of this License is allowed to transport goods, dangerous goods or passengers for an income.
  ///
  /// Added in version 7.0.0
  ProfessionalDrivingPermit? get professionalDrivingPermit => _professionalDrivingPermit;
  /// The race of the card holder.
  ///
  /// Added in version 7.0.0
  String? get race => _race;
  /// The holder’s rank.
  ///
  /// Added in version 7.0.0
  String? get rank => _rank;
  /// The code of the dependent’s relationship to the sponsor.
  ///
  /// Added in version 7.0.0
  String? get relationshipCode => _relationshipCode;
  /// The description of the dependent’s relationship to the sponsor.
  ///
  /// Added in version 7.0.0
  String? get relationshipDescription => _relationshipDescription;
  /// The restriction code.
  ///
  /// Added in version 7.0.0
  String? get restrictionsCode => _restrictionsCode;
  /// The card security code.
  ///
  /// Added in version 7.0.0
  String? get securityCode => _securityCode;
  /// The service code.
  ///
  /// Added in version 7.0.0
  String? get serviceCode => _serviceCode;
  /// Indicates whether the card holder is sponsor or dependent.
  ///
  /// Added in version 7.0.0
  String? get sponsorFlag => _sponsorFlag;
  /// The name of the sponsor.
  ///
  /// Added in version 7.0.0
  String? get sponsorName => _sponsorName;
  /// The sponsor’s designator identifier (Usually, the cardholder’s SSN).
  ///
  /// Added in version 7.0.0
  int? get sponsorPersonDesignatorIdentifier => _sponsorPersonDesignatorIdentifier;
  /// The status of the sponsor.
  ///
  /// Added in version 7.0.0
  String? get statusCode => _statusCode;
  /// The description of the the code of the status of the sponsor.
  ///
  /// Added in version 7.0.0
  String? get statusCodeDescription => _statusCodeDescription;
  /// The vehicle classification.
  ///
  /// Added in version 7.0.0
  String? get vehicleClass => _vehicleClass;
  /// The categories of motor vehicles that the holder of this License is permitted to drive.
  ///
  /// Added in version 7.0.0
  List<VehicleRestriction> get vehicleRestrictions => _vehicleRestrictions;
  /// The version of the barcode.
  ///
  /// Added in version 7.0.0
  String? get version => _version;
  /// The weight of the card holder in kilograms.
  ///
  /// Added in version 7.0.0
  int? get weightKg => _weightKg;
  /// Thw weight of the card holder in pounds.
  ///
  /// Added in version 7.0.0
  int? get weightLbs => _weightLbs;
  /// Returns true if the document is a Real ID.
  ///
  /// Added in version 7.0.0
  bool? get isRealId => _isRealId;
  /// The mappings between all the barcode data element IDs and their values. The keys of this collection are the element IDs as defined in the AAMVA Driver License/Identification specification. For example, the specification defines a data element “Customer First Name” with the ID “DAC”. Therefore if a scanned barcode contains a string “DACMICHAEL”, then this collection will contain a mapping with “DAC” as the key and “MICHAEL” as the value. This collection contains all the data elements of the barcode - including those that are exposed also explicitly as fields of this class.
  ///
  /// See Barcode Data Elements for all the possible keys and their meaning.
  ///
  /// Added in version 7.0.0
  Map<String, String> get barcodeDataElements => _barcodeDataElements;
  /// The first name of the document holder.
  ///
  /// Added in version 8.0.0
  String? get firstName => _firstName;
  /// The last name of the document holder.
  ///
  /// Added in version 8.0.0
  String? get lastName => _lastName;
  /// The full name of the document holder.
  ///
  /// Added in version 8.0.0
  String? get fullName => _fullName;
  /// The sex of the document holder.
  ///
  /// Added in version 8.0.0
  String? get sex => _sex;
  /// The date of birth of the document holder.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfBirth => _dateOfBirth;
  /// The nationality of the document holder.
  ///
  /// Added in version 8.0.0
  String? get nationality => _nationality;
  /// The address of the document holder.
  ///
  /// Added in version 8.0.0
  String? get address => _address;
  /// The document number of the ID.
  ///
  /// Added in version 8.0.0
  String? get documentNumber => _documentNumber;
  /// The expiry date of the document.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfExpiry => _dateOfExpiry;
  /// The issue date of the document.
  ///
  /// Added in version 8.0.0
  DateResult? get dateOfIssue => _dateOfIssue;
}
