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
      printDebug("** day is ${day?.dailyEntity}");
      printDebug("** day is ${day?.hourlyList.length} ${day?.hourlyList}");
      return DayWeatherParams(
            iconPath: "",///TODO
            currentTemp: "",
            minTemp: (day?.dailyEntity.temperature2mMin ?? "").toString(),
            maxTemp: (day?.dailyEntity.temperature2mMax
                    ?? "" ).toString(),
            rain: "",
            windSpeed:"",///TODO
            windDeg: "",///TODO
            pressure: "",///TODO
            clouds:"",///TODO
            uvi: "",///TODO
            humidity: "",///TODO
            visibility:"",///TODO
            detailedDescription: "",///TODO
            feelsLike: "",///TODO
            isImageNetwork: Config.isImageNetwork,
            date: DateTime.parse(day?.dailyEntity.time ?? ""),
          details: List.generate(
              day?.hourlyList.length ?? 0,
              (index) => DayWeatherParams(
                    iconPath: "",//TODO
                currentTemp: (day?.hourlyList.elementAt(index).temperature2m ?? "").toString(),
                minTemp:"",
                maxTemp:"",
                rain: (day?.hourlyList.elementAt(index).precipitationProbability ?? "").toString(),
                windSpeed:"",//TODO
                windDeg: "",//TODO
                pressure: "",//TODO
                clouds: "",//TODO
                uvi: "",//TODO
                humidity: "",//TODO
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
