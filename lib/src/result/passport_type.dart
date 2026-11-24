/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2024- Scandit AG. All rights reserved.
 */

/// Sub-category of a passport.
///
/// The type is derived from the second letter of the MRZ document code, as defined in ICAO Doc 9303-4. ICAO made these letters mandatory for passports issued from 1 January 2026. Before that, some issuing states used the letters with other meanings. The type is the first match of these rules:
///
/// - China: the document number decides. A number that starts with `E` is [PassportType.national], and a number that starts with `SE` or `PE` is [PassportType.official].
/// - Switzerland: `PM` is [PassportType.national] when the passport expires before 1 January 2036, `PN` is [PassportType.diplomatic], and other letters have their ICAO meaning.
/// - These issuing states and document codes are [PassportType.national]. For South Korea, only when the passport expires before 1 January 2036. For `PR`, `PS` and `PT`, only when the MRZ nationality is the issuing state.
///   - `PM`: South Africa, South Korea.
///   - `PO`: Afghanistan, Burundi, Cameroon, Comoros, Guinea, Laos, Madagascar, Niger, Sierra Leone.
///   - `PE`: Mongolia, Myanmar, Romania.
///   - `PR`: Barbados, Maldives, Myanmar, South Korea, Venezuela.
///   - `PS`: Myanmar, South Korea.
///   - `PT`: Myanmar.
/// - When the MRZ nationality is the issuing state, `PS` is [PassportType.official], and `PR` and `PT` are [PassportType.national]. A refugee, stateless or alien document is not issued to a citizen of the issuing state.
/// - `P<`, `P` and `PP` are [PassportType.national], `PD` is [PassportType.diplomatic], `PK` is [PassportType.seafarer], `PL` is [PassportType.laissezPasser] and `PU` is [PassportType.emergencyTravelDocument].
/// - A passport that expires on or after 1 January 2036 has the ICAO meaning of the letter.
/// - All other passports are `Unknown`.
///
/// When the type is [PassportType.national] or `Unknown`, an MRZ nationality of `XXA` makes it [PassportType.stateless], and `XXB` or `XXC` makes it [PassportType.refugee].
///
/// Before 8.7, passports were reported with the ICAO meaning of the second letter.
///
/// Added in version 8.7.0
enum PassportType {
  /// A regular national passport.
  ///
  /// Added in version 8.7.0
  national('national'),
  /// Emergency passport.
  ///
  /// Added in version 8.7.0
  emergency('emergency'),
  /// Diplomatic passport.
  ///
  /// Added in version 8.7.0
  diplomatic('diplomatic'),
  /// Official or service passport.
  ///
  /// Added in version 8.7.0
  official('official'),
  /// Refugee travel document.
  ///
  /// Added in version 8.7.0
  refugee('refugee'),
  /// Alien passport.
  ///
  /// Added in version 8.7.0
  alien('alien'),
  /// Stateless person’s travel document.
  ///
  /// Added in version 8.7.0
  stateless('stateless'),
  /// Laissez-passer issued by an international organisation.
  ///
  /// Added in version 8.7.0
  laissezPasser('laissezPasser'),
  /// Military passport.
  ///
  /// Added in version 8.7.0
  military('military'),
  /// Seafarer passport.
  ///
  /// Added in version 8.7.0
  seafarer('seafarer'),
  /// Emergency travel document, a single-sheet document as defined in ICAO Doc 9303-8. Distinct from [PassportType.emergency], which is an emergency passport booklet. Before 8.7 both were reported as [PassportType.emergency].
  ///
  /// Added in version 8.7.0
  emergencyTravelDocument('emergencyTravelDocument'),
  /// The passport type cannot be determined reliably from the machine-readable zone. A passport of this type is not rejected unless [PassportType.unknown] is in [IdCaptureSettings.rejectPassportTypes].
  ///
  /// Added in version 8.7.0
  unknown('unknown');

  const PassportType(this._name);

  @override
  String toString() => _name;

  final String _name;
}

extension PassportTypeDeserializer on PassportType {
  static PassportType fromJSON(String jsonValue) {
    return PassportType.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
