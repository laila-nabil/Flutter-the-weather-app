part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherInitialEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class WeatherRefreshEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class _GetHistoryWeather extends WeatherEvent {
  final GetHistoryWeatherParams params;

  _GetHistoryWeather(this.params);
  @override
  List<Object?> get props => [params];
}

class _GetCurrentWeather extends WeatherEvent {
  final GetCurrentWeatherParams params;

  _GetCurrentWeather(this.params);
  @override
  List<Object?> get props => [params];
}

class _GetPresentFutureWeather extends WeatherEvent {
  final GetPresentFutureWeatherParams params;

  _GetPresentFutureWeather(this.params);
  @override
  List<Object?> get props => [params];
}
