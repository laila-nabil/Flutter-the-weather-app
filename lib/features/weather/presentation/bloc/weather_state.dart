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
  WeatherEntity? weather;
  Failure? getWeatherFailure;
  String? compareTodayYesterday;

  WeatherState copyWith(
      {required WeatherStatus weatherStatus,
        WeatherEntity? weather,
        Failure? getWeatherFailure,
      String? compareTodayYesterday}) {
    return WeatherState(
        weatherStatus: weatherStatus,
        getWeatherFailure: getWeatherFailure ?? this.getWeatherFailure,
        weather: weather ?? this.weather,
        compareTodayYesterday:
            compareTodayYesterday ?? this.compareTodayYesterday);
  }

  WeatherState(
      {required this.weatherStatus,
      this.getWeatherFailure,
      this.weather,
      this.compareTodayYesterday,});

  List<DayWeatherParams> get days{
    List<DayWeatherParams> weatherUiData = List.generate(
        (weather?.daily?.time?.length ?? 0),
        (index) {
          var date = weather?.daily?.time
          .tryElementAt(index) ??
          DateTime.now();
      var hourlyList = weather?.hourly
          ?.where((element) =>
              element.date((weather?.actualTimezoneOffset ?? 0).toInt())
                  ?.isSameDay(date) ==
              true)
          .toList();
      return DayWeatherParams(
            iconPath: weather?.daily
                    .tryElementAt(index)
                    ?.weather
                    .tryFirst
                    ?.iconPath(Config.isImageNetwork) ??
                "",
            currentTemp: weather?.current?.temp.toString() ?? "",
            minTemp: weather?.daily
                    .tryElementAt(index)
                    ?.temp
                    ?.min
                    .toString() ??
                "",
            maxTemp: weather?.daily
                    .tryElementAt(index)
                    ?.temp
                    ?.max
                    .toString() ??
                "",
            rain: "",
            windSpeed: weather?.daily
                    .tryElementAt(index)
                    ?.windSpeed
                    ?.toString() ??
                "",
            windDeg: weather?.daily
                    .tryElementAt(index)
                    ?.windDeg
                    ?.toString() ??
                "",
            pressure: weather?.daily.tryElementAt(index)?.pressure?.toString() ?? "",
            clouds: weather?.daily.tryElementAt(index)?.clouds?.toString() ?? "",
            uvi: weather?.daily.tryElementAt(index)?.uvi?.toString() ?? "",
            humidity: weather?.daily.tryElementAt(index)?.humidity?.toString() ?? "",
            visibility: "",
            detailedDescription: weather!.daily.tryElementAt(index)?.weather.tryFirst?.description.toString() ?? "",
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
                            weather?.actualTimezoneOffset
                                    ?.toInt() ??
                                0) ??
                        DateTime.now(),
                  ))
        );
        });

    return weatherUiData;
  }
  @override
  List<Object?> get props => [
        weatherStatus,
        getWeatherFailure,
        weather,
        compareTodayYesterday,
      ];
}
