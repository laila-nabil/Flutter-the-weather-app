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
        (weather?.dailyList?.time?.length ?? 0),
        (index) {
          var date = weather?.dailyList?.time
          .tryElementAt(index) ??
          DateTime.now();
      var hourlyList = weather?.hourly
          ?.where((element) =>
              element.time.contains(other))
          .toList();
      return DayWeatherParams(
            iconPath: weather?.dailyList
                    .tryElementAt(index)
                    ?.weather
                    .tryFirst
                    ?.iconPath(Config.isImageNetwork) ??
                "",
            currentTemp: weather?.current?.temp.toString() ?? "",
            minTemp: weather?.dailyList
                    .tryElementAt(index)
                    ?.temp
                    ?.min
                    .toString() ??
                "",
            maxTemp: weather?.dailyList
                    .tryElementAt(index)
                    ?.temp
                    ?.max
                    .toString() ??
                "",
            rain: "",
            windSpeed: weather?.dailyList
                    .tryElementAt(index)
                    ?.windSpeed
                    ?.toString() ??
                "",
            windDeg: weather?.dailyList
                    .tryElementAt(index)
                    ?.windDeg
                    ?.toString() ??
                "",
            pressure: weather?.dailyList.tryElementAt(index)?.pressure?.toString() ?? "",
            clouds: weather?.dailyList.tryElementAt(index)?.clouds?.toString() ?? "",
            uvi: weather?.dailyList.tryElementAt(index)?.uvi?.toString() ?? "",
            humidity: weather?.dailyList.tryElementAt(index)?.humidity?.toString() ?? "",
            visibility: "",
            detailedDescription: weather!.dailyList.tryElementAt(index)?.weather.tryFirst?.description.toString() ?? "",
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
