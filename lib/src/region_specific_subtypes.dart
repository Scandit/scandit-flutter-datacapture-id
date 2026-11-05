/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

/// An enumeration that identifies specific types of Region Specific documents. These documents are tailored to fulfill unique roles or comply with local regulations within a particular region or jurisdiction. Examples include the APEC Business Travel Card, China Exit-Entry Permit, and Germany eID. Each subtype helps differentiate these documents based on their purpose and regional usage.
///
/// Added in version 7.0.0
enum RegionSpecificSubtype {
  /// US Border Crossing Card.
  ///
  /// Added in version 7.0.0
  usBorderCrossingCard('usBorderCrossingCard'),
  /// China Exit Entry Permit.
  ///
  /// Added in version 7.0.0
  chinaExitEntryPermit('chinaExitEntryPermit'),
  /// US Global Entry Card.
  ///
  /// Added in version 7.0.0
  usGlobalEntryCard('usGlobalEntryCard'),
  /// China Mainland Travel Permit Taiwan.
  ///
  /// Added in version 7.0.0
  chinaMainlandTravelPermitTaiwan('chinaMainlandTravelPermitTaiwan'),
  /// US Nexus Card.
  ///
  /// Added in version 7.0.0
  usNexusCard('usNexusCard'),
  /// China Mainland Travel Permit Hong Kong Macau.
  ///
  /// Added in version 7.0.0
  chinaMainlandTravelPermitHongKongMacau('chinaMainlandTravelPermitHongKongMacau'),
  /// Apec Business Travel Card.
  ///
  /// Added in version 7.0.0
  apecBusinessTravelCard('apecBusinessTravelCard'),
  /// Pakistan Afghan Citizen Card.
  ///
  /// Added in version 7.0.0
  pakistanAfghanCitizenCard('pakistanAfghanCitizenCard'),
  /// Singapore Fin Card.
  ///
  /// Added in version 7.0.0
  singaporeFinCard('singaporeFinCard'),
  /// Malaysia Ikad.
  ///
  /// Added in version 7.0.0
  malaysiaIkad('malaysiaIkad'),
  /// Malaysia Mykad.
  ///
  /// Added in version 7.0.0
  malaysiaMykad('malaysiaMykad'),
  /// Malaysia Mypr.
  ///
  /// Added in version 7.0.0
  malaysiaMypr('malaysiaMypr'),
  /// Mexico Consular Voter Id.
  ///
  /// Added in version 7.0.0
  mexicoConsularVoterId('mexicoConsularVoterId'),
  /// Germany Eid.
  ///
  /// Added in version 7.0.0
  germanyEid('germanyEid'),
  /// US Common Access Card.
  ///
  /// Added in version 7.0.0
  usCommonAccessCard('usCommonAccessCard'),
  /// Philippines Multipurpose Id.
  ///
  /// Added in version 7.0.0
  philippinesMultipurposeId('philippinesMultipurposeId'),
  /// Malaysia Mykas.
  ///
  /// Added in version 7.0.0
  malaysiaMykas('malaysiaMykas'),
  /// Malaysia Mykid.
  ///
  /// Added in version 7.0.0
  malaysiaMykid('malaysiaMykid'),
  /// Malaysia Mytentera.
  ///
  /// Added in version 7.0.0
  malaysiaMytentera('malaysiaMytentera'),
  /// Mexico Professional Id.
  ///
  /// Added in version 7.0.0
  mexicoProfessionalId('mexicoProfessionalId'),
  /// Malaysia Refugee Id.
  ///
  /// Added in version 7.0.0
  malaysiaRefugeeId('malaysiaRefugeeId'),
  /// Canada Tribal Id.
  ///
  /// Added in version 7.0.0
  canadaTribalId('canadaTribalId'),
  /// US Uniformed Services Id.
  ///
  /// Added in version 7.0.0
  usUniformedServicesId('usUniformedServicesId'),
  /// US Veteran Id.
  ///
  /// Added in version 7.0.0
  usVeteranId('usVeteranId'),
  /// Philippines Work Permit.
  ///
  /// Added in version 7.0.0
  philippinesWorkPermit('philippinesWorkPermit'),
  /// Singapore Work Permit.
  ///
  /// Added in version 7.0.0
  singaporeWorkPermit('singaporeWorkPermit'),
  /// US Work Permit.
  ///
  /// Added in version 7.0.0
  usWorkPermit('usWorkPermit'),
  /// Philippines Social Security Card.
  ///
  /// Added in version 7.0.0
  philippinesSocialSecurityCard('philippinesSocialSecurityCard'),
  /// Sweden Social Security Card.
  ///
  /// Added in version 7.0.0
  swedenSocialSecurityCard('swedenSocialSecurityCard'),
  /// Canada Social Security Card.
  ///
  /// Added in version 7.0.0
  canadaSocialSecurityCard('canadaSocialSecurityCard'),
  /// US Social Security Card.
  ///
  /// Added in version 7.0.0
  usSocialSecurityCard('usSocialSecurityCard'),
  /// Belgium Minors Id.
  ///
  /// Added in version 7.0.0
  belgiumMinorsId('belgiumMinorsId'),
  /// Colombia Minors Id.
  ///
  /// Added in version 7.0.0
  colombiaMinorsId('colombiaMinorsId'),
  /// Peru Minors Id.
  ///
  /// Added in version 7.0.0
  peruMinorsId('peruMinorsId'),
  /// Bolivia Minors Id.
  ///
  /// Added in version 7.0.0
  boliviaMinorsId('boliviaMinorsId'),
  /// Hungary Address Card.
  ///
  /// Added in version 7.0.0
  hungaryAddressCard('hungaryAddressCard'),
  /// Uk Asylum Request.
  ///
  /// Added in version 7.0.0
  ukAsylumRequest('ukAsylumRequest'),
  /// Canada Citizenship Certificate.
  ///
  /// Added in version 7.0.0
  canadaCitizenshipCertificate('canadaCitizenshipCertificate'),
  /// Singapore Employment Pass.
  ///
  /// Added in version 7.0.0
  singaporeEmploymentPass('singaporeEmploymentPass'),
  /// Canada Minors Public Services Card.
  ///
  /// Added in version 7.0.0
  canadaMinorsPublicServicesCard('canadaMinorsPublicServicesCard'),
  /// Malaysia Mypolis.
  ///
  /// Added in version 7.0.0
  malaysiaMypolis('malaysiaMypolis'),
  /// Philippines Nbi Clearance.
  ///
  /// Added in version 7.0.0
  philippinesNbiClearance('philippinesNbiClearance'),
  /// India Pan Card.
  ///
  /// Added in version 7.0.0
  indiaPanCard('indiaPanCard'),
  /// Philippines Postal Id.
  ///
  /// Added in version 7.0.0
  philippinesPostalId('philippinesPostalId'),
  /// Pakistan Proof Of Registration.
  ///
  /// Added in version 7.0.0
  pakistanProofOfRegistration('pakistanProofOfRegistration'),
  /// Singapore S Pass.
  ///
  /// Added in version 7.0.0
  singaporeSPass('singaporeSPass'),
  /// Sweden Sis Id.
  ///
  /// Added in version 7.0.0
  swedenSisId('swedenSisId'),
  /// Colombia Temporary Protection Permit.
  ///
  /// Added in version 7.0.0
  colombiaTemporaryProtectionPermit('colombiaTemporaryProtectionPermit'),
  /// US Twic Card.
  ///
  /// Added in version 7.0.0
  usTwicCard('usTwicCard'),
  /// US Weapon Permit.
  ///
  /// Added in version 7.0.0
  usWeaponPermit('usWeaponPermit'),
  /// Canada Weapon Permit.
  ///
  /// Added in version 7.0.0
  canadaWeaponPermit('canadaWeaponPermit'),
  /// Ireland Public Services Card.
  ///
  /// Added in version 7.0.0
  irelandPublicServicesCard('irelandPublicServicesCard'),
  /// Canada Public Services Card.
  ///
  /// Added in version 7.0.0
  canadaPublicServicesCard('canadaPublicServicesCard'),
  /// Pakistan Consular Id.
  ///
  /// Added in version 7.0.0
  pakistanConsularId('pakistanConsularId'),
  /// Guatemala Consular Id.
  ///
  /// Added in version 7.0.0
  guatemalaConsularId('guatemalaConsularId'),
  /// Mexico Consular Id.
  ///
  /// Added in version 7.0.0
  mexicoConsularId('mexicoConsularId'),
  /// Philippines Tax Id.
  ///
  /// Added in version 7.0.0
  philippinesTaxId('philippinesTaxId'),
  /// Mexico Tax Id.
  ///
  /// Added in version 7.0.0
  mexicoTaxId('mexicoTaxId'),
  /// China One Way Permit.
  ///
  /// Added in version 7.0.0
  chinaOneWayPermit('chinaOneWayPermit'),
  /// US Medical Marijuana Card.
  ///
  /// Added in version 7.0.0
  usMedicalMarijuanaCard('usMedicalMarijuanaCard'),
  /// US Municipal Id.
  ///
  /// Added in version 7.0.0
  usMunicipalId('usMunicipalId'),
  /// Australia Asic Card.
  ///
  /// Added in version 7.0.0
  australiaAsicCard('australiaAsicCard'),
  /// UAE Vehicle Registration Card.
  ///
  /// Added in version 7.0.0
  uaeVehicleRegistrationCard('uaeVehicleRegistrationCard'),
  /// UAE Esaad Card.
  ///
  /// Added in version 7.6.0
  uaeEsaadCard('uaeEsaadCard'),
  /// Uk Military Id.
  ///
  /// Added in version 7.6.0
  ukMilitaryId('ukMilitaryId'),
  /// China Business Travel Permit to HK/Macau.
  ///
  /// Added in version 8.5.0
  chinaBusinessTravelPermitHongKongMacau('chinaBusinessTravelPermitHongKongMacau'),
  /// Ireland Age Card.
  ///
  /// Added in version 8.5.0
  irelandAgeCard('irelandAgeCard');

  const RegionSpecificSubtype(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension RegionSpecificSubtypeDeserializer on RegionSpecificSubtype {
  static RegionSpecificSubtype fromJSON(String jsonValue) {
    return RegionSpecificSubtype.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
