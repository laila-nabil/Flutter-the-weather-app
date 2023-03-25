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
                !.dt!.toInt(), presentFutureWeather!.timezoneOffset!.toInt()),
            ///TODO WRONG
            details: List.generate(presentFutureWeather?.hourly?.length ?? 0, (index) =>  DayWeatherParams(
                iconPath: presentFutureWeather?.hourly
                    .tryElementAt(index)
                    ?.weather
                    .tryFirst
                    ?.iconPath ??
                    "",
                currentTemp: presentFutureWeather?.current?.temp.toString() ?? "",
                minTemp:"minTemp",
                maxTemp:"maxTemp",
                rain: "rain",
                windSpeed: presentFutureWeather?.hourly
                    .tryElementAt(index)
                    ?.windSpeed
                    ?.toString() ??
                    "",
                windDeg: presentFutureWeather?.hourly
                    .tryElementAt(index)
                    ?.windDeg
                    ?.toString() ??
                    "",
                pressure: presentFutureWeather?.hourly.tryElementAt(index)?.pressure?.toString() ?? "",
                clouds: presentFutureWeather?.hourly.tryElementAt(index)?.clouds?.toString() ?? "",
                uvi: presentFutureWeather?.hourly.tryElementAt(index)?.uvi?.toString() ?? "",
                humidity: presentFutureWeather?.hourly.tryElementAt(index)?.humidity?.toString() ?? "",
                visibility: "visibility",
                detailedDescription: presentFutureWeather?.hourly.tryElementAt(index)?.weather.tryFirst?.description.toString() ?? "",
                feelsLike: presentFutureWeather?.hourly.tryElementAt(index)?.feelsLike.toString() ?? "",
                isImageNetwork: true,
                date: unixSecondsToDateTimezone(presentFutureWeather!.hourly
                    .tryElementAt(index)
                ?.dt?.toInt() ??0, presentFutureWeather?.timezoneOffset?.toInt() ??0),
            ))
        ));
    List<DayWeatherParams> _historyWeatherDays = List.generate(
        (historyListWeather?.length ?? 0),
        (index) {
          var element = historyListWeather?.tryElementAt(index);
          List<double> temps = [];
          element?.hourly?.forEach((element) {
            if(element.temp!=null) {
              temps.add(element.temp!);
            }});
          temps.sort();
          return DayWeatherParams(
            iconPath: element
                    ?.current?.weather
                    .tryFirst
                    ?.iconPath ??
                "",
            currentTemp:  element?.current?.temp.toString() ?? "",
            minTemp:
            temps.tryFirst.toString() ?? "minTemp",
            maxTemp:  temps.tryElementAt(temps.length - 1).toString() ?? "maxTemp",
            rain: "rain",
            windSpeed:
                "windSpeed",
            windDeg:
                "windDeg",
            pressure: "pressure",
            clouds: "clouds",
            uvi: "uvi",
            humidity: "humidity",
            visibility: "visibility",
            detailedDescription: "detailedDescription",
            feelsLike: "feelsLike",
            isImageNetwork: true,
            date: unixSecondsToDateTimezone(historyListWeather.tryElementAt(index)!.current!.dt!.toInt(), historyListWeather.tryElementAt(index)!.timezoneOffset!.toInt()),
            details: []
        );
        });


    return _historyWeatherDays + _presentFutureWeatherDays;
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
