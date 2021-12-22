import 'package:flutter/material.dart';

class CurrentWeather {
  final String temp;
  final String feelsLike;
  String tempMin;
  String tempMax;
  final String pressure;
  final String clouds;
  final String windSpeed;
  final String windDeg;
  final String humidity;
  final String sunset;
  final String sunrise;
  final String detailedDescription;
  final String mainDescription;
  final String image;
  final bool isImageNetwork;
  final String lat;
  final String lon;
  final String city;
  final String country;
  final String unixTime;
  final bool isMetric;

  CurrentWeather({
    this.lat = "",
    this.lon = "",
    this.image = 'assets/weather_status/clear.png',
    this.isImageNetwork = false,
    this.isMetric = true,
    this.temp = '',
    this.clouds = '',
    this.feelsLike = '',
    this.tempMin = '',
    this.tempMax = '',
    this.humidity = '',
    this.mainDescription = '',
    this.detailedDescription = '',
    this.pressure = '',
    this.sunrise = '',
    this.sunset = '',
    this.unixTime = '',
    this.windDeg = '',
    this.windSpeed = '',
    this.city = '',
    this.country = '',
  });
}
