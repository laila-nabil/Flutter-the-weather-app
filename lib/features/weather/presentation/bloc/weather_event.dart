part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetTodayOverview extends WeatherEvent{
  final GetTodayOverviewParams params;

  GetTodayOverview({required this.params});

  @override
  List<Object?> get props => [params];
}