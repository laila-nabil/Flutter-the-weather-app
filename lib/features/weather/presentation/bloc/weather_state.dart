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

  List<DayWeatherParams> get days{
    List<DayWeatherParams> _presentFutureWeatherDays = List.generate(
        (presentFutureWeather?.daily?.length ?? 0),
        (index) => DayWeatherParams(
            iconPath: presentFutureWeather?.daily
                    .tryElementAt(index)
                    ?.weather
                    .tryFirst
                    ?.iconPath ??
                "",
            currentTemp: presentFutureWeather?.current?.temp.toString() ?? "",
            minTemp: presentFutureWeather?.daily
                    .tryElementAt(index)
                    ?.temp
                    ?.min
                    .toString() ??
                "",
            maxTemp: presentFutureWeather?.daily
                    .tryElementAt(index)
                    ?.temp
                    ?.max
                    .toString() ??
                "",
            rain: "rain",
            windSpeed: presentFutureWeather?.daily
                    .tryElementAt(index)
                    ?.windSpeed
                    ?.toString() ??
                "",
            windDeg: presentFutureWeather?.daily
                    .tryElementAt(index)
                    ?.windDeg
                    ?.toString() ??
                "",
            pressure: presentFutureWeather?.daily.tryElementAt(index)?.pressure?.toString() ?? "",
            clouds: presentFutureWeather?.daily.tryElementAt(index)?.clouds?.toString() ?? "",
            uvi: presentFutureWeather?.daily.tryElementAt(index)?.uvi?.toString() ?? "",
            humidity: presentFutureWeather?.daily.tryElementAt(index)?.humidity?.toString() ?? "",
            visibility: "visibility",
            detailedDescription: presentFutureWeather!.daily.tryElementAt(index)?.weather.tryFirst?.description.toString() ?? "",
            feelsLike: "feelsLike",
            isImageNetwork: true,
            date: unixSecondsToDateTimezone(presentFutureWeather!.daily
                .tryElementAt(index)
                !.dt!.toInt(), presentFutureWeather!.timezoneOffset!.toInt())));

    return _presentFutureWeatherDays;
  }
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
