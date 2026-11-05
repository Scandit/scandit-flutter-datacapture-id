/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

import 'package:scandit_flutter_datacapture_id/src/mobile_document_data_element.dart';

const _isoMdlNamespace = 'org.iso.18013.5.1';
const _aamvaNamespace = 'org.iso.18013.5.1.aamva';

/// Maps each data element to the namespace/field pair the native deserializer resolves it by.
///
/// Native keeps this table in `iso_mdoc_request_definition.cc` and turns the pair straight back
/// into the same enum, so one pair per element is enough — the EUDI PID namespace and its field
/// overrides only matter for the reverse (element to every pair) direction, which is not used here.
/// Sending the bare enum value instead makes the native side drop the element without an error.
const Map<MobileDocumentDataElement, Map<String, String>> _elementIdentifiers = {
  MobileDocumentDataElement.familyName: {'namespace': _isoMdlNamespace, 'field': 'family_name'},
  MobileDocumentDataElement.givenName: {'namespace': _isoMdlNamespace, 'field': 'given_name'},
  MobileDocumentDataElement.birthDate: {'namespace': _isoMdlNamespace, 'field': 'birth_date'},
  MobileDocumentDataElement.issueDate: {'namespace': _isoMdlNamespace, 'field': 'issue_date'},
  MobileDocumentDataElement.expiryDate: {'namespace': _isoMdlNamespace, 'field': 'expiry_date'},
  MobileDocumentDataElement.issuingCountry: {'namespace': _isoMdlNamespace, 'field': 'issuing_country'},
  MobileDocumentDataElement.issuingAuthority: {'namespace': _isoMdlNamespace, 'field': 'issuing_authority'},
  MobileDocumentDataElement.documentNumber: {'namespace': _isoMdlNamespace, 'field': 'document_number'},
  MobileDocumentDataElement.portrait: {'namespace': _isoMdlNamespace, 'field': 'portrait'},
  MobileDocumentDataElement.signatureUsualMark: {'namespace': _isoMdlNamespace, 'field': 'signature_usual_mark'},
  MobileDocumentDataElement.drivingPrivileges: {'namespace': _isoMdlNamespace, 'field': 'driving_privileges'},
  MobileDocumentDataElement.administrativeNumber: {'namespace': _isoMdlNamespace, 'field': 'administrative_number'},
  MobileDocumentDataElement.sexIso: {'namespace': _isoMdlNamespace, 'field': 'sex'},
  MobileDocumentDataElement.height: {'namespace': _isoMdlNamespace, 'field': 'height'},
  MobileDocumentDataElement.weight: {'namespace': _isoMdlNamespace, 'field': 'weight'},
  MobileDocumentDataElement.eyeColour: {'namespace': _isoMdlNamespace, 'field': 'eye_colour'},
  MobileDocumentDataElement.hairColour: {'namespace': _isoMdlNamespace, 'field': 'hair_colour'},
  MobileDocumentDataElement.birthPlace: {'namespace': _isoMdlNamespace, 'field': 'birth_place'},
  MobileDocumentDataElement.residentAddress: {'namespace': _isoMdlNamespace, 'field': 'resident_address'},
  MobileDocumentDataElement.issuingJurisdiction: {'namespace': _isoMdlNamespace, 'field': 'issuing_jurisdiction'},
  MobileDocumentDataElement.nationality: {'namespace': _isoMdlNamespace, 'field': 'nationality'},
  MobileDocumentDataElement.nameSuffix: {'namespace': _aamvaNamespace, 'field': 'name_suffix'},
  MobileDocumentDataElement.familyNameTruncation: {'namespace': _aamvaNamespace, 'field': 'family_name_truncation'},
  MobileDocumentDataElement.givenNameTruncation: {'namespace': _aamvaNamespace, 'field': 'given_name_truncation'},
  MobileDocumentDataElement.akaFamilyName: {'namespace': _aamvaNamespace, 'field': 'aka_family_name'},
  MobileDocumentDataElement.akaGivenName: {'namespace': _aamvaNamespace, 'field': 'aka_given_name'},
  MobileDocumentDataElement.akaSuffix: {'namespace': _aamvaNamespace, 'field': 'aka_suffix'},
  MobileDocumentDataElement.weightRange: {'namespace': _aamvaNamespace, 'field': 'weight_range'},
  MobileDocumentDataElement.raceEthnicity: {'namespace': _aamvaNamespace, 'field': 'race_ethnicity'},
  MobileDocumentDataElement.residentCounty: {'namespace': _aamvaNamespace, 'field': 'resident_county'},
  MobileDocumentDataElement.sexAamva: {'namespace': _aamvaNamespace, 'field': 'sex'},
  MobileDocumentDataElement.aamvaVersion: {'namespace': _aamvaNamespace, 'field': 'aamva_version'},
};

extension MobileDocumentDataElementSerialization on MobileDocumentDataElement {
  /// The namespace/field pair for this element, as the native deserializer expects it.
  Map<String, String> toJSON() {
    final identifier = _elementIdentifiers[this];
    if (identifier == null) {
      throw StateError('No namespace/field mapping for MobileDocumentDataElement.$this');
    }
    return identifier;
  }
}
