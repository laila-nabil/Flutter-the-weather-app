import 'package:easy_localization/easy_localization.dart';
import 'package:the_weather_app/core/config.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/unix.dart';

class CurrentWeatherModel extends CurrentWeather {
  final num? coordLat;
  final num? coordLon;
  final String? weatherMain;
  final String? weatherDescription;
  final String? weatherIcon;
  final num? mainTemp;
  final num? mainTempMin;
  final num? mainTempMax;
  final num? mainFeelsLike;
  final num? mainPressure;
  final num? mainHumidity;
  final num? visibility;
  final num? windSpeed;
  final int? windDeg;
  final num? clouds;
  final num? dt;
  final num? sysType;
  final num? sysId;
  final String? sysCountry;
  final int? sysSunrise;
  final int? sysSunset;
  final num? timezone;
  final num? id;
  final String? name;
  final num? cod;

  CurrentWeatherModel(
      {this.coordLat,
      this.coordLon,
      this.weatherMain,
      this.weatherDescription,
      this.weatherIcon,
      this.mainTemp,
      this.mainTempMin,
      this.mainTempMax,
      this.mainFeelsLike,
      this.mainPressure,
      this.mainHumidity,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.clouds,
      this.dt,
      this.sysType,
      this.sysId,
      this.sysCountry,
      this.sysSunrise,
      this.sysSunset,
      this.timezone,
      this.id,
      this.name,
      this.cod})
      : super(
            currentTemp: mainTemp,
            maxTemp: mainTempMax,
            minTemp: mainTempMin,
            sunriseTime:
                sysSunrise != null ? unixSecondsToDateFormat(sysSunrise) : null,
            sunsetTime:
                sysSunset != null ? unixSecondsToDateFormat(sysSunset) : null,
            windDegrees: windDeg,
            feelsLikeTemp: mainFeelsLike,
            windSpeed: windSpeed,
            iconPath: ("assets/3d/"+(weatherIcon??"")+".png"),
            windDegreesDescription:
                windDeg != null ? windDirection(windDeg) : null);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coordLat: (json["coord"]?["lon"]) ?? null,
      coordLon: (json["coord"]?["lon"]) ?? null,
      weatherMain: (json["weather"]?[0]?["main"]) ?? null,
      weatherDescription: (json["weather"]?[0]?["description"]) ?? null,
      weatherIcon: (json["weather"]?[0]?["icon"]) ?? null,
      mainTemp: (json["main"]?["temp"]) ?? null,
      mainTempMax: (json["main"]?["temp_max"]) ?? null,
      mainTempMin: (json["main"]?["temp_min"]) ?? null,
      mainPressure: (json["main"]?["pressure"]) ?? null,
      mainFeelsLike: (json["main"]?["feels_like"]) ?? null,
      mainHumidity: (json["main"]?["humidity"]) ?? null,
      windSpeed: (json["wind"]?["speed"]) ?? null,
      windDeg: (json["wind"]?["deg"]) ?? null,
      clouds: (json["clouds"]?["all"]) ?? null,
      dt: (json["dt"]) ?? null,
      sysType: (json["sys"]?["type"]) ?? null,
      sysId: (json["sys"]?["id"]) ?? null,
      sysCountry: (json["sys"]?["country"]) ?? null,
      sysSunrise: (json["sys"]?["sunrise"]) ?? null,
      sysSunset: (json["sys"]?["sunset"]) ?? null,
      timezone: (json["timezone"]) ?? null,
      id: (json["id"]) ?? null,
      name: (json["name"]) ?? null,
      cod: (json["cod"]) ?? null,
    );
  }
}

String windDirection(int windDegrees) {
  final directionsEn = [
    "N",
    "NNE",
    "NE",
    "ENE",
    "E",
    "ESE",
    "SE",
    "SSE",
    "S",
    "SSW",
    "SW",
    "WSW",
    "W",
    "WNW",
    "NW",
    "NNW",
    "N"
  ];
  // final directionsAr = ["شمال","شمال","شمال شرق","شرق","شرق","شرق","جنوب شرق","جنوب","جنوب","جنوب","جنوب غرب","غرب","غرب","غرب","شمال غرب","شمال","شمال"];
  final directionsAr = [
    "ش",
    "ش",
    "ش ق",
    "ق",
    "ق",
    "ق",
    "ج ق",
    "ج",
    "ج",
    "ج",
    "ج غ",
    "غ",
    "غ",
    "غ",
    "ش غ",
    "ش",
    "ش"
  ];
  final result = 'lang'.tr().contains('EN')
      ? '${directionsEn[(windDegrees / 22.5).round()]}'
      : '${directionsAr[(windDegrees / 22.5).round()]}';
  return result;
}
