import 'package:intl/intl.dart';

String formatTimeToAmPm(String dateTimeStr) {
  try {
    final dateTime = DateTime.parse(dateTimeStr);
    final formatter = DateFormat.jm(); // 'jm' gives you 12-hour format with AM/PM
    return formatter.format(dateTime);
  } catch (e) {
    return 'Invalid date';
  }
}
