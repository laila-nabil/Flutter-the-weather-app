import 'package:easy_localization/easy_localization.dart';

DateTime unixSecondsToDate(int unixTimeStamp) {
  //If [isUtc] is false then the date is in the local time zone.
  return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
}

String unixSecondsToDateFormat(int unixTimeStamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  return DateFormat('hh:mm a','locale'.tr().toString()).format(date);
}

DateTime unixSecondsToDateTimezone(int unixTimeStamp, int timezoneOffset) {
  //If [isUtc] is false then the date is in the local time zone.
  return DateTime.fromMillisecondsSinceEpoch(
      (unixTimeStamp + timezoneOffset) * 1000,
      isUtc: true);
}

