import 'package:equatable/equatable.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

class PresentFutureWeather extends Equatable {
  final List<Weather> presentFutureWeather;
  final int timezoneOffset;

  PresentFutureWeather(
      {required this.presentFutureWeather, required this.timezoneOffset});
  @override
  List<Object?> get props => [this.presentFutureWeather, this.timezoneOffset];

}