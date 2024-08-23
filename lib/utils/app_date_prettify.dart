import 'package:intl/intl.dart';

class DatePrettify {
  static String dayAndDateToString(String value) {
    final DateTime date = DateTime.parse(value);
    final DateFormat formatter = DateFormat('EEEE, \nMMM dd');
    return formatter.format(date);
  }

  static dateToString(DateTime value) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(value);
  }
}
