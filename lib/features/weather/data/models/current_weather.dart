import 'package:the_weather_app/core/config.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel({
    required String temp,
    required String feelsLike,
    required String pressure,
    required String clouds,
    required String windSpeed,
    required String windDeg,
    required String humidity,
    required String sunset,
    required String sunrise,
    required String detailedDescription,
    required String mainDescription,
    required String image,
    required bool isImageNetwork,
    required String lat,
    required String lon,
    required String city,
    required String country,
    required String unixTime,
    required bool isMetric,
  }) : super(
            clouds: clouds,
            detailedDescription: detailedDescription,
            country: country,
            city: city,
            feelsLike: feelsLike,
            humidity: humidity,
            image: image,
            isImageNetwork: isImageNetwork,
            isMetric: isMetric,
            lat: lat,
            lon: lon,
            mainDescription: mainDescription,
            pressure: pressure,
            sunrise: sunrise,
            sunset: sunset,
            temp: temp,
            unixTime: unixTime,
            windDeg: windDeg,
            windSpeed: windSpeed);

  factory CurrentWeatherModel.fromJson(
      {required Map<String, dynamic> json,
      required String lat,
      required String lon}) {
    final iconNow = json['weather'][0]['icon'];
    final currentWeather = CurrentWeatherModel(
        isMetric: Config.isMetric,
        image: Config.isImage3D
            ? '${AppAssets.Icon3dPath}/$iconNow.png'
            : 'https://openweathermap.org/img/wn/$iconNow@4x.png',
        temp: json['main']['temp'].toString(),
        feelsLike: json['main']['feels_like'].toString(),
        mainDescription: json['weather'][0]['main'],
        detailedDescription: json['weather'][0]['description'],
        clouds: json['clouds']['all'].toString(),
        humidity: json['main']['humidity'].toString(),
        pressure: json['main']['pressure'].toString(),
        sunrise: json['sys']['sunrise'].toString(),
        sunset: json['sys']['sunset'].toString(),
        unixTime: json['dt'].toString(),
        windDeg: json['wind']['deg'].toString(),
        windSpeed: json['wind']['speed'].toString(),
        city: json['name'],
        country: json['sys']['country'],
        isImageNetwork: Config.isImageNetwork,
        lon: lon,
        lat: lat);

    return currentWeather;
  }
}
