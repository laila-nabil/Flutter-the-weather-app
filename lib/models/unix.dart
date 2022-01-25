import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

DateTime unixSecondsToDate(int unixTimeStamp) {
  return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
}

String unixSecondsToDateFormat(int unixTimeStamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  return DateFormat('hh:mm a','locale'.tr().toString()).format(date);
}
