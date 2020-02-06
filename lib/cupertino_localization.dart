import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class IdCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const IdCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode == 'id' && locale.countryCode == 'ID';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      IdCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(IdCupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(id_ID)';
}

class IdCupertinoLocalizations implements CupertinoLocalizations {
  const IdCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  static const List<String> _months = <String>[
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => 'Jam ${hour.toString()}';

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) =>
      '${minute.toString()} menit';

  @override
  String datePickerMediumDate(DateTime date) =>
      '${_shortWeekdays[date.weekday - DateTime.monday]} '
      '${_shortMonths[date.month - DateTime.january]} '
      '${date.day.toString().padRight(2)}';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel => 'Peringatan';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => 'jam';

  @override
  String timerPickerMinuteLabel(int minute) => 'menit';

  @override
  String timerPickerSecondLabel(int second) => 'detik';

  @override
  String get cutButtonLabel => 'Potong';

  @override
  String get copyButtonLabel => 'Salin';

  @override
  String get pasteButtonLabel => 'Tempel';

  @override
  String get selectAllButtonLabel => 'Pilih Semua';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
      const IdCupertinoLocalizations(),
    );
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      IdCupertinoLocalizationsDelegate();

  @override
  String get todayLabel => 'Hari ini';
}
