part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetTodayOverview extends WeatherEvent {
  final GetTodayOverviewParams params;

  GetTodayOverview({required this.params});

  @override
  List<Object?> get props => [params];
}

class GetWeatherTimeline extends WeatherEvent {
  final WeatherTimelineParams params;

  GetWeatherTimeline({required this.params});

  @override
  List<Object?> get props => [params];
}

class InitialWeatherEvent extends WeatherEvent {
  final WeatherTimelineParams weatherTimelineParams;
  final GetTodayOverviewParams getTodayOverviewParams;

  InitialWeatherEvent(
      {required this.weatherTimelineParams,
      required this.getTodayOverviewParams});

  @override
  List<Object?> get props => [weatherTimelineParams, getTodayOverviewParams];
}
