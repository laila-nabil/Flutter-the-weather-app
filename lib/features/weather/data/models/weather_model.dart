import 'package:easy_localization/easy_localization.dart';
import 'package:the_weather_app/core/config.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/domain/entities/unix.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required String tempMax,
    required String tempMin,
    required String tempCurrent,
    required String dt,
    required DateTime date,
    required String mainDescription,
    required String detailedDescription,
    required String image,
    required bool isImageNetwork,
    required String lat,
    required String lon,
    required String rain,
    required String windSpeed,
    required String windDeg,
    required String feelsLike,
    required bool isMetric,
    required List<WeatherModel>? weatherTimeline,
    required String humidity,
    required String pressure,
    required String uvi,
    required String visibility,
    required String clouds,
  }) : super(
            lat: lat,
            lon: lon,
            windSpeed: windSpeed,
            windDeg: windDeg,
            pressure: pressure,
            mainDescription: mainDescription,
            isMetric: isMetric,
            isImageNetwork: isImageNetwork,
            clouds: clouds,
            date: date,
            detailedDescription: detailedDescription,
            dt: dt,
            feelsLike: feelsLike,
            humidity: humidity,
            rain: rain,
            tempCurrent: tempCurrent,
            tempMax: tempMax,
            tempMin: tempMin,
            uvi: uvi,
            visibility: visibility,
            weatherTimeline: weatherTimeline,
            image: image);

  factory WeatherModel.fromJson(
      {required Map<String, dynamic> json,
        required Map<String, dynamic> jsonDaily,
      required String lat,
      required String lon,
      required int timezoneOffset}) {
    printDebug("json['weather'] ${json['weather']} ${json['weather'][0]}");
    var _tempMax = (jsonDaily[0]['temp']['max'] ?? "").toString();
    var _tempMin = (jsonDaily[0]['temp']['min'] ?? "").toString();
    var _mainDescription = (json['weather']?[0]['main'] ?? "");
    var _detailedDescription = (json['weather']?[0]['description'] ?? "");
    return WeatherModel(
      lat: lat,
      lon: lon,
      isImageNetwork: !Config.isImage3D,
      image: Config.isImage3D
          ? '${AppAssets.Icon3dPath}/${json['weather'][0]['icon']}.png'
          : 'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@4x.png',
      mainDescription: _mainDescription,
      detailedDescription: _detailedDescription,
      dt: json['dt'].toString(),
      date: Config.localTime
          ? unixSecondsToDate(json['dt'])
          : unixSecondsToDateTimezone(json['dt'], timezoneOffset),
      rain: json['pop'].toString(),
      feelsLike: json['feels_like'].toString(),
      windSpeed: json['wind_speed'].toString(),
      windDeg: json['wind_deg'].toString(),
      humidity: json['humidity'].toString(),
      uvi: json['uvi'].toString(),
      clouds: json['clouds'].toString(),
      visibility: json['visibility'].toString(),
      pressure: json['pressure'].toString(),
      tempCurrent: json['temp'].toString(),
      isMetric: Config.isMetric,
      tempMax: _tempMax,
      tempMin: _tempMin,
      weatherTimeline: null,
    );
  }
  static WeatherModel fromJsonWithTimeline(
      {required Map<String, dynamic> json,
      required  List<WeatherModel> hourly,
        required String lat,
        required String lon,
        required int timezoneOffset,
      }) {
    return WeatherModel(
        lat: lat,
        lon: lon,
        isImageNetwork: !Config.isImage3D,
        image: Config.isImage3D
            ? '${AppAssets.Icon3dPath}/${json['weather'][0]['icon']}.png'
            : 'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@4x.png',
        mainDescription: json['weather'][0]['main'].toString(),
        detailedDescription: json['weather'][0]['description'].toString(),
        dt: json['dt'].toString(),
        date: Config.localTime
            ? unixSecondsToDate(json['dt'])
            : unixSecondsToDateTimezone(json['dt'], timezoneOffset),
        rain: json['pop'].toString(),
        feelsLike: json['feels_like'].toString(),
        windSpeed: json['wind_speed'].toString(),
        windDeg: json['wind_deg'].toString(),
        humidity: json['humidity'].toString(),
        uvi: json['uvi'].toString(),
        clouds: json['clouds'].toString(),
        visibility: json['visibility'].toString(),
        pressure: json['pressure'].toString(),
        tempCurrent: json['temp'].toString(),
        isMetric: Config.isMetric,
        tempMax: json['daily'][0]['temp']['max'].toString(),
        tempMin: json['daily'][0]['temp']['min'].toString(),
        weatherTimeline: hourly.where((element) {
          // print("weather Timeline ${element.date} $date ${unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset'])}");
          // print("weather Timeline ${DateFormat('yyyy-MM-dd')
          //     .format(element.date)
          //     .compareTo(DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(date, presentFutureWeather['timezone_offset']))) }");
          printDebug("_element $element");
          var _date = json['daily'][0]['dt'] as int;
          var difference = ( Config.localTime
              ? DateFormat('yyyy-MM-dd').format(element.date).compareTo(
              DateFormat('yyyy-MM-dd').format(unixSecondsToDate(_date)))
              : DateFormat('yyyy-MM-dd').format(element.date).compareTo(
              DateFormat('yyyy-MM-dd').format(unixSecondsToDateTimezone(
                  _date, timezoneOffset))) );
          return difference == 0;
        }).toList());
  }
}
