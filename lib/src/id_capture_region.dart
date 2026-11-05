/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

/// Represents geographical regions associated with identification documents. This class is used to specify regions for various purposes, such as filtering captured documents or indicating where a document was issued. Regions include specific countries, broader areas and the generalized option “Any”.
///
/// Added in version 7.0.0
enum IdCaptureRegion {
  /// Any Region.
  ///
  /// Added in version 7.0.0
  any('any'),
  /// Any country contained in EU or Schengen Area, for simplicity this also includes the following states: [IdCaptureRegion.andorra], [IdCaptureRegion.monaco], [IdCaptureRegion.sanMarino], [IdCaptureRegion.holySee]. Note that this region does not include the [IdCaptureRegion.uk].
  ///
  /// Added in version 7.0.0
  euAndSchengen('euAndSchengen'),
  /// Aruba.
  ///
  /// Added in version 7.0.0
  aruba('aruba'),
  /// Afghanistan.
  ///
  /// Added in version 7.0.0
  afghanistan('afghanistan'),
  /// Angola.
  ///
  /// Added in version 7.0.0
  angola('angola'),
  /// Anguilla.
  ///
  /// Added in version 7.0.0
  anguilla('anguilla'),
  /// Åland Islands.
  ///
  /// Added in version 7.0.0
  alandIslands('alandIslands'),
  /// Albania.
  ///
  /// Added in version 7.0.0
  albania('albania'),
  /// Andorra.
  ///
  /// Added in version 7.0.0
  andorra('andorra'),
  /// United Arab Emirates.
  ///
  /// Added in version 7.0.0
  uae('uae'),
  /// Argentina.
  ///
  /// Added in version 7.0.0
  argentina('argentina'),
  /// Armenia.
  ///
  /// Added in version 7.0.0
  armenia('armenia'),
  /// American Samoa.
  ///
  /// Added in version 7.0.0
  americanSamoa('americanSamoa'),
  /// Antarctica.
  ///
  /// Added in version 7.0.0
  antarctica('antarctica'),
  /// French Southern Territories.
  ///
  /// Added in version 7.0.0
  frenchSouthernTerritories('frenchSouthernTerritories'),
  /// Antigua and Barbuda.
  ///
  /// Added in version 7.0.0
  antiguaAndBarbuda('antiguaAndBarbuda'),
  /// Australia.
  ///
  /// Added in version 7.0.0
  australia('australia'),
  /// Austria.
  ///
  /// Added in version 7.0.0
  austria('austria'),
  /// Azerbaijan.
  ///
  /// Added in version 7.0.0
  azerbaijan('azerbaijan'),
  /// Burundi.
  ///
  /// Added in version 7.0.0
  burundi('burundi'),
  /// Belgium.
  ///
  /// Added in version 7.0.0
  belgium('belgium'),
  /// Benin.
  ///
  /// Added in version 7.0.0
  benin('benin'),
  /// Bonaire, Sint Eustatius and Saba.
  ///
  /// Added in version 7.0.0
  bonaireSintEustatiusAndSaba('bonaireSintEustatiusAndSaba'),
  /// Burkina Faso.
  ///
  /// Added in version 7.0.0
  burkinaFaso('burkinaFaso'),
  /// Bangladesh.
  ///
  /// Added in version 7.0.0
  bangladesh('bangladesh'),
  /// Bulgaria.
  ///
  /// Added in version 7.0.0
  bulgaria('bulgaria'),
  /// Bahrain.
  ///
  /// Added in version 7.0.0
  bahrain('bahrain'),
  /// Bahamas.
  ///
  /// Added in version 7.0.0
  bahamas('bahamas'),
  /// Bosnia and Herzegovina.
  ///
  /// Added in version 7.0.0
  bosniaHerzegovina('bosniaHerzegovina'),
  /// Saint Barthélemy.
  ///
  /// Added in version 7.0.0
  saintBarthelemy('saintBarthelemy'),
  /// Belarus.
  ///
  /// Added in version 7.0.0
  belarus('belarus'),
  /// Belize.
  ///
  /// Added in version 7.0.0
  belize('belize'),
  /// Bermuda.
  ///
  /// Added in version 7.0.0
  bermuda('bermuda'),
  /// Bolivia, Plurinational State of.
  ///
  /// Added in version 7.0.0
  bolivia('bolivia'),
  /// Brazil.
  ///
  /// Added in version 7.0.0
  brazil('brazil'),
  /// Barbados.
  ///
  /// Added in version 7.0.0
  barbados('barbados'),
  /// Brunei Darussalam.
  ///
  /// Added in version 7.0.0
  bruneiDarussalam('bruneiDarussalam'),
  /// Bhutan.
  ///
  /// Added in version 7.0.0
  bhutan('bhutan'),
  /// Bouvet Island.
  ///
  /// Added in version 7.0.0
  bouvetIsland('bouvetIsland'),
  /// Botswana.
  ///
  /// Added in version 7.0.0
  botswana('botswana'),
  /// Central African Republic.
  ///
  /// Added in version 7.0.0
  car('car'),
  /// Canada.
  ///
  /// Added in version 7.0.0
  canada('canada'),
  /// Cocos (Keeling) Islands.
  ///
  /// Added in version 7.0.0
  cocosIslands('cocosIslands'),
  /// Switzerland.
  ///
  /// Added in version 7.0.0
  switzerland('switzerland'),
  /// Chile.
  ///
  /// Added in version 7.0.0
  chile('chile'),
  /// China.
  ///
  /// Added in version 7.0.0
  china('china'),
  /// Côte d’Ivoire.
  ///
  /// Added in version 7.0.0
  coteIvoire('coteIvoire'),
  /// Cameroon.
  ///
  /// Added in version 7.0.0
  cameroon('cameroon'),
  /// Democratic Republic of the Congo.
  ///
  /// Added in version 7.0.0
  democraticRepublicOfCongo('democraticRepublicOfCongo'),
  /// Congo.
  ///
  /// Added in version 7.0.0
  congo('congo'),
  /// Cook Islands.
  ///
  /// Added in version 7.0.0
  cookIslands('cookIslands'),
  /// Colombia.
  ///
  /// Added in version 7.0.0
  colombia('colombia'),
  /// Comoros.
  ///
  /// Added in version 7.0.0
  comoros('comoros'),
  /// Cabo Verde.
  ///
  /// Added in version 7.0.0
  caboVerde('caboVerde'),
  /// Costa Rica.
  ///
  /// Added in version 7.0.0
  costaRica('costaRica'),
  /// Cuba.
  ///
  /// Added in version 7.0.0
  cuba('cuba'),
  /// Curaçao.
  ///
  /// Added in version 7.0.0
  curacao('curacao'),
  /// Christmas Island.
  ///
  /// Added in version 7.0.0
  christmasIsland('christmasIsland'),
  /// Cayman Islands.
  ///
  /// Added in version 7.0.0
  caymanIslands('caymanIslands'),
  /// Cyprus.
  ///
  /// Added in version 7.0.0
  cyprus('cyprus'),
  /// Czechia.
  ///
  /// Added in version 7.0.0
  czechia('czechia'),
  /// Germany.
  ///
  /// Added in version 7.0.0
  germany('germany'),
  /// Djibouti.
  ///
  /// Added in version 7.0.0
  djibouti('djibouti'),
  /// Dominica.
  ///
  /// Added in version 7.0.0
  dominica('dominica'),
  /// Denmark.
  ///
  /// Added in version 7.0.0
  denmark('denmark'),
  /// Dominican Republic.
  ///
  /// Added in version 7.0.0
  dominicanRepublic('dominicanRepublic'),
  /// Algeria.
  ///
  /// Added in version 7.0.0
  algeria('algeria'),
  /// Ecuador.
  ///
  /// Added in version 7.0.0
  ecuador('ecuador'),
  /// Egypt.
  ///
  /// Added in version 7.0.0
  egypt('egypt'),
  /// Eritrea.
  ///
  /// Added in version 7.0.0
  eritrea('eritrea'),
  /// Western Sahara.
  ///
  /// Added in version 7.0.0
  westernSahara('westernSahara'),
  /// Spain.
  ///
  /// Added in version 7.0.0
  spain('spain'),
  /// Estonia.
  ///
  /// Added in version 7.0.0
  estonia('estonia'),
  /// Ethiopia.
  ///
  /// Added in version 7.0.0
  ethiopia('ethiopia'),
  /// Finland.
  ///
  /// Added in version 7.0.0
  finland('finland'),
  /// Fiji.
  ///
  /// Added in version 7.0.0
  fiji('fiji'),
  /// Falkland Islands (Malvinas).
  ///
  /// Added in version 7.0.0
  falklandIslands('falklandIslands'),
  /// France.
  ///
  /// Added in version 7.0.0
  france('france'),
  /// Faroe Islands.
  ///
  /// Added in version 7.0.0
  faroeIslands('faroeIslands'),
  /// Micronesia, Federated States of.
  ///
  /// Added in version 7.0.0
  micronesia('micronesia'),
  /// Gabon.
  ///
  /// Added in version 7.0.0
  gabon('gabon'),
  /// United Kingdom of Great Britain and Northern Ireland.
  ///
  /// Added in version 7.0.0
  uk('uk'),
  /// Georgia.
  ///
  /// Added in version 7.0.0
  georgia('georgia'),
  /// Guernsey.
  ///
  /// Added in version 7.0.0
  guernsey('guernsey'),
  /// Ghana.
  ///
  /// Added in version 7.0.0
  ghana('ghana'),
  /// Gibraltar.
  ///
  /// Added in version 7.0.0
  gibraltar('gibraltar'),
  /// Guinea.
  ///
  /// Added in version 7.0.0
  guinea('guinea'),
  /// Guadeloupe.
  ///
  /// Added in version 7.0.0
  guadeloupe('guadeloupe'),
  /// Gambia.
  ///
  /// Added in version 7.0.0
  gambia('gambia'),
  /// Guinea-Bissau.
  ///
  /// Added in version 7.0.0
  guineaBissau('guineaBissau'),
  /// Equatorial Guinea.
  ///
  /// Added in version 7.0.0
  equatorialGuinea('equatorialGuinea'),
  /// Greece.
  ///
  /// Added in version 7.0.0
  greece('greece'),
  /// Grenada.
  ///
  /// Added in version 7.0.0
  grenada('grenada'),
  /// Greenland.
  ///
  /// Added in version 7.0.0
  greenland('greenland'),
  /// Guatemala.
  ///
  /// Added in version 7.0.0
  guatemala('guatemala'),
  /// French Guiana.
  ///
  /// Added in version 7.0.0
  frenchGuiana('frenchGuiana'),
  /// Guam.
  ///
  /// Added in version 7.0.0
  guam('guam'),
  /// Guyana.
  ///
  /// Added in version 7.0.0
  guyana('guyana'),
  /// Hong Kong.
  ///
  /// Added in version 7.0.0
  hongKong('hongKong'),
  /// Heard Island and McDonald Islands.
  ///
  /// Added in version 7.0.0
  heardIslandAndMcDonaldIslands('heardIslandAndMcDonaldIslands'),
  /// Honduras.
  ///
  /// Added in version 7.0.0
  honduras('honduras'),
  /// Croatia.
  ///
  /// Added in version 7.0.0
  croatia('croatia'),
  /// Haiti.
  ///
  /// Added in version 7.0.0
  haiti('haiti'),
  /// Hungary.
  ///
  /// Added in version 7.0.0
  hungary('hungary'),
  /// Indonesia.
  ///
  /// Added in version 7.0.0
  indonesia('indonesia'),
  /// Isle of Man.
  ///
  /// Added in version 7.0.0
  isleOfMan('isleOfMan'),
  /// India.
  ///
  /// Added in version 7.0.0
  india('india'),
  /// British Indian Ocean Territory.
  ///
  /// Added in version 7.0.0
  britishIndianOceanTerritory('britishIndianOceanTerritory'),
  /// Ireland.
  ///
  /// Added in version 7.0.0
  ireland('ireland'),
  /// Iran, Islamic Republic of.
  ///
  /// Added in version 7.0.0
  iran('iran'),
  /// Iraq.
  ///
  /// Added in version 7.0.0
  iraq('iraq'),
  /// Iceland.
  ///
  /// Added in version 7.0.0
  iceland('iceland'),
  /// Israel.
  ///
  /// Added in version 7.0.0
  israel('israel'),
  /// Italy.
  ///
  /// Added in version 7.0.0
  italy('italy'),
  /// Jamaica.
  ///
  /// Added in version 7.0.0
  jamaica('jamaica'),
  /// Jersey.
  ///
  /// Added in version 7.0.0
  jersey('jersey'),
  /// Jordan.
  ///
  /// Added in version 7.0.0
  jordan('jordan'),
  /// Japan.
  ///
  /// Added in version 7.0.0
  japan('japan'),
  /// Kazakhstan.
  ///
  /// Added in version 7.0.0
  kazakhstan('kazakhstan'),
  /// Kenya.
  ///
  /// Added in version 7.0.0
  kenya('kenya'),
  /// Kyrgyzstan.
  ///
  /// Added in version 7.0.0
  kyrgyzstan('kyrgyzstan'),
  /// Cambodia.
  ///
  /// Added in version 7.0.0
  cambodia('cambodia'),
  /// Kiribati.
  ///
  /// Added in version 7.0.0
  kiribati('kiribati'),
  /// Saint Kitts and Nevis.
  ///
  /// Added in version 7.0.0
  saintKittsAndNevis('saintKittsAndNevis'),
  /// Korea, Republic of.
  ///
  /// Added in version 7.0.0
  southKorea('southKorea'),
  /// Kuwait.
  ///
  /// Added in version 7.0.0
  kuwait('kuwait'),
  /// Lao People’s Democratic Republic.
  ///
  /// Added in version 7.0.0
  lao('lao'),
  /// Lebanon.
  ///
  /// Added in version 7.0.0
  lebanon('lebanon'),
  /// Liberia.
  ///
  /// Added in version 7.0.0
  liberia('liberia'),
  /// Libya.
  ///
  /// Added in version 7.0.0
  libya('libya'),
  /// Saint Lucia.
  ///
  /// Added in version 7.0.0
  saintLucia('saintLucia'),
  /// Liechtenstein.
  ///
  /// Added in version 7.0.0
  liechtenstein('liechtenstein'),
  /// Sri Lanka.
  ///
  /// Added in version 7.0.0
  sriLanka('sriLanka'),
  /// Lesotho.
  ///
  /// Added in version 7.0.0
  lesotho('lesotho'),
  /// Lithuania.
  ///
  /// Added in version 7.0.0
  lithuania('lithuania'),
  /// Luxembourg.
  ///
  /// Added in version 7.0.0
  luxembourg('luxembourg'),
  /// Latvia.
  ///
  /// Added in version 7.0.0
  latvia('latvia'),
  /// Macao.
  ///
  /// Added in version 7.0.0
  macao('macao'),
  /// Saint Martin (French part).
  ///
  /// Added in version 7.0.0
  frenchSaintMartin('frenchSaintMartin'),
  /// Morocco.
  ///
  /// Added in version 7.0.0
  morocco('morocco'),
  /// Monaco.
  ///
  /// Added in version 7.0.0
  monaco('monaco'),
  /// Moldova, Republic of.
  ///
  /// Added in version 7.0.0
  moldova('moldova'),
  /// Madagascar.
  ///
  /// Added in version 7.0.0
  madagascar('madagascar'),
  /// Maldives.
  ///
  /// Added in version 7.0.0
  maldives('maldives'),
  /// Mexico.
  ///
  /// Added in version 7.0.0
  mexico('mexico'),
  /// Marshall Islands.
  ///
  /// Added in version 7.0.0
  marshallIslands('marshallIslands'),
  /// North Macedonia.
  ///
  /// Added in version 7.0.0
  northMacedonia('northMacedonia'),
  /// Mali.
  ///
  /// Added in version 7.0.0
  mali('mali'),
  /// Malta.
  ///
  /// Added in version 7.0.0
  malta('malta'),
  /// Myanmar.
  ///
  /// Added in version 7.0.0
  myanmar('myanmar'),
  /// Montenegro.
  ///
  /// Added in version 7.0.0
  montenegro('montenegro'),
  /// Mongolia.
  ///
  /// Added in version 7.0.0
  mongolia('mongolia'),
  /// Northern Mariana Islands.
  ///
  /// Added in version 7.0.0
  northernMarianaIslands('northernMarianaIslands'),
  /// Mozambique.
  ///
  /// Added in version 7.0.0
  mozambique('mozambique'),
  /// Mauritania.
  ///
  /// Added in version 7.0.0
  mauritania('mauritania'),
  /// Montserrat.
  ///
  /// Added in version 7.0.0
  montserrat('montserrat'),
  /// Martinique.
  ///
  /// Added in version 7.0.0
  martinique('martinique'),
  /// Mauritius.
  ///
  /// Added in version 7.0.0
  mauritius('mauritius'),
  /// Malawi.
  ///
  /// Added in version 7.0.0
  malawi('malawi'),
  /// Malaysia.
  ///
  /// Added in version 7.0.0
  malaysia('malaysia'),
  /// Mayotte.
  ///
  /// Added in version 7.0.0
  mayotte('mayotte'),
  /// Namibia.
  ///
  /// Added in version 7.0.0
  namibia('namibia'),
  /// New Caledonia.
  ///
  /// Added in version 7.0.0
  newCaledonia('newCaledonia'),
  /// Niger.
  ///
  /// Added in version 7.0.0
  niger('niger'),
  /// Norfolk Island.
  ///
  /// Added in version 7.0.0
  norfolkIsland('norfolkIsland'),
  /// Nigeria.
  ///
  /// Added in version 7.0.0
  nigeria('nigeria'),
  /// Nicaragua.
  ///
  /// Added in version 7.0.0
  nicaragua('nicaragua'),
  /// Niue.
  ///
  /// Added in version 7.0.0
  niue('niue'),
  /// Kingdom of the Netherlands.
  ///
  /// Added in version 7.0.0
  netherlands('netherlands'),
  /// Norway.
  ///
  /// Added in version 7.0.0
  norway('norway'),
  /// Nepal.
  ///
  /// Added in version 7.0.0
  nepal('nepal'),
  /// Nauru.
  ///
  /// Added in version 7.0.0
  nauru('nauru'),
  /// New Zealand.
  ///
  /// Added in version 7.0.0
  newZealand('newZealand'),
  /// Oman.
  ///
  /// Added in version 7.0.0
  oman('oman'),
  /// Pakistan.
  ///
  /// Added in version 7.0.0
  pakistan('pakistan'),
  /// Panama.
  ///
  /// Added in version 7.0.0
  panama('panama'),
  /// Pitcairn.
  ///
  /// Added in version 7.0.0
  pitcairn('pitcairn'),
  /// Peru.
  ///
  /// Added in version 7.0.0
  peru('peru'),
  /// Philippines.
  ///
  /// Added in version 7.0.0
  philippines('philippines'),
  /// Palau.
  ///
  /// Added in version 7.0.0
  palau('palau'),
  /// Papua New Guinea.
  ///
  /// Added in version 7.0.0
  papuaNewGuinea('papuaNewGuinea'),
  /// Poland.
  ///
  /// Added in version 7.0.0
  poland('poland'),
  /// Puerto Rico.
  ///
  /// Added in version 7.0.0
  puertoRico('puertoRico'),
  /// Korea, Democratic People’s Republic of.
  ///
  /// Added in version 7.0.0
  northKorea('northKorea'),
  /// Portugal.
  ///
  /// Added in version 7.0.0
  portugal('portugal'),
  /// Paraguay.
  ///
  /// Added in version 7.0.0
  paraguay('paraguay'),
  /// Palestine, State of.
  ///
  /// Added in version 7.0.0
  palestine('palestine'),
  /// French Polynesia.
  ///
  /// Added in version 7.0.0
  frenchPolynesia('frenchPolynesia'),
  /// Qatar.
  ///
  /// Added in version 7.0.0
  qatar('qatar'),
  /// Réunion.
  ///
  /// Added in version 7.0.0
  reunion('reunion'),
  /// Romania.
  ///
  /// Added in version 7.0.0
  romania('romania'),
  /// Russian Federation.
  ///
  /// Added in version 7.0.0
  russia('russia'),
  /// Rwanda.
  ///
  /// Added in version 7.0.0
  rwanda('rwanda'),
  /// Saudi Arabia.
  ///
  /// Added in version 7.0.0
  saudiArabia('saudiArabia'),
  /// Sudan.
  ///
  /// Added in version 7.0.0
  sudan('sudan'),
  /// Senegal.
  ///
  /// Added in version 7.0.0
  senegal('senegal'),
  /// Singapore.
  ///
  /// Added in version 7.0.0
  singapore('singapore'),
  /// South Georgia and the South Sandwich Islands.
  ///
  /// Added in version 7.0.0
  southGeorgiaAndTheSouthSandwichIslands('southGeorgiaAndTheSouthSandwichIslands'),
  /// Saint Helena, Ascension and Tristan da Cunha.
  ///
  /// Added in version 7.0.0
  saintHelena('saintHelena'),
  /// Svalbard and Jan Mayen.
  ///
  /// Added in version 7.0.0
  svalbardAndJanMayen('svalbardAndJanMayen'),
  /// Solomon Islands.
  ///
  /// Added in version 7.0.0
  solomonIslands('solomonIslands'),
  /// Sierra Leone.
  ///
  /// Added in version 7.0.0
  sierraLeone('sierraLeone'),
  /// El Salvador.
  ///
  /// Added in version 7.0.0
  elSalvador('elSalvador'),
  /// San Marino.
  ///
  /// Added in version 7.0.0
  sanMarino('sanMarino'),
  /// Somalia.
  ///
  /// Added in version 7.0.0
  somalia('somalia'),
  /// Saint Pierre and Miquelon.
  ///
  /// Added in version 7.0.0
  saintPierreAndMiquelon('saintPierreAndMiquelon'),
  /// Serbia.
  ///
  /// Added in version 7.0.0
  serbia('serbia'),
  /// South Sudan.
  ///
  /// Added in version 7.0.0
  southSudan('southSudan'),
  /// Sao Tome and Principe.
  ///
  /// Added in version 7.0.0
  saoTomeAndPrincipe('saoTomeAndPrincipe'),
  /// Suriname.
  ///
  /// Added in version 7.0.0
  suriname('suriname'),
  /// Slovakia.
  ///
  /// Added in version 7.0.0
  slovakia('slovakia'),
  /// Slovenia.
  ///
  /// Added in version 7.0.0
  slovenia('slovenia'),
  /// Sweden.
  ///
  /// Added in version 7.0.0
  sweden('sweden'),
  /// Eswatini.
  ///
  /// Added in version 7.0.0
  eswatini('eswatini'),
  /// Sint Maarten (Dutch part).
  ///
  /// Added in version 7.0.0
  dutchSintMaarten('dutchSintMaarten'),
  /// Seychelles.
  ///
  /// Added in version 7.0.0
  seychelles('seychelles'),
  /// Syrian Arab Republic.
  ///
  /// Added in version 7.0.0
  syria('syria'),
  /// Turks and Caicos Islands.
  ///
  /// Added in version 7.0.0
  turksAndCaicosIslands('turksAndCaicosIslands'),
  /// Chad.
  ///
  /// Added in version 7.0.0
  chad('chad'),
  /// Togo.
  ///
  /// Added in version 7.0.0
  togo('togo'),
  /// Thailand.
  ///
  /// Added in version 7.0.0
  thailand('thailand'),
  /// Tajikistan.
  ///
  /// Added in version 7.0.0
  tajikistan('tajikistan'),
  /// Tokelau.
  ///
  /// Added in version 7.0.0
  tokelau('tokelau'),
  /// Turkmenistan.
  ///
  /// Added in version 7.0.0
  turkmenistan('turkmenistan'),
  /// Timor-Leste.
  ///
  /// Added in version 7.0.0
  timorLeste('timorLeste'),
  /// Tonga.
  ///
  /// Added in version 7.0.0
  tonga('tonga'),
  /// Trinidad and Tobago.
  ///
  /// Added in version 7.0.0
  trinidadAndTobago('trinidadAndTobago'),
  /// Tunisia.
  ///
  /// Added in version 7.0.0
  tunisia('tunisia'),
  /// Türkiye.
  ///
  /// Added in version 7.0.0
  turkey('turkey'),
  /// Tuvalu.
  ///
  /// Added in version 7.0.0
  tuvalu('tuvalu'),
  /// Taiwan, Province of China.
  ///
  /// Added in version 7.0.0
  taiwan('taiwan'),
  /// Tanzania, United Republic of.
  ///
  /// Added in version 7.0.0
  tanzania('tanzania'),
  /// Uganda.
  ///
  /// Added in version 7.0.0
  uganda('uganda'),
  /// Ukraine.
  ///
  /// Added in version 7.0.0
  ukraine('ukraine'),
  /// United States Minor Outlying Islands.
  ///
  /// Added in version 7.0.0
  usMinorOutlyingIslands('usMinorOutlyingIslands'),
  /// Uruguay.
  ///
  /// Added in version 7.0.0
  uruguay('uruguay'),
  /// United States of America.
  ///
  /// Added in version 7.0.0
  us('us'),
  /// Uzbekistan.
  ///
  /// Added in version 7.0.0
  uzbekistan('uzbekistan'),
  /// Holy See.
  ///
  /// Added in version 7.0.0
  holySee('holySee'),
  /// Saint Vincent and the Grenadines.
  ///
  /// Added in version 7.0.0
  saintVincentAndTheGrenadines('saintVincentAndTheGrenadines'),
  /// Venezuela (Bolivarian Republic of).
  ///
  /// Added in version 7.0.0
  venezuela('venezuela'),
  /// Virgin Islands (British).
  ///
  /// Added in version 7.0.0
  britishVirginIslands('britishVirginIslands'),
  /// Virgin Islands (U.S.).
  ///
  /// Added in version 7.0.0
  usVirginIslands('usVirginIslands'),
  /// Viet Nam.
  ///
  /// Added in version 7.0.0
  vietnam('vietnam'),
  /// Vanuatu.
  ///
  /// Added in version 7.0.0
  vanuatu('vanuatu'),
  /// Wallis and Futuna.
  ///
  /// Added in version 7.0.0
  wallisAndFutuna('wallisAndFutuna'),
  /// Samoa.
  ///
  /// Added in version 7.0.0
  samoa('samoa'),
  /// Kosovo.
  ///
  /// Added in version 7.0.0
  kosovo('kosovo'),
  /// Yemen.
  ///
  /// Added in version 7.0.0
  yemen('yemen'),
  /// South Africa.
  ///
  /// Added in version 7.0.0
  southAfrica('southAfrica'),
  /// Zambia.
  ///
  /// Added in version 7.0.0
  zambia('zambia'),
  /// Zimbabwe.
  ///
  /// Added in version 7.0.0
  zimbabwe('zimbabwe');

  const IdCaptureRegion(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension IdCaptureRegionDeserializer on IdCaptureRegion {
  static IdCaptureRegion fromJSON(String jsonValue) {
    return IdCaptureRegion.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
