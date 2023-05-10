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
    List<DayWeatherParams> presentFutureWeatherDays = List.generate(
        (presentFutureWeather?.daily?.length ?? 0),
        (index) {
          var date = presentFutureWeather!.daily
          .tryElementAt(index)
              ?.date(presentFutureWeather!.actualTimezoneOffset!.toInt()) ??
          DateTime.now();
      var hourlyList = presentFutureWeather?.hourly
          ?.where((element) =>
              element.date((presentFutureWeather?.actualTimezoneOffset ?? 0).toInt())
                  ?.isSameDay(date) ==
              true)
          .toList();
      return DayWeatherParams(
            iconPath: presentFutureWeather?.daily
                    .tryElementAt(index)
                    ?.weather
                    .tryFirst
                    ?.iconPath(Config.isImageNetwork) ??
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
            rain: "",
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
            visibility: "",
            detailedDescription: presentFutureWeather!.daily.tryElementAt(index)?.weather.tryFirst?.description.toString() ?? "",
            feelsLike: "",
            isImageNetwork: Config.isImageNetwork,
            date: date,
          details: List.generate(
              hourlyList?.length ?? 0,
              (index) => DayWeatherParams(
                    iconPath: hourlyList
                    .tryElementAt(index)
                    ?.weather
                    .tryFirst
                    ?.iconPath(Config.isImageNetwork) ??
                    "",
                currentTemp: hourlyList
                    .tryElementAt(index)?.temp.toString() ?? "",
                minTemp:"",
                maxTemp:"",
                rain: hourlyList
                    .tryElementAt(index)?.pop
                    ?.toString() ??
                    "",
                windSpeed: hourlyList
                    .tryElementAt(index)
                    ?.windSpeed
                    ?.toString() ??
                    "",
                windDeg: hourlyList
                    .tryElementAt(index)
                    ?.windDeg
                    ?.toString() ??
                    "",
                pressure: hourlyList.tryElementAt(index)?.pressure?.toString() ?? "",
                clouds: hourlyList.tryElementAt(index)?.clouds?.toString() ?? "",
                uvi: hourlyList.tryElementAt(index)?.uvi?.toString() ?? "",
                humidity: hourlyList.tryElementAt(index)?.humidity?.toString() ?? "",
                visibility:  hourlyList.tryElementAt(index)?.visibility?.toString() ?? "",
                detailedDescription: hourlyList.tryElementAt(index)?.weather.tryFirst?.description.toString() ?? "",
                feelsLike: hourlyList.tryElementAt(index)?.feelsLike.toString() ?? "",
                isImageNetwork: Config.isImageNetwork,
                date: hourlyList
                    .tryElementAt(index)?.date(
                            presentFutureWeather?.actualTimezoneOffset
                                    ?.toInt() ??
                                0) ??
                        DateTime.now(),
                  ))
        );
        });
    List<DayWeatherParams> historyWeatherDays = List.generate(
        (historyListWeather?.length ?? 0),
        (index) {
          var element = historyListWeather?.tryElementAt(index);
          List<num> temps = [];
          element?.hourly?.forEach((element) {
            if(element.temp!=null) {
              temps.add(element.temp!);
            }});
          temps.sort();
          var date = unixSecondsToDateTimezone(
              historyListWeather.tryElementAt(index)?.current?.dt?.toInt() ?? 0,
              historyListWeather.tryElementAt(index)?.actualTimezoneOffset?.toInt() ?? 0);
          // printDebug("*** date $date");
          return DayWeatherParams(
            iconPath: element
                    ?.current?.weather
                    .tryFirst
                    ?.iconPath(Config.isImageNetwork) ??
                "",
            currentTemp:  element?.current?.temp.toString() ?? "",
            minTemp:
            temps.tryFirst.toString(),
            maxTemp:  temps.tryElementAt(temps.length - 1).toString(),
            rain: "",
            windSpeed:
                "",
            windDeg:
                "",
            pressure: "",
            clouds: "",
            uvi: "",
            humidity: "",
            visibility: "",
            detailedDescription: "",
            feelsLike: "",
            isImageNetwork: Config.isImageNetwork,
          date: date!,
            details: List.generate(element?.hourly?.length ?? 0, (index) {
              // printDebug("*** 2 ${element?.hourly?.length} ${element?.hourly}");
              printDebug(
                "*** 3 date ${element?.hourly?[index].dt} ${historyListWeather.tryElementAt(index)?.actualTimezoneOffset?.toInt() ?? 0} ${unixSecondsToDateTimezone(element?.hourly?[index].dt?.toInt() ?? 0, historyListWeather.tryElementAt(index)?.actualTimezoneOffset?.toInt() ?? 0)} ${element?.hourly?[index].date(historyListWeather.tryElementAt(index)?.actualTimezoneOffset ?? 0)}");
            return DayWeatherParams(
                iconPath: element?.hourly?[index].weather.tryFirst
                    ?.iconPath(Config.isImageNetwork)
                    .toString() ??
                    "",
                currentTemp:  element?.hourly?[index].temp.toString() ?? "",
                minTemp: "",
                maxTemp:  "",
                rain: (element?.hourly?[index].pop ?? "").toString(),
                windSpeed:element?.hourly?[index].windSpeed.toString() ?? "",
                windDeg:element?.hourly?[index].windDeg.toString() ?? "",
                pressure: element?.hourly?[index].pressure.toString() ?? "",
                clouds: element?.hourly?[index].visibility.toString() ?? "",
                uvi: element?.hourly?[index].uvi.toString() ?? "",
                humidity: element?.hourly?[index].humidity.toString() ?? "",
                visibility:element?.hourly?[index].visibility.toString() ?? "",
                detailedDescription:element?.hourly?[index].weather.tryFirst?.description
                    .toString() ??
                    "",
                feelsLike: element?.hourly?[index].feelsLike.toString() ?? "",
                isImageNetwork: Config.isImageNetwork,
                date: unixSecondsToDateTimezone(
                    element?.hourly?[index].dt?.toInt() ?? 0,
                    historyListWeather
                        .tryElementAt(index)
                        ?.actualTimezoneOffset
                        ?.toInt() ??
                        0),
              );
            })
        );
        });

    return historyWeatherDays + presentFutureWeatherDays;
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
