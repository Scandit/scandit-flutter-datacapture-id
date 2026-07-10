/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

import 'package:flutter/widgets.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

@immutable
class DateResult extends Serializable {
  final int _day;
  final int _month;
  final int _year;

  DateResult._(this._day, this._month, this._year);

  DateResult.fromJSON(Map<String, dynamic> json)
      : this._(json['day'] as int? ?? 1, json['month'] as int? ?? 1, json['year'] as int? ?? 1);

  int get day {
    return _day;
  }

  int get month {
    return _month;
  }

  int get year {
    return _year;
  }

  @Deprecated("Use [localDate] or [utcDate] instead.")
  DateTime get date {
    return DateTime.utc(year, month, day);
  }

  DateTime get localDate {
    return utcDate.toLocal();
  }

  DateTime get utcDate {
    return DateTime.utc(year, month, day);
  }

  @override
  Map<String, dynamic> toMap() {
    return {"day": _day, "month": _month, "year": _year};
  }

  bool operator ==(Object other) {
    return other is DateResult && other.day == day && other.month == month && other.year == year;
  }

  @override
  // Object.hash() was introduced in sdk 2.14 our current minimum is 2.12
  // ignore: deprecated_member_use
  int get hashCode => hashValues(day.hashCode, month.hashCode, year.hashCode);
}
