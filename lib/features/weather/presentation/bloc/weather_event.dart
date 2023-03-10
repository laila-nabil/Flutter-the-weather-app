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

class RefreshWeatherEvent extends WeatherEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}