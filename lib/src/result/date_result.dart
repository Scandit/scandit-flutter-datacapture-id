/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

/// A date extracted from a personal identification document. May represent either a full date (day, month, year), just a month and a year or just a year.
///
/// Added in version 6.11.0
@immutable
class DateResult extends Serializable {
  final int _day;
  final int _month;
  final int _year;

  DateResult._(this._day, this._month, this._year);

  /// Constructs a new instance of this class from an optional day, optional month and a year.
  ///
  /// Added in version 8.3.0
  DateResult({int? day, int? month, required int year}) : this._(day ?? 1, month ?? 1, year);

  DateResult.fromJSON(Map<String, dynamic> json)
      : this._(json['day'] as int? ?? 1, json['month'] as int? ?? 1, json['year'] as int? ?? 1);

  /// The extracted day of the month or 0 if this result represents a month and a year only.
  ///
  /// Added in version 6.11.0
  int get day {
    return _day;
  }

  /// A number from 1 to 12 representing the extracted month, where 1 represents January, 2 - February and so on or 0 if the results represents a year only.
  ///
  /// Added in version 6.11.0
  int get month {
    return _month;
  }

  /// The extracted year.
  ///
  /// Added in version 6.11.0
  int get year {
    return _year;
  }

  /// A Date corresponding to this DateResult using the local timezone. If the day information is missing, it is set to the 1st day of the month, if the month information is missing, it is set to the 1st month of the year
  ///
  /// Added in version 6.22.0
  DateTime get localDate {
    return utcDate.toLocal();
  }

  /// A Date corresponding to this DateResult. The timezone is set to UTC, the time to midnight. If the day information is missing, it is set to the 1st day of the month, if the month information is missing, it is set to the 1st month of the year.
  ///
  /// Added in version 6.22.0
  DateTime get utcDate {
    return DateTime.utc(year, month, day);
  }

  @override
  Map<String, dynamic> toMap() {
    return {"day": _day, "month": _month, "year": _year};
  }

  @override
  bool operator ==(Object other) {
    return other is DateResult && other.day == day && other.month == month && other.year == year;
  }

  @override
  int get hashCode => Object.hash(day, month, year);
}
