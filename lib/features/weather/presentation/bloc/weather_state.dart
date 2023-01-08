part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  final WeatherEvent event;

  WeatherLoading(this.event);

  @override
  List<Object> get props => [event];
}

class WeatherSuccess extends WeatherState {
  final WeatherEvent event;
  final List<Weather>? historyWeather;
  final PresentFutureWeather? presentFutureWeather;
  final CurrentWeather? currentWeather;
  final String? compareTodayYesterday;
  WeatherSuccess(this.event,
      {this.historyWeather,
      this.presentFutureWeather,
      this.currentWeather,
      this.compareTodayYesterday});

  @override
  List<Object?> get props => [
        event,
        historyWeather,
        presentFutureWeather,
        currentWeather,
        compareTodayYesterday
      ];
}

class WeatherFailure extends WeatherState {
  final WeatherEvent event;
  final Failure failure;

  WeatherFailure(this.event, {required this.failure});

  @override
  List<Object> get props => [event, failure];
}
