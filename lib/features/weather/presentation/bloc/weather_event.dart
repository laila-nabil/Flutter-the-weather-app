part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}


class GetWeatherEvent extends WeatherEvent {
  final GetWeatherParams getWeatherParams;

  const GetWeatherEvent(
      {required this.getWeatherParams,});

  @override
  List<Object?> get props => [
        getWeatherParams,
      ];
}