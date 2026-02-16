/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2025- Scandit AG. All rights reserved.
 */

class _YearsMonthsDays {
  final int years, months, days;
  const _YearsMonthsDays(this.years, this.months, this.days);
}

int _daysInMonth(int year, int month) {
  final firstOfNext = month == 12 ? DateTime(year + 1, 1, 1) : DateTime(year, month + 1, 1);
  return firstOfNext.subtract(const Duration(days: 1)).day;
}

_YearsMonthsDays _splitDurationFrom(DateTime start, Duration d) {
  final end = start.add(d);

  var years = end.year - start.year;
  var months = end.month - start.month;
  var days = end.day - start.day;

  if (days < 0) {
    months -= 1;
    final prevMonth = end.month == 1 ? 12 : end.month - 1;
    final prevMonthYear = end.month == 1 ? end.year - 1 : end.year;
    days += _daysInMonth(prevMonthYear, prevMonth);
  }
  if (months < 0) {
    years -= 1;
    months += 12;
  }
  return _YearsMonthsDays(years, months, days);
}

Duration _fromYMDFor(DateTime start, {int years = 0, int months = 0, int days = 0}) {
  final end = DateTime(start.year + years, start.month + months, start.day + days);
  return end.difference(start);
}

extension DurationYmdSplit on Duration {
  Map<String, dynamic> toMap(DateTime start) {
    final yearsMonthsDays = _splitDurationFrom(start, this);
    return {
      'years': yearsMonthsDays.years,
      'months': yearsMonthsDays.months,
      'days': yearsMonthsDays.days,
    };
  }
}

extension DurationFromMap on Map<String, dynamic> {
  Duration toDurationFrom(DateTime start) {
    final years = (this['years'] as int?) ?? 0;
    final months = (this['months'] as int?) ?? 0;
    final days = (this['days'] as int?) ?? 0;
    return _fromYMDFor(start, years: years, months: months, days: days);
  }
}
