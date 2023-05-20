part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetTodayOverviewV extends WeatherEvent {
  final GetTodayOverviewParamsV params;

  GetTodayOverviewV({required this.params});

  @override
  List<Object?> get props => [params];
}

class GetTodayOverview extends WeatherEvent {
  final GetTodayOverviewParams params;

  GetTodayOverview({required this.params});

  @override
  List<Object?> get props => [params];
}


class InitialWeatherEvent extends WeatherEvent {
  final GetHistoryListWeatherParams getHistoryListWeatherParams;
  final GetPresentFutureWeatherParams getPresentFutureWeatherParams;
  final GetTodayOverviewParams getTodayOverviewParams;

  InitialWeatherEvent(
      {required this.getHistoryListWeatherParams,
      required this.getPresentFutureWeatherParams,
      required this.getTodayOverviewParams});

  @override
  List<Object?> get props => [
        getHistoryListWeatherParams,
        getPresentFutureWeatherParams,
        getTodayOverviewParams
      ];
}