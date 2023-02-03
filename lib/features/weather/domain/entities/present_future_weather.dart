import 'package:equatable/equatable.dart';

class PresentFutureWeather extends Equatable {
  PresentFutureWeather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  final num? lat;
  final num? lon;
  final String? timezone;
  final int? timezoneOffset;
  final Current? current;
  final List<Current> hourly;
  final List<Daily> daily;

  @override
  List<Object?> get props => [
    lat, lon, timezone, timezoneOffset, current, hourly, daily, ];
}

class Current extends Equatable {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
    required this.windGust,
    required this.pop,
  });

  final int? dt;
  final int? sunrise;
  final int? sunset;
  final num? temp;
  final num? feelsLike;
  final int? pressure;
  final int? humidity;
  final num? dewPoint;
  final num? uvi;
  final int? clouds;
  final int? visibility;
  final num? windSpeed;
  final int? windDeg;
  final List<PresentFutureWeatherDetails> weather;
  final num? windGust;
  final int? pop;

  @override
  List<Object?> get props => [
    dt, sunrise, sunset, temp, feelsLike, pressure, humidity, dewPoint, uvi, clouds, visibility, windSpeed, windDeg, weather, windGust, pop, ];
}

class PresentFutureWeatherDetails extends Equatable {
  PresentFutureWeatherDetails({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  @override
  List<Object?> get props => [
    id, main, description, icon, ];
}

class Daily extends Equatable {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });

  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final num? moonPhase;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final num? dewPoint;
  final num? windSpeed;
  final int? windDeg;
  final num? windGust;
  final List<PresentFutureWeatherDetails> weather;
  final int? clouds;
  final num? pop;
  final num? uvi;

  @override
  List<Object?> get props => [
    dt, sunrise, sunset, moonrise, moonset, moonPhase, temp, feelsLike, pressure, humidity, dewPoint, windSpeed, windDeg, windGust, weather, clouds, pop, uvi, ];
}

class FeelsLike extends Equatable {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final num? day;
  final num? night;
  final num? eve;
  final num? morn;


  @override
  List<Object?> get props => [
    day, night, eve, morn, ];
}

class Temp extends Equatable {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final num? day;
  final num? min;
  final num? max;
  final num? night;
  final num? eve;
  final num? morn;

  @override
  List<Object?> get props => [
    day, min, max, night, eve, morn, ];
}
