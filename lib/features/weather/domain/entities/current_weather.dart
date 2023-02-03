

import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable{
  final String? currentTemp;
  final String? windDetails;
  final String? sunriseTime;
  final String? sunsetTime;
  final String? maxTemp;
  final String? minTemp;

  CurrentWeather(
      {this.currentTemp,
      this.windDetails,
      this.sunriseTime,
      this.sunsetTime,
      this.maxTemp,
      this.minTemp});
  @override
  List<Object?> get props => [
        this.currentTemp,
        this.windDetails,
        this.sunriseTime,
        this.sunsetTime,
        this.maxTemp,
        this.minTemp
      ];
}