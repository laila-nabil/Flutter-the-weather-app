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
  final List<Weather>? history;
  final List<Weather>? presentFuture;
  final CurrentWeather? currentWeather;

  WeatherSuccess(this.event,
      {this.history, this.presentFuture, this.currentWeather});

  @override
  List<Object?> get props => [event, history, presentFuture, currentWeather];
}

class WeatherFailure extends WeatherState {
  final WeatherEvent event;
  final Failure failure;

  WeatherFailure(this.event, {required this.failure});

  @override
  List<Object> get props => [event, failure];
}
