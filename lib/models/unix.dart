import 'package:intl/intl.dart';

DateTime unixSecondsToDate(int unixTimeStamp) {
  return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
}

String unixSecondsToDateFormat(int unixTimeStamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  return DateFormat('hh:mm a').format(date);
}