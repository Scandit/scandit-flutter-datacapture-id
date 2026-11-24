/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'id_capture_region.dart';
import 'region_specific_subtypes.dart';

/// Types associated with the document classes below
///
/// Added in version 7.0.0
enum IdCaptureDocumentType {
  /// ID card identification document. Associated with [IdCard].
  ///
  /// Added in version 7.0.0
  idCard('idCard'),
  /// Driver license identification document. Associated with [DriverLicense].
  ///
  /// Added in version 7.0.0
  driverLicense('driverLicense'),
  /// Passport identification document. Associated with [Passport].
  ///
  /// Added in version 7.0.0
  passport('passport'),
  /// Visa (ICAO) identification document. Associated with [VisaIcao].
  ///
  /// Added in version 7.0.0
  visaIcao('visaIcao'),
  /// Visa letter document. Associated with [VisaLetter] (experimental document type).
  ///
  /// Added in version 8.5.0
  visaLetter('visaLetter'),
  /// Region specific identification document. Associated with [RegionSpecific].
  ///
  /// Added in version 7.0.0
  regionSpecific('regionSpecific'),
  /// Residence Permit. Associated with [ResidencePermit].
  ///
  /// Added in version 7.0.0
  residencePermit('residencePermit'),
  /// Health insurance card. Associated with [HealthInsuranceCard].
  ///
  /// Added in version 7.0.0
  healthInsuranceCard('healthInsuranceCard');

  const IdCaptureDocumentType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdCaptureDocumentTypeDeserializer on IdCaptureDocumentType {
  static IdCaptureDocumentType fromJSON(String jsonValue) {
    return IdCaptureDocumentType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}

/// A category of documents, such as ID cards, driver’s licenses, or passports.
///
/// Added in version 7.0.0
abstract class IdCaptureDocument implements Serializable {
  final IdCaptureRegion _region;
  final IdCaptureDocumentType _documentType;

  IdCaptureDocument._(this._region, this._documentType);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  IdCaptureDocumentType get documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 7.0.0
  IdCaptureRegion get region;

  /// Indicates whether the document is of type [IdCard].
  ///
  /// Added in version 7.0.0
  bool get isIdCard => _documentType == IdCaptureDocumentType.idCard;

  /// Indicates whether the document is of type [DriverLicense].
  ///
  /// Added in version 7.0.0
  bool get isDriverLicense => _documentType == IdCaptureDocumentType.driverLicense;

  /// Indicates whether the document is of type [Passport].
  ///
  /// Added in version 7.0.0
  bool get isPassport => _documentType == IdCaptureDocumentType.passport;

  /// Indicates whether the document is of type [VisaIcao].
  ///
  /// Added in version 7.0.0
  bool get isVisaIcao => _documentType == IdCaptureDocumentType.visaIcao;

  /// Indicates whether the document is of type [VisaLetter].
  ///
  /// Added in version 8.5.0
  bool get isVisaLetter => _documentType == IdCaptureDocumentType.visaLetter;

  /// Indicates whether the document is of type [RegionSpecific].
  ///
  /// Added in version 7.0.0
  bool get isRegionSpecific => _documentType == IdCaptureDocumentType.regionSpecific;

  /// Indicates whether the document is of type [ResidencePermit].
  ///
  /// Added in version 7.0.0
  bool get isResidencePermit => _documentType == IdCaptureDocumentType.residencePermit;

  /// Indicates whether the document is of type [HealthInsuranceCard].
  ///
  /// Added in version 7.0.0
  bool get isHealthInsuranceCard => _documentType == IdCaptureDocumentType.healthInsuranceCard;

  @override
  Map<String, dynamic> toMap() {
    return {
      'region': _region.toString(),
      'documentType': _documentType.toString(),
    };
  }
}

/// A category of state-issued documents primarily designed to confirm a citizen’s identity, voting rights, or age. This category includes documents commonly referred to as ID Cards, Voting IDs, and Proof of Age Cards. It also encompasses Passport Cards issued by certain jurisdictions, which provide limited travel rights.
///
/// While other documents (e.g., driver’s licenses, passports, residence permits) may serve as identification in certain regions, they are not included in this category.
///
/// Added in version 7.0.0
class IdCard extends IdCaptureDocument {
  /// Creates a new [IdCard] instance.
  ///
  /// Added in version 7.0.0
  IdCard(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.idCard);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;
}

/// A category of documents that confirms the holder’s right to drive or operate vehicles.
///
/// Added in version 7.0.0
class DriverLicense extends IdCaptureDocument {
  /// Creates a new [DriverLicense] instance.
  ///
  /// Added in version 7.0.0
  DriverLicense(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.driverLicense);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;
}

/// A category of official government-issued documents that verify a person’s identity and nationality, enabling international travel.
///
/// Passport Cards and other documents used for regional travel are not included in this category.
///
/// Added in version 7.0.0
class Passport extends IdCaptureDocument {
  /// Creates a new [Passport] instance.
  ///
  /// Added in version 7.0.0
  Passport(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.passport);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;
}

/// A category of travel documents that temporarily permit a foreigner to enter, remain in, or leave the issuing jurisdiction. Only documents that comply with the ICAO Machine Readable Travel Document (MRTD) standard are included in this category.
///
/// This category does not include documents that grant similar privileges but do not adhere to the ICAO MRTD standard, such as the US Border Crossing Card or travel permits for autonomous regions like Hong Kong and Macao issued by China.
///
/// Added in version 7.0.0
class VisaIcao extends IdCaptureDocument {
  /// Creates a new [VisaIcao] instance.
  ///
  /// Added in version 7.0.0
  VisaIcao(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.visaIcao);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;
}

/// Visa document issued by an authority to enter, remain or leave a territory.
///
/// This document type is experimental and may be subject to change in the future. This document can only be used with a compliant license key. Please contact Scandit Support to enable this feature.
///
/// Added in version 8.5.0
class VisaLetter extends IdCaptureDocument {
  /// Creates a new [VisaLetter] instance.
  ///
  /// Added in version 8.5.0
  VisaLetter(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.visaLetter);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.5.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.5.0
  @override
  IdCaptureRegion get region => super._region;
}

/// A category of documents that do not fall into other established categories and lack a recognized international standard. These documents grant privileges or serve specific purposes within a particular region or jurisdiction, often related to local regulations or services.
///
/// Added in version 7.0.0
class RegionSpecific extends IdCaptureDocument {
  final RegionSpecificSubtype _subtype;

  /// Creates a new [RegionSpecific] instance.
  ///
  /// Added in version 7.0.0
  RegionSpecific(this._subtype) : super._(IdCaptureRegion.any, IdCaptureDocumentType.regionSpecific);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Enum [RegionSpecificSubtype] indicating the region-specific subtype associated with this instance.
  ///
  /// Added in version 7.0.0
  RegionSpecificSubtype get subtype => _subtype;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;

  @override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json['documentSubtype'] = _subtype.toString();
    return json;
  }
}

/// A category of documents issued to confirm the identity of non-citizens and their right to reside for an extended period within a given jurisdiction. These are sometimes referred to as Resident IDs or Alien IDs.
///
/// Added in version 7.0.0
class ResidencePermit extends IdCaptureDocument {
  /// Creates a new [ResidencePermit] instance.
  ///
  /// Added in version 7.0.0
  ResidencePermit(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.residencePermit);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;
}

/// A category of documents that provide proof of an individual’s health insurance coverage, typically issued by a health insurer or government agency.
///
/// Added in version 7.0.0
class HealthInsuranceCard extends IdCaptureDocument {
  /// Creates a new [HealthInsuranceCard] instance.
  ///
  /// Added in version 7.0.0
  HealthInsuranceCard(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.healthInsuranceCard);

  /// Enum [IdCaptureDocumentType] associated with this instance.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureDocumentType get documentType => _documentType;

  /// Specifies the region (e.g., country) where the document was issued.
  ///
  /// Added in version 8.2.0
  @override
  IdCaptureRegion get region => super._region;
}
