/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'id_capture_region.dart';
import 'region_specific_subtypes.dart';

enum IdCaptureDocumentType {
  idCard('idCard'),
  driverLicense('driverLicense'),
  passport('passport'),
  visaIcao('visaIcao'),
  regionSpecific('regionSpecific'),
  residencePermit('residencePermit'),
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

abstract class IdCaptureDocument implements Serializable {
  final IdCaptureRegion _region;
  final IdCaptureDocumentType _documentType;

  IdCaptureDocument._(this._region, this._documentType);

  IdCaptureRegion get region => _region;

  bool get isIdCard => _documentType == IdCaptureDocumentType.idCard;

  bool get isDriverLicense => _documentType == IdCaptureDocumentType.driverLicense;

  bool get isPassport => _documentType == IdCaptureDocumentType.passport;

  bool get isVisaIcao => _documentType == IdCaptureDocumentType.visaIcao;

  bool get isRegionSpecific => _documentType == IdCaptureDocumentType.regionSpecific;

  bool get isResidencePermit => _documentType == IdCaptureDocumentType.residencePermit;

  bool get isHealthInsuranceCard => _documentType == IdCaptureDocumentType.healthInsuranceCard;

  @override
  Map<String, dynamic> toMap() {
    return {
      'region': _region.toString(),
      'documentType': _documentType.toString(),
    };
  }
}

class IdCard extends IdCaptureDocument {
  IdCard(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.idCard);
}

class DriverLicense extends IdCaptureDocument {
  DriverLicense(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.driverLicense);
}

class Passport extends IdCaptureDocument {
  Passport(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.passport);
}

class VisaIcao extends IdCaptureDocument {
  VisaIcao(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.visaIcao);
}

class RegionSpecific extends IdCaptureDocument {
  final RegionSpecificSubtype _subtype;

  RegionSpecific(this._subtype) : super._(IdCaptureRegion.any, IdCaptureDocumentType.regionSpecific);

  RegionSpecificSubtype get subtype => _subtype;

  @override
  Map<String, dynamic> toMap() {
    var json = super.toMap();
    json['documentSubtype'] = _subtype.toString();
    return json;
  }
}

class ResidencePermit extends IdCaptureDocument {
  ResidencePermit(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.residencePermit);
}

class HealthInsuranceCard extends IdCaptureDocument {
  HealthInsuranceCard(IdCaptureRegion region) : super._(region, IdCaptureDocumentType.healthInsuranceCard);
}
