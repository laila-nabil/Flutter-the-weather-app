
import 'package:equatable/equatable.dart';

class CurrentWeatherEntity extends Equatable{
  final String temp;
  final String feelsLike;
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

  CurrentWeatherEntity({
    this.lat = "",
    this.lon = "",
    this.image = 'assets/weather_status/clear.png',
    this.isImageNetwork = false,
    this.isMetric = true,
    this.temp = '',
    this.clouds = '',
    this.feelsLike = '',
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

  @override
  List<Object?> get props => [ this.lat,
    this.lon,
    this.image ,
    this.isImageNetwork,
    this.isMetric,
    this.temp,
    this.clouds ,
    this.feelsLike,
    this.humidity,
    this.mainDescription,
    this.detailedDescription,
    this.pressure,
    this.sunrise,
    this.sunset,
    this.unixTime,
    this.windDeg,
    this.windSpeed,
    this.city,
    this.country,];

}

