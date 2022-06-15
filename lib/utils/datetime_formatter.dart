import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateTimeFormatter {

  static const String LOCALE_DATE_PATTERN = 'dd/MM/yyyy';

  static DateTime fromTimestemp(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }

  static String toStringDate(DateTime dateTime) {
    return DateFormat(LOCALE_DATE_PATTERN).format(dateTime);
  }
}