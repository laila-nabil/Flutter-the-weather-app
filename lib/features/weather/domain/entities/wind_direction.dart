import 'package:easy_localization/easy_localization.dart';

String windDirection(int windDegrees)
{
  final directionsEn = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"];
  final directionsAr = ["ش","ش","ش ق","ق","ق","ق","ج ق","ج","ج","ج","ج غ","غ","غ","غ","ش غ","ش","ش"];
  final result = 'lang'.tr().contains('EN')? directionsEn[(windDegrees/22.5).round()] : directionsAr[(windDegrees/22.5).round()];
  return  result;
}