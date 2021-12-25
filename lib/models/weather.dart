import 'package:flutter/material.dart';

class Weather {
  final String tempMax;
  final String tempMin;
  final DateTime date;
  final String mainDescription;
  final String detailedDescription;
  final String image;
  final bool isImageNetwork;
  final String lat;
  final String lon;
  final bool isMetric;
  List<Weather> weatherTimeline;

  Weather(
      {this.tempMax = "0.0",
      this.tempMin = "0.0",
      DateTime date,
      this.detailedDescription = "",
      this.mainDescription = "",
      this.image = 'assets/weather_status/clear.png',
      this.isImageNetwork = false,
      this.lat = "",
      this.lon = "",
      this.weatherTimeline ,
      this.isMetric = true})
      : date = date ??
            DateTime
                .now(); // This means date equals to second date, but if second date is null then a equals DateTime.now()
}
