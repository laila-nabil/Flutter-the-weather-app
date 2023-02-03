

import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable{
  final num? currentTemp;
  final num? windDegrees;
  final String? windDegreesDescription;
  final num? windSpeed;
  final String? sunriseTime;
  final String? sunsetTime;
  final num? maxTemp;
  final num? minTemp;
  final num? feelsLikeTemp;
  final String? iconPath;

  CurrentWeather(
      {required this.currentTemp,
      required this.windDegrees,
      required this.windDegreesDescription,
      required this.windSpeed,
      required this.sunriseTime,
      required this.sunsetTime,
      required this.maxTemp,
      required this.minTemp,
      required this.feelsLikeTemp,
      required this.iconPath
      });
  @override
  List<Object?> get props => [
        this.currentTemp,
        this.windDegrees,
        this.windDegreesDescription,
        this.windSpeed,
        this.sunriseTime,
        this.sunsetTime,
        this.maxTemp,
        this.minTemp,
        this.feelsLikeTemp,
        this.iconPath
      ];
}