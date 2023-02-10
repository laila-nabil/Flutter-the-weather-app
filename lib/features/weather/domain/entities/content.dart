import 'package:equatable/equatable.dart';

class Content extends Equatable {
  final CurrentWeatherContent currentWeatherContent;
  final CompareWeatherContent compareWeatherContent;
  final TimelineWeatherContent timelineWeatherContent;

  Content(
      {required this.currentWeatherContent,
      required this.compareWeatherContent,
      required this.timelineWeatherContent});

  @override
  List<Object?> get props => [
        this.currentWeatherContent,
        this.compareWeatherContent,
        this.timelineWeatherContent
      ];
}

class CurrentWeatherContent extends Equatable {
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
  final String? weatherDescription;

  CurrentWeatherContent(
      {required this.currentTemp,
        required this.windDegrees,
        required this.windDegreesDescription,
        required this.windSpeed,
        required this.sunriseTime,
        required this.sunsetTime,
        required this.maxTemp,
        required this.minTemp,
        required this.feelsLikeTemp,
        required this.iconPath,
        required this.weatherDescription
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
    this.iconPath,
    this.weatherDescription,
  ];
}

class CompareWeatherContent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TimelineWeatherContent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
