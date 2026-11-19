/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2026- Scandit AG. All rights reserved.
 */

enum ApplicationStatus {
  approved('approved'),
  granted('granted'),
  pending('pending'),
  denied('denied'),
  revoked('revoked'),
  expired('expired'),
  cancelled('cancelled'),
  other('other'),
  unknown('unknown');

  const ApplicationStatus(this._name);

  final String _name;

  @override
  String toString() => _name;
}

extension ApplicationStatusDeserializer on ApplicationStatus {
  static ApplicationStatus fromJSON(String jsonValue) {
    return ApplicationStatus.values.firstWhere((element) => element.toString() == jsonValue);
  }
}
