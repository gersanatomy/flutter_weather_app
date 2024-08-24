import 'package:intl/intl.dart';

class DatePrettify {
  static String dayAndDateToString(String value) {
    final DateTime date = DateTime.parse(value);
    final DateFormat formatter = DateFormat('EEEE, \nMMM dd');
    return formatter.format(date);
  }

  static String weekdayMonthDayToString(DateTime value) {
    final DateFormat formatter = DateFormat('EEEE, MMM dd');
    return formatter.format(value);
  }

  static dateToString(DateTime value) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(value);
  }

  static String timeToString(String value) {
    final DateTime date = DateTime.parse(value);
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  static dateNow() {
    final DateFormat formatter = DateFormat('EEEE, MMM dd');
    return formatter.format(DateTime.now());
  }

  static bool isDayTime({String value = ''}) {
    final DateTime date;
    if (value == '') {
      date = DateTime.now();
    } else {
      date = DateTime.parse(value);
    }

    return date.hour < 18 && date.hour > 5 ? true : false;
  }
}
