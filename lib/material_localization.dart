import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class IdMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const IdMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode == 'id' && locale.countryCode == 'ID';

  @override
  Future<MaterialLocalizationId> load(Locale locale) =>
      IdMaterialLocalizations.load(locale);

  @override
  bool shouldReload(IdMaterialLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultMaterialLocalizations.delegate(id_ID)';
}

class IdMaterialLocalizations implements MaterialLocalizationId {
  const IdMaterialLocalizations();

  static const List<String> _shortWeekdays = <String>[
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];

  static const List<String> _weekdays = <String>[
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
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

  static const List<String> _narrowWeekdays = <String>[
    'M',
    'S',
    'S',
    'R',
    'K',
    'J',
    'S',
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
  String aboutListTileTitle(String applicationName) {
    return 'Tentang $applicationName';
  }

  @override
  String get aboutListTileTitleRaw => 'Tentang aplikasi';

  @override
  String get alertDialogLabel => 'Peringatan';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get backButtonTooltip => 'Kembali';

  @override
  String get cancelButtonLabel => 'Batal';

  @override
  String get closeButtonLabel => 'Tutup';

  @override
  String get closeButtonTooltip => 'Tutup';

  @override
  String get collapsedIconTapHint => 'Buka';

  @override
  String get continueButtonLabel => 'Lanjutkan';

  @override
  String get copyButtonLabel => 'Salin';

  @override
  String get cutButtonLabel => 'Potong';

  @override
  String get deleteButtonTooltip => 'Hapus';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get drawerLabel => 'Menu Navigasi';

  @override
  String get expandedIconTapHint => 'Tutup';

  @override
  int get firstDayOfWeekIndex => 0;

  @override
  String formatDecimal(int number) {
    if (number > -1000 && number < 1000) {
      return number.toString();
    }

    final String digits = number.abs().toString();
    final StringBuffer result = StringBuffer(number < 0 ? '-' : '');
    final int maxDigitIndex = digits.length - 1;
    for (int i = 0; i <= maxDigitIndex; i += 1) {
      result.write(digits[i]);
      if (i < maxDigitIndex && (maxDigitIndex - i) % 3 == 0) {
        result.write(',');
      }
    }
    return result.toString();
  }

  @override
  String formatFullDate(DateTime date) {
    final String month = _months[date.month - DateTime.january];
    return '${_weekdays[date.weekday - DateTime.monday]}, $month ${date.day}, ${date.year}';
  }

  String _formatTwoDigitZeroPad(int number) {
    assert(0 <= number && number < 100);

    if (number < 10) {
      return '0$number';
    }

    return '$number';
  }

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    final TimeOfDayFormat format =
        timeOfDayFormat(alwaysUse24HourFormat: alwaysUse24HourFormat);
    switch (format) {
      case TimeOfDayFormat.h_colon_mm_space_a:
        return formatDecimal(
            timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod);
      case TimeOfDayFormat.HH_colon_mm:
        return _formatTwoDigitZeroPad(timeOfDay.hour);
      default:
        throw AssertionError('$runtimeType does not support $format.');
    }
  }

  @override
  String formatMediumDate(DateTime date) {
    final String day = _shortWeekdays[date.weekday - DateTime.monday];
    final String month = _shortMonths[date.month - DateTime.january];
    return '$day, $month ${date.day}';
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    final int minute = timeOfDay.minute;
    return minute < 10 ? '0$minute' : minute.toString();
  }

  @override
  String formatMonthYear(DateTime date) {
    final String year = formatYear(date);
    final String month = _months[date.month - DateTime.january];
    return '$month $year';
  }

  String _formatDayPeriod(TimeOfDay timeOfDay) {
    switch (timeOfDay.period) {
      case DayPeriod.am:
        return anteMeridiemAbbreviation;
      case DayPeriod.pm:
        return postMeridiemAbbreviation;
    }
    return null;
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay,
      {bool alwaysUse24HourFormat = false}) {
    final StringBuffer buffer = StringBuffer();

    // Add hour:minute.
    buffer
      ..write(
          formatHour(timeOfDay, alwaysUse24HourFormat: alwaysUse24HourFormat))
      ..write(':')
      ..write(formatMinute(timeOfDay));

    if (alwaysUse24HourFormat) {
      // There's no AM/PM indicator in 24-hour format.
      return '$buffer';
    }

    // Add AM/PM indicator.
    buffer..write(' ')..write(_formatDayPeriod(timeOfDay));
    return '$buffer';
  }

  @override
  String formatYear(DateTime date) {
    return date.year.toString();
  }

  @override
  String get hideAccountsLabel => 'Sembunyikan akun';

  @override
  String get licensesPageTitle => 'Lisensi';

  @override
  String get modalBarrierDismissLabel => 'Batal';

  @override
  List<String> get narrowWeekdays => _narrowWeekdays;

  @override
  String get nextMonthTooltip => 'Bulan selanjutnya';

  @override
  String get nextPageTooltip => 'Halaman selanjutnya';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get openAppDrawerTooltip => 'Buka menu navigasi';

  @override
  String pageRowsInfoTitle(
      int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return rowCountIsApproximate
        ? '$firstRow–$lastRow sekitar dari $rowCount'
        : '$firstRow–$lastRow dari $rowCount';
  }

  @override
  // TODO(lucky): implement pageRowsInfoTitleApproximateRaw
  String get pageRowsInfoTitleApproximateRaw => '';

  @override
  // TODO(lucky): implement pageRowsInfoTitleRaw
  String get pageRowsInfoTitleRaw => '';

  @override
  String get pasteButtonLabel => 'Tempel';

  @override
  String get popupMenuLabel => 'Menu popup';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Bulan sebelumnya';

  @override
  String get previousPageTooltip => 'Halaman sebelumnya';

  @override
  String get refreshIndicatorSemanticLabel => 'Segarkan';

  @override
  String remainingTextFieldCharacterCount(int remainingCount) {
    switch (remainingCount) {
      case 0:
        return 'Tidak ada karakter tersisa';
      case 1:
        return '1 karakter tersisa';
      default:
        return '$remainingCount karakter tersisa';
    }
  }

  @override
  String get remainingTextFieldCharacterCountFew => 'Beberapa';

  @override
  String get remainingTextFieldCharacterCountMany => 'Banyak';

  @override
  String get remainingTextFieldCharacterCountOne => '1';

  @override
  String get remainingTextFieldCharacterCountOther => 'Lainnya';

  @override
  String get remainingTextFieldCharacterCountTwo => '2';

  @override
  String get remainingTextFieldCharacterCountZero => '0';

  @override
  String get reorderItemDown => 'Pindah ke bawah';

  @override
  String get reorderItemLeft => 'Pindah ke kiri';

  @override
  String get reorderItemRight => 'Pindah ke kanan';

  @override
  String get reorderItemToEnd => 'Pindah ke akhir';

  @override
  String get reorderItemToStart => 'Pindah ke awal';

  @override
  String get reorderItemUp => 'Pindah ke atas';

  @override
  String get rowsPerPageTitle => 'Baris per halaman:';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Cari';

  @override
  String get selectAllButtonLabel => 'Pilih Semua';

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    switch (selectedRowCount) {
      case 0:
        return 'Tidak ada item yang dipilih';
      default:
        return '$selectedRowCount items selected';
    }
  }

  @override
  String get selectedRowCountTitleFew => 'Beberapa';

  @override
  String get selectedRowCountTitleMany => 'Banyak';

  @override
  String get selectedRowCountTitleOne => '1';

  @override
  String get selectedRowCountTitleOther => 'Lainnya';

  @override
  String get selectedRowCountTitleTwo => '2';

  @override
  String get selectedRowCountTitleZero => '0';

  @override
  String get showAccountsLabel => 'Tampilkan akun';

  @override
  String get showMenuTooltip => 'Tampilkan menu';

  @override
  String get signedInLabel => 'Sudah masuk';

  @override
  String tabLabel({int tabIndex, int tabCount}) {
    return 'Tab ke $tabIndex dari $tabCount';
  }

  @override
  String get tabLabelRaw => 'Tab';

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return alwaysUse24HourFormat
        ? TimeOfDayFormat.HH_colon_mm
        : TimeOfDayFormat.h_colon_mm_space_a;
  }

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.a_space_h_colon_mm;

  @override
  String get timePickerHourModeAnnouncement => 'Pilih jam';

  @override
  String get timePickerMinuteModeAnnouncement => 'Pilih menit';

  @override
  String get viewLicensesButtonLabel => 'TAMPILKAN LISENSI';

  static Future<MaterialLocalizationId> load(Locale locale) {
    return SynchronousFuture<MaterialLocalizationId>(
      const IdMaterialLocalizations(),
    );
  }

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      IdMaterialLocalizationsDelegate();
}
