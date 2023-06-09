part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure
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
    printDebug("weather?.dailyHourlyList?.length ${weather?.dailyHourlyList?.length}");
    List<DayWeatherParams> weatherUiData = List.generate(
        (weather?.dailyHourlyList?.length ?? 0),
        (index) {
      var day = weather?.dailyHourlyList.tryElementAt(index);
      return DayWeatherParams(
            iconPath: AppAssets.getIconPath(day?.dailyEntity.weatherCode, true),
            currentTemp: "",
            minTemp: (day?.dailyEntity.temperature2mMin ?? "").toString(),
            maxTemp: (day?.dailyEntity.temperature2mMax
                    ?? "" ).toString(),
            rain: "",
            windSpeed:"",
            windDeg: "",
            pressure: "",
            clouds:"",
            uvi: "",
            humidity: "",
            visibility:"",
            detailedDescription: "",
            feelsLike: "",
            isImageNetwork: Config.isImageNetwork,
            date: DateTime.parse(day?.dailyEntity.time ?? ""),
          details: List.generate(
              day?.hourlyList.length ?? 0,
              (index) => DayWeatherParams(
                    iconPath: AppAssets.getIconPath(
                        day?.hourlyList.elementAt(index).weatherCode,
                        day?.hourlyList.elementAt(index).is_day == 1),
                    currentTemp: (day?.hourlyList.elementAt(index).temperature2m ?? "").toString(),
                minTemp:"",
                maxTemp:"",
                rain: (day?.hourlyList.elementAt(index).precipitationProbability ?? "").toString(),
                windSpeed:(day?.hourlyList.elementAt(index).windspeed_10m ?? "").toString(),
                windDeg: (day?.hourlyList.elementAt(index).winddirection_10m ?? "").toString(),
                pressure: "",//TODO
                clouds: "",//TODO
                uvi: (day?.hourlyList.elementAt(index).uv_index ?? "").toString(),
                humidity: (day?.hourlyList.elementAt(index).relativehumidity_2m ?? "").toString(),
                visibility:  "",//TODO
                detailedDescription: "",//TODO
                feelsLike: "",//TODO
                isImageNetwork: Config.isImageNetwork,
                date: DateTime.parse(day?.hourlyList.elementAt(index).time ?? ""),
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
