/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2021- Scandit AG. All rights reserved.
 */

class DateResult {
  int _day;
  int _month;
  int _year;

  DateResult._(this._day, this._month, this._year);

  DateResult.fromJSON(Map<String, dynamic> json)
      : this._(json['day'] as int, json['month'] as int, json['year'] as int);

  int get day {
    return _day;
  }

  int get month {
    return _month;
  }

  int get year {
    return _year;
  }

  DateTime get date {
    return DateTime.utc(year, month, day);
  }
}
