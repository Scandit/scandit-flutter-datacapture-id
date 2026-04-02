/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

enum RegionSpecificSubtype {
  usBorderCrossingCard('usBorderCrossingCard'),
  chinaExitEntryPermit('chinaExitEntryPermit'),
  usGlobalEntryCard('usGlobalEntryCard'),
  chinaMainlandTravelPermitTaiwan('chinaMainlandTravelPermitTaiwan'),
  usNexusCard('usNexusCard'),
  chinaMainlandTravelPermitHongKongMacau('chinaMainlandTravelPermitHongKongMacau'),
  apecBusinessTravelCard('apecBusinessTravelCard'),
  pakistanAfghanCitizenCard('pakistanAfghanCitizenCard'),
  singaporeFinCard('singaporeFinCard'),
  usGreenCard('usGreenCard'),
  malaysiaIkad('malaysiaIkad'),
  malaysiaMykad('malaysiaMykad'),
  malaysiaMypr('malaysiaMypr'),
  mexicoConsularVoterId('mexicoConsularVoterId'),
  germanyEid('germanyEid'),
  usCommonAccessCard('usCommonAccessCard'),
  philippinesMultipurposeId('philippinesMultipurposeId'),
  malaysiaMykas('malaysiaMykas'),
  malaysiaMykid('malaysiaMykid'),
  malaysiaMytentera('malaysiaMytentera'),
  mexicoProfessionalId('mexicoProfessionalId'),
  malaysiaRefugeeId('malaysiaRefugeeId'),
  canadaTribalId('canadaTribalId'),
  usUniformedServicesId('usUniformedServicesId'),
  usVeteranId('usVeteranId'),
  philippinesWorkPermit('philippinesWorkPermit'),
  singaporeWorkPermit('singaporeWorkPermit'),
  usWorkPermit('usWorkPermit'),
  philippinesSocialSecurityCard('philippinesSocialSecurityCard'),
  swedenSocialSecurityCard('swedenSocialSecurityCard'),
  canadaSocialSecurityCard('canadaSocialSecurityCard'),
  usSocialSecurityCard('usSocialSecurityCard'),
  belgiumMinorsId('belgiumMinorsId'),
  colombiaMinorsId('colombiaMinorsId'),
  peruMinorsId('peruMinorsId'),
  boliviaMinorsId('boliviaMinorsId'),
  hungaryAddressCard('hungaryAddressCard'),
  ukAsylumRequest('ukAsylumRequest'),
  canadaCitizenshipCertificate('canadaCitizenshipCertificate'),
  singaporeEmploymentPass('singaporeEmploymentPass'),
  canadaMinorsPublicServicesCard('canadaMinorsPublicServicesCard'),
  malaysiaMypolis('malaysiaMypolis'),
  philippinesNbiClearance('philippinesNbiClearance'),
  indiaPanCard('indiaPanCard'),
  philippinesPostalId('philippinesPostalId'),
  pakistanProofOfRegistration('pakistanProofOfRegistration'),
  singaporeSPass('singaporeSPass'),
  swedenSisId('swedenSisId'),
  colombiaTemporaryProtectionPermit('colombiaTemporaryProtectionPermit'),
  usTwicCard('usTwicCard'),
  usWeaponPermit('usWeaponPermit'),
  canadaWeaponPermit('canadaWeaponPermit'),
  irelandPublicServicesCard('irelandPublicServicesCard'),
  canadaPublicServicesCard('canadaPublicServicesCard'),
  pakistanConsularId('pakistanConsularId'),
  guatemalaConsularId('guatemalaConsularId'),
  mexicoConsularId('mexicoConsularId'),
  philippinesTaxId('philippinesTaxId'),
  mexicoTaxId('mexicoTaxId'),
  chinaOneWayPermit('chinaOneWayPermit'),
  usMedicalMarijuanaCard('usMedicalMarijuanaCard'),
  usMunicipalId('usMunicipalId'),
  australiaAsicCard('australiaAsicCard'),
  uaeVehicleRegistrationCard('uaeVehicleRegistrationCard'),
  uaeEsaadCard('uaeEsaadCard'),
  ukMilitaryId('ukMilitaryId');

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
