part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  todayOverviewSuccess,
  todayOverviewFailure,
  presentFutureSuccess,
  presentFutureFailure,
  historySuccess,
  historyFailure
}

class WeatherState extends Equatable {
  final WeatherStatus weatherStatus;
  TodayOverview? todayOverview;
  PresentFutureWeather? presentFutureWeather;
  List<HistoryWeather>? historyListWeather;
  Failure? todayOverviewFailure;
  Failure? presentFutureFailure;
  Failure? historyListFailure;
  String? compareTodayYesterday;

  WeatherState copyWith(
      {required WeatherStatus weatherStatus,
      TodayOverview? todayOverview,
      PresentFutureWeather? presentFutureWeather,
      List<HistoryWeather>? historyListWeather,
      Failure? todayOverviewFailure,
      Failure? presentFutureFailure,
      Failure? historyListFailure,
      String? compareTodayYesterday}) {
    return WeatherState(
        weatherStatus: weatherStatus,
        todayOverview: todayOverview ?? this.todayOverview,
        todayOverviewFailure: todayOverviewFailure ?? this.todayOverviewFailure,
        historyListFailure: historyListFailure ?? this.historyListFailure,
        historyListWeather: historyListWeather ?? this.historyListWeather,
        presentFutureFailure: presentFutureFailure ?? this.presentFutureFailure,
        presentFutureWeather: presentFutureWeather??this.presentFutureWeather,
        compareTodayYesterday:
            compareTodayYesterday ?? this.compareTodayYesterday);
  }

  WeatherState(
      {required this.weatherStatus,
      this.todayOverview,
      this.todayOverviewFailure,
      this.presentFutureWeather,
      this.compareTodayYesterday,
      this.historyListFailure,
      this.historyListWeather,
      this.presentFutureFailure});

  @override
  List<Object?> get props => [
        weatherStatus,
        todayOverview,
        todayOverviewFailure,
        presentFutureWeather,
        compareTodayYesterday,
        historyListFailure,
        historyListWeather,
        presentFutureFailure
      ];
}
