/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'date_result.dart';
import 'passport_type.dart';

import 'package:flutter/foundation.dart';

/// This class represents data extracted from a Machine Readable Zone (MRZ). It consolidates information from MRZs that comply with the Machine Readable Travel Documents ICAO standard, as well as various MRZ-like formats supported by the library. Some properties may not apply to certain document types and will be set to nil if the corresponding data is not encoded in the MRZ. For a complete list of supported MRZ types, refer to supported documents.
///
/// The ID Capture mode supports all versions of Machine Readable Travel Documents (MRTD) specified by the International Civil Aviation Organization (ICAO).The ICAO specifies four types of MRTDs:[TD1 - ID cards](https://www.icao.int/sites/default/files/publications/DocSeries/9303_p5_cons_en.pdf) (id cards)[TD2 - other official travel documents](https://www.icao.int/sites/default/files/publications/DocSeries/9303_p6_cons_en.pdf) (other official travel documents)[TD3/MRP - passports](https://www.icao.int/sites/default/files/publications/DocSeries/9303_p4_cons_en.pdf) (passports)[MRV (A & B type) - visas](https://www.icao.int/sites/default/files/publications/DocSeries/9303_p7_cons_en.pdf) (visas)In addition, the ID Capture mode supports the following non-ICAO standards:SwissDL - Swiss driving license[TD2/FrenchID - French ID](https://en.wikipedia.org/wiki/National_identity_card_(France)) (French identity card)Use the following regex pattern to filter out MRTD codes:TypeRegexTD1 Regex Pattern([A-Z0-9<]{30}\n?){3}TD2 Regex Pattern([A-Z0-9<]{36}\n?){2}TD2 French Regex PatternSame as TD2 Regex PatternTD3 Regex Pattern([A-Z0-9<]{44}\n?){2}MRV_A Regex PatternSame as TD2 Regex PatternMRV_B Regex PatternSame as TD3 Regex PatternSwiss Driving License Regex Pattern[A-Z0-9<]{9}\n([A-Z0-9<]{30}\n?){2}
///
/// Added in version 6.11.0
@immutable
class MrzResult {
  final String _documentCode;
  final bool _namesAreTruncated;
  final String? _optionalDataInLine1;
  final String? _optionalDataInLine2;
  final String? _capturedMrz;
  final String? _personalIdNumber;
  final int? _renewalTimes;
  final String? _fullNameSimplifiedChinese;
  final int? _omittedCharacterCountInGbkName;
  final int? _omittedNameCount;
  final String? _issuingAuthorityCode;
  final String? _passportIssuerIso;
  final String? _passportNumber;
  final DateResult? _passportDateOfExpiry;
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
  final String? _visaNumber;
  final int? _visaNumberOfEntries;
  final bool? _visaMultipleEntries;
  final int? _visaDurationInDays;
  final PassportType? _passportType;

  const MrzResult._({
    required String documentCode,
    required bool namesAreTruncated,
    required String? optionalDataInLine1,
    required String? optionalDataInLine2,
    required String? capturedMrz,
    required String? personalIdNumber,
    required int? renewalTimes,
    required String? fullNameSimplifiedChinese,
    required int? omittedCharacterCountInGbkName,
    required int? omittedNameCount,
    required String? issuingAuthorityCode,
    required String? passportIssuerIso,
    required String? passportNumber,
    required DateResult? passportDateOfExpiry,
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
    required String? visaNumber,
    required int? visaNumberOfEntries,
    required bool? visaMultipleEntries,
    required int? visaDurationInDays,
    required PassportType? passportType,
  })  : _documentCode = documentCode,
        _namesAreTruncated = namesAreTruncated,
        _optionalDataInLine1 = optionalDataInLine1,
        _optionalDataInLine2 = optionalDataInLine2,
        _capturedMrz = capturedMrz,
        _personalIdNumber = personalIdNumber,
        _renewalTimes = renewalTimes,
        _fullNameSimplifiedChinese = fullNameSimplifiedChinese,
        _omittedCharacterCountInGbkName = omittedCharacterCountInGbkName,
        _omittedNameCount = omittedNameCount,
        _issuingAuthorityCode = issuingAuthorityCode,
        _passportIssuerIso = passportIssuerIso,
        _passportNumber = passportNumber,
        _passportDateOfExpiry = passportDateOfExpiry,
        _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _sex = sex,
        _dateOfBirth = dateOfBirth,
        _nationality = nationality,
        _address = address,
        _documentNumber = documentNumber,
        _dateOfExpiry = dateOfExpiry,
        _dateOfIssue = dateOfIssue,
        _visaNumber = visaNumber,
        _visaNumberOfEntries = visaNumberOfEntries,
        _visaMultipleEntries = visaMultipleEntries,
        _visaDurationInDays = visaDurationInDays,
        _passportType = passportType;

  factory MrzResult.fromJSON(Map<String, dynamic> json) {
    DateResult? passportDateOfExpiry;
    if (json.containsKey("passportDateOfExpiry") && json["passportDateOfExpiry"] != null) {
      passportDateOfExpiry = DateResult.fromJSON(json["passportDateOfExpiry"] as Map<String, dynamic>);
    }

    PassportType? passportType;
    if (json["passportType"] != null) {
      passportType = PassportTypeDeserializer.fromJSON(json["passportType"] as String);
    }

    final firstName = json['firstName']?.toString();
    final lastName = json['lastName']?.toString();
    final fullName = json['fullName']?.toString();
    final sex = json['sex']?.toString();
    final dateOfBirth = json['dateOfBirth'] != null ? DateResult.fromJSON(json['dateOfBirth']) : null;
    final nationality = json['nationality']?.toString();
    final address = json['address']?.toString();
    final documentNumber = json['documentNumber']?.toString();
    final dateOfExpiry = json['dateOfExpiry'] != null ? DateResult.fromJSON(json['dateOfExpiry']) : null;
    final dateOfIssue = json['dateOfIssue'] != null ? DateResult.fromJSON(json['dateOfIssue']) : null;
    return MrzResult._(
      documentCode: json['documentCode'] as String,
      namesAreTruncated: json['namesAreTruncated'] as bool,
      optionalDataInLine1: json['optionalDataInLine1'] as String?,
      optionalDataInLine2: json['optionalDataInLine2'] as String?,
      capturedMrz: json['capturedMrz'] as String?,
      personalIdNumber: json["personalIdNumber"] as String?,
      renewalTimes: json["renewalTimes"] as int?,
      fullNameSimplifiedChinese: json["fullNameSimplifiedChinese"] as String?,
      omittedCharacterCountInGbkName: json["omittedCharacterCountInGbkName"] as int?,
      omittedNameCount: json["omittedNameCount"] as int?,
      issuingAuthorityCode: json["issuingAuthorityCode"] as String?,
      passportIssuerIso: json["passportIssuerIso"] as String?,
      passportNumber: json["passportNumber"] as String?,
      passportDateOfExpiry: passportDateOfExpiry,
      firstName: firstName,
      lastName: lastName,
      fullName: fullName,
      sex: sex,
      dateOfBirth: dateOfBirth,
      nationality: nationality,
      address: address,
      documentNumber: documentNumber,
      dateOfExpiry: dateOfExpiry,
      dateOfIssue: dateOfIssue,
      visaNumber: json['visaNumber'] as String?,
      visaNumberOfEntries: json['visaNumberOfEntries'] as int?,
      visaMultipleEntries: json['visaMultipleEntries'] as bool?,
      visaDurationInDays: json['visaDurationInDays'] as int?,
      passportType: passportType,
    );
  }

  /// The document type code. One of the following values:
  ///
  /// P[passport type id] - indicates a passport,ID - indicates an id card,CA - indicates a Canada permanent resident card.CP - indicates a Asia-Pacific Economic Cooperation Business Travel CardCS - indicates an Exit-Entry Permit for Travelling to and from Hong Kong and Macau (往来港澳通行证);CD - indicates an Exit-Entry Permit for Travelling to and from Taiwan (往来台灣通行证).CR - indicates a Mainland Travel Permit for Hong Kong & Macau Residents.CT - indicates a Mainland Travel Permit for Taiwan Residents.
  ///
  /// Added in version 6.11.0
  String get documentCode {
    return _documentCode;
  }

  /// Indicates whether first or last name is truncated. For more information please refer to the [official specification](https://www.icao.int/sites/default/files/publications/DocSeries/9303_p5_cons_en.pdf).
  ///
  /// Added in version 6.11.0
  bool get namesAreTruncated {
    return _namesAreTruncated;
  }

  /// Optional data field from line 1 of the MRZ, for use of the issuing country or the organization.
  ///
  /// For TD-1 documents (such as ID cards), this contains the optional data from the first line. For other document types, this field may be null if no optional data is present on the first line.
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 7.6.0
  String? get optionalDataInLine1 {
    return _optionalDataInLine1;
  }

  /// Optional data field from line 2 of the MRZ, for use of the issuing country or the organization.
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 7.6.0
  String? get optionalDataInLine2 {
    return _optionalDataInLine2;
  }

  /// The full MRZ text as it appears on a document.
  ///
  /// If [IdCaptureSettings.anonymizationMode] is enabled for the field results, the returned value might be *null* for certain documents.
  ///
  /// Added in version 6.11.0
  String? get capturedMrz {
    return _capturedMrz;
  }

  /// The personal ID Number of the document holder.
  ///
  /// Added in version 7.0.0
  String? get personalIdNumber {
    return _personalIdNumber;
  }

  /// The number of times the document has been renewed.
  ///
  /// Added in version 7.0.0
  int? get renewalTimes {
    return _renewalTimes;
  }

  /// The holder’s name in Simplified Chinese characters.
  ///
  /// Added in version 7.0.0
  String? get fullNameSimplifiedChinese {
    return _fullNameSimplifiedChinese;
  }

  /// The number of Chinese characters omitted in in GBK (a character encoding for Simplified Chinese characters used in the People’s Republic of China) name.
  ///
  /// Added in version 7.0.0
  int? get omittedCharacterCountInGbkName {
    return _omittedCharacterCountInGbkName;
  }

  /// The number of names that couldn’t be displayed in the MRZ.
  ///
  /// Added in version 7.0.0
  int? get omittedNameCount {
    return _omittedNameCount;
  }

  /// The code of the authority that issued this document.
  ///
  /// Added in version 7.0.0
  String? get issuingAuthorityCode {
    return _issuingAuthorityCode;
  }

  /// The ISO code of the issuing jurisdiction.
  ///
  /// Added in version 7.0.0
  String? get passportIssuerIso {
    return _passportIssuerIso;
  }

  /// The passport number of the document holder.
  ///
  /// Added in version 7.0.0
  String? get passportNumber {
    return _passportNumber;
  }

  /// The expiry date of the holder’s passport.
  ///
  /// Added in version 7.0.0
  DateResult? get passportDateOfExpiry {
    return _passportDateOfExpiry;
  }

  /// The first name of the document holder. Certain documents do not distinguish between given name and surname. If the name cannot be split reliably, this field may be null.
  ///
  /// Added in version 8.0.0
  String? get firstName => _firstName;
  /// The last name of the document holder. Certain documents do not distinguish between given name and surname. If the name cannot be split reliably, this field may be null.
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
  /// The visa number, populated when a per-country rule maps it from the MRZ.
  ///
  /// Added in version 8.7.0
  String? get visaNumber => _visaNumber;
  /// The number of entries the visa permits, parsed on a best-effort basis from optional data in line 2.
  ///
  /// Added in version 8.7.0
  int? get visaNumberOfEntries => _visaNumberOfEntries;
  /// Whether the visa permits multiple entries, parsed on a best-effort basis from optional data in line 2.
  ///
  /// Added in version 8.7.0
  bool? get visaMultipleEntries => _visaMultipleEntries;
  /// The duration of stay in days the visa permits, parsed on a best-effort basis from optional data in line 2.
  ///
  /// Added in version 8.7.0
  int? get visaDurationInDays => _visaDurationInDays;
  /// Sub-category of a passport derived from the MRZ document code.
  ///
  /// Added in version 8.7.0
  PassportType? get passportType => _passportType;
}
