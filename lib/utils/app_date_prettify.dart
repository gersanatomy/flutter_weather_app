import 'package:intl/intl.dart';

class DatePrettify {
  static dayAndDateToString(String value) {
    final DateTime date = DateTime.parse(value);
    final DateFormat formatter = DateFormat('EEEE, \nMMM dd');
    final String formatted = formatter.format(date);
    return formatted.toString();
  }
}
