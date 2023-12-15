import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/extensions.dart';

/// latitude : 30.0625
/// longitude : 31.25
/// generationtime_ms : 0.4749298095703125
/// utc_offset_seconds : 7200
/// timezone : "Africa/Cairo"
/// timezone_abbreviation : "EET"
/// elevation : 26.0
/// current_weather : {"temperature":32.8,"windspeed":5.1,"winddirection":188,"weathercode":0,"is_day":1,"time":"2023-05-31T10:00"}
/// hourly_units : {"time":"iso8601","temperature_2m":"°C","precipitation_probability":"%"}
/// hourly : {"time":["2023-05-30T00:00","2023-05-30T01:00","2023-05-30T02:00","2023-05-30T03:00","2023-05-30T04:00","2023-05-30T05:00","2023-05-30T06:00","2023-05-30T07:00","2023-05-30T08:00","2023-05-30T09:00","2023-05-30T10:00","2023-05-30T11:00","2023-05-30T12:00","2023-05-30T13:00","2023-05-30T14:00","2023-05-30T15:00","2023-05-30T16:00","2023-05-30T17:00","2023-05-30T18:00","2023-05-30T19:00","2023-05-30T20:00","2023-05-30T21:00","2023-05-30T22:00","2023-05-30T23:00","2023-05-31T00:00","2023-05-31T01:00","2023-05-31T02:00","2023-05-31T03:00","2023-05-31T04:00","2023-05-31T05:00","2023-05-31T06:00","2023-05-31T07:00","2023-05-31T08:00","2023-05-31T09:00","2023-05-31T10:00","2023-05-31T11:00","2023-05-31T12:00","2023-05-31T13:00","2023-05-31T14:00","2023-05-31T15:00","2023-05-31T16:00","2023-05-31T17:00","2023-05-31T18:00","2023-05-31T19:00","2023-05-31T20:00","2023-05-31T21:00","2023-05-31T22:00","2023-05-31T23:00","2023-06-01T00:00","2023-06-01T01:00","2023-06-01T02:00","2023-06-01T03:00","2023-06-01T04:00","2023-06-01T05:00","2023-06-01T06:00","2023-06-01T07:00","2023-06-01T08:00","2023-06-01T09:00","2023-06-01T10:00","2023-06-01T11:00","2023-06-01T12:00","2023-06-01T13:00","2023-06-01T14:00","2023-06-01T15:00","2023-06-01T16:00","2023-06-01T17:00","2023-06-01T18:00","2023-06-01T19:00","2023-06-01T20:00","2023-06-01T21:00","2023-06-01T22:00","2023-06-01T23:00","2023-06-02T00:00","2023-06-02T01:00","2023-06-02T02:00","2023-06-02T03:00","2023-06-02T04:00","2023-06-02T05:00","2023-06-02T06:00","2023-06-02T07:00","2023-06-02T08:00","2023-06-02T09:00","2023-06-02T10:00","2023-06-02T11:00","2023-06-02T12:00","2023-06-02T13:00","2023-06-02T14:00","2023-06-02T15:00","2023-06-02T16:00","2023-06-02T17:00","2023-06-02T18:00","2023-06-02T19:00","2023-06-02T20:00","2023-06-02T21:00","2023-06-02T22:00","2023-06-02T23:00","2023-06-03T00:00","2023-06-03T01:00","2023-06-03T02:00","2023-06-03T03:00","2023-06-03T04:00","2023-06-03T05:00","2023-06-03T06:00","2023-06-03T07:00","2023-06-03T08:00","2023-06-03T09:00","2023-06-03T10:00","2023-06-03T11:00","2023-06-03T12:00","2023-06-03T13:00","2023-06-03T14:00","2023-06-03T15:00","2023-06-03T16:00","2023-06-03T17:00","2023-06-03T18:00","2023-06-03T19:00","2023-06-03T20:00","2023-06-03T21:00","2023-06-03T22:00","2023-06-03T23:00","2023-06-04T00:00","2023-06-04T01:00","2023-06-04T02:00","2023-06-04T03:00","2023-06-04T04:00","2023-06-04T05:00","2023-06-04T06:00","2023-06-04T07:00","2023-06-04T08:00","2023-06-04T09:00","2023-06-04T10:00","2023-06-04T11:00","2023-06-04T12:00","2023-06-04T13:00","2023-06-04T14:00","2023-06-04T15:00","2023-06-04T16:00","2023-06-04T17:00","2023-06-04T18:00","2023-06-04T19:00","2023-06-04T20:00","2023-06-04T21:00","2023-06-04T22:00","2023-06-04T23:00","2023-06-05T00:00","2023-06-05T01:00","2023-06-05T02:00","2023-06-05T03:00","2023-06-05T04:00","2023-06-05T05:00","2023-06-05T06:00","2023-06-05T07:00","2023-06-05T08:00","2023-06-05T09:00","2023-06-05T10:00","2023-06-05T11:00","2023-06-05T12:00","2023-06-05T13:00","2023-06-05T14:00","2023-06-05T15:00","2023-06-05T16:00","2023-06-05T17:00","2023-06-05T18:00","2023-06-05T19:00","2023-06-05T20:00","2023-06-05T21:00","2023-06-05T22:00","2023-06-05T23:00","2023-06-06T00:00","2023-06-06T01:00","2023-06-06T02:00","2023-06-06T03:00","2023-06-06T04:00","2023-06-06T05:00","2023-06-06T06:00","2023-06-06T07:00","2023-06-06T08:00","2023-06-06T09:00","2023-06-06T10:00","2023-06-06T11:00","2023-06-06T12:00","2023-06-06T13:00","2023-06-06T14:00","2023-06-06T15:00","2023-06-06T16:00","2023-06-06T17:00","2023-06-06T18:00","2023-06-06T19:00","2023-06-06T20:00","2023-06-06T21:00","2023-06-06T22:00","2023-06-06T23:00"],"temperature_2m":[23.5,23.0,22.1,21.8,21.4,21.4,21.6,23.2,26.5,29.1,31.1,31.7,33.0,33.6,33.5,33.5,33.5,32.8,32.1,31.0,27.8,26.4,25.6,25.0,24.5,24.0,23.2,22.8,22.7,22.7,23.3,25.6,28.2,30.6,32.8,34.5,35.9,37.0,37.5,37.6,37.6,37.2,36.5,35.1,32.3,30.7,29.4,29.3,28.4,28.3,28.2,27.8,26.0,26.0,26.7,27.8,30.9,34.7,37.0,38.1,37.8,39.2,39.1,39.6,37.3,37.0,36.2,35.4,33.8,32.4,31.5,31.0,30.7,30.0,29.9,29.9,27.7,26.7,27.6,30.3,34.0,37.6,39.6,41.5,42.0,41.7,40.0,39.9,39.3,38.1,37.9,36.8,35.4,34.1,32.9,31.0,29.0,26.9,25.2,24.4,23.9,23.6,23.8,24.7,26.4,28.5,31.0,33.1,34.7,35.9,36.7,37.1,37.2,36.6,35.0,32.7,30.5,28.5,26.6,24.9,23.6,22.5,21.7,21.0,20.4,20.4,21.0,22.0,23.5,25.7,28.4,30.7,32.5,33.8,34.7,35.1,35.0,34.4,32.9,31.0,29.2,27.8,26.5,25.4,24.2,23.1,22.3,21.3,20.4,20.1,20.8,22.2,23.9,26.1,28.6,30.8,32.3,33.6,34.4,34.8,34.9,34.5,33.3,31.6,29.9,28.3,26.6,25.3,24.4,23.7,23.1,22.0,20.8,20.5,21.5,23.3,25.6,28.4,31.6,34.3,36.2,37.5,38.4,38.7,38.4,37.6,35.8,33.5,31.6,30.5,29.7,29.0],"precipitation_probability":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,6,5,4,3,5,8,10,7,3,0,1,2,3,5,8,10,9,7,6,5,4,3,2,1,0,1,2,3,3,3,3,6,10,13,10,6,3,3,3,3,3,3,3,6,10,13,11,8,6,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]}
/// daily_units : {"time":"iso8601","temperature_2m_max":"°C","temperature_2m_min":"°C","sunrise":"iso8601","sunset":"iso8601","precipitation_probability_max":"%"}
/// daily : {"time":["2023-05-30","2023-05-31","2023-06-01","2023-06-02","2023-06-03","2023-06-04","2023-06-05","2023-06-06"],"temperature_2m_max":[33.6,37.6,39.6,42.0,37.2,35.1,34.9,38.7],"temperature_2m_min":[21.4,22.7,26.0,26.7,23.6,20.4,20.1,20.5],"sunrise":["2023-05-30T04:53","2023-05-31T04:53","2023-06-01T04:52","2023-06-02T04:52","2023-06-03T04:52","2023-06-04T04:52","2023-06-05T04:52","2023-06-06T04:52"],"sunset":["2023-05-30T18:51","2023-05-31T18:52","2023-06-01T18:52","2023-06-02T18:53","2023-06-03T18:53","2023-06-04T18:54","2023-06-05T18:54","2023-06-06T18:55"],"precipitation_probability_max":[0,0,10,13,13,0,0,0]}

class WeatherEntity extends Equatable {
  const WeatherEntity({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourlyList,
    this.dailyUnits,
    this.dailyList,
    this.dailyHourlyList,
    this.currentWeatherEntity,
  });

  final num? latitude;
  final num? longitude;
  final num? generationtimeMs;
  final num? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final num? elevation;
  final HourlyUnitsEntity? hourlyUnits;
  final HourlyListsEntity? hourlyList;
  final DailyUnitsEntity? dailyUnits;
  final DailyListsEntity? dailyList;
  final List<DailyHourlyEntity>? dailyHourlyList;
  final CurrentWeatherEntity? currentWeatherEntity;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        generationtimeMs,
        utcOffsetSeconds,
        timezone,
        timezoneAbbreviation,
        elevation,
        hourlyUnits,
        hourlyList,
        dailyUnits,
        dailyList,
        currentWeatherEntity
      ];
}

/// time : ["2023-05-30","2023-05-31","2023-06-01","2023-06-02","2023-06-03","2023-06-04","2023-06-05","2023-06-06"]
/// temperature_2m_max : [33.6,37.6,39.6,42.0,37.2,35.1,34.9,38.7]
/// temperature_2m_min : [21.4,22.7,26.0,26.7,23.6,20.4,20.1,20.5]
/// sunrise : ["2023-05-30T04:53","2023-05-31T04:53","2023-06-01T04:52","2023-06-02T04:52","2023-06-03T04:52","2023-06-04T04:52","2023-06-05T04:52","2023-06-06T04:52"]
/// sunset : ["2023-05-30T18:51","2023-05-31T18:52","2023-06-01T18:52","2023-06-02T18:53","2023-06-03T18:53","2023-06-04T18:54","2023-06-05T18:54","2023-06-06T18:55"]
/// precipitation_probability_max : [0,0,10,13,13,0,0,0]

class DailyListsEntity extends Equatable {
  const DailyListsEntity({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
    this.sunrise,
    this.sunset,
    this.precipitationProbabilityMax,
    this.weatherCode,
  });

  final List<String>? time;
  final List<num>? temperature2mMax;
  final List<num>? temperature2mMin;
  final List<String>? sunrise;
  final List<String>? sunset;
  final List<num?>? precipitationProbabilityMax;
  final List<num>? weatherCode;

  @override
  List<Object?> get props => [
        time,
        temperature2mMax,
        temperature2mMin,
        sunrise,
        sunset,
        precipitationProbabilityMax,
        weatherCode
      ];
}

class DailyEntity extends Equatable {
  const DailyEntity({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
    this.sunrise,
    this.sunset,
    this.precipitationProbabilityMax,
    this.weatherCode,
  });

  final String? time;
  final num? temperature2mMax;
  final num? temperature2mMin;
  final String? sunrise;
  final String? sunset;
  final num? precipitationProbabilityMax;
  final num? weatherCode;

  @override
  List<Object?> get props => [
        time,
        temperature2mMax,
        temperature2mMin,
        sunrise,
        sunset,
        precipitationProbabilityMax,
        weatherCode,
      ];
}

/// time : "iso8601"
/// temperature_2m_max : "°C"
/// temperature_2m_min : "°C"
/// sunrise : "iso8601"
/// sunset : "iso8601"
/// precipitation_probability_max : "%"

class DailyUnitsEntity extends Equatable {
  const DailyUnitsEntity({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
    this.sunrise,
    this.sunset,
    this.precipitationProbabilityMax,
    this.weatherCode,
  });

  final String? time;
  final String? temperature2mMax;
  final String? temperature2mMin;
  final String? sunrise;
  final String? sunset;
  final String? precipitationProbabilityMax;
  final String? weatherCode;

  @override
  List<Object?> get props => [
        time,
        temperature2mMax,
        temperature2mMin,
        sunrise,
        sunset,
        precipitationProbabilityMax,
        weatherCode,
      ];
}

/// time : ["2023-05-30T00:00","2023-05-30T01:00","2023-05-30T02:00","2023-05-30T03:00","2023-05-30T04:00","2023-05-30T05:00","2023-05-30T06:00","2023-05-30T07:00","2023-05-30T08:00","2023-05-30T09:00","2023-05-30T10:00","2023-05-30T11:00","2023-05-30T12:00","2023-05-30T13:00","2023-05-30T14:00","2023-05-30T15:00","2023-05-30T16:00","2023-05-30T17:00","2023-05-30T18:00","2023-05-30T19:00","2023-05-30T20:00","2023-05-30T21:00","2023-05-30T22:00","2023-05-30T23:00","2023-05-31T00:00","2023-05-31T01:00","2023-05-31T02:00","2023-05-31T03:00","2023-05-31T04:00","2023-05-31T05:00","2023-05-31T06:00","2023-05-31T07:00","2023-05-31T08:00","2023-05-31T09:00","2023-05-31T10:00","2023-05-31T11:00","2023-05-31T12:00","2023-05-31T13:00","2023-05-31T14:00","2023-05-31T15:00","2023-05-31T16:00","2023-05-31T17:00","2023-05-31T18:00","2023-05-31T19:00","2023-05-31T20:00","2023-05-31T21:00","2023-05-31T22:00","2023-05-31T23:00","2023-06-01T00:00","2023-06-01T01:00","2023-06-01T02:00","2023-06-01T03:00","2023-06-01T04:00","2023-06-01T05:00","2023-06-01T06:00","2023-06-01T07:00","2023-06-01T08:00","2023-06-01T09:00","2023-06-01T10:00","2023-06-01T11:00","2023-06-01T12:00","2023-06-01T13:00","2023-06-01T14:00","2023-06-01T15:00","2023-06-01T16:00","2023-06-01T17:00","2023-06-01T18:00","2023-06-01T19:00","2023-06-01T20:00","2023-06-01T21:00","2023-06-01T22:00","2023-06-01T23:00","2023-06-02T00:00","2023-06-02T01:00","2023-06-02T02:00","2023-06-02T03:00","2023-06-02T04:00","2023-06-02T05:00","2023-06-02T06:00","2023-06-02T07:00","2023-06-02T08:00","2023-06-02T09:00","2023-06-02T10:00","2023-06-02T11:00","2023-06-02T12:00","2023-06-02T13:00","2023-06-02T14:00","2023-06-02T15:00","2023-06-02T16:00","2023-06-02T17:00","2023-06-02T18:00","2023-06-02T19:00","2023-06-02T20:00","2023-06-02T21:00","2023-06-02T22:00","2023-06-02T23:00","2023-06-03T00:00","2023-06-03T01:00","2023-06-03T02:00","2023-06-03T03:00","2023-06-03T04:00","2023-06-03T05:00","2023-06-03T06:00","2023-06-03T07:00","2023-06-03T08:00","2023-06-03T09:00","2023-06-03T10:00","2023-06-03T11:00","2023-06-03T12:00","2023-06-03T13:00","2023-06-03T14:00","2023-06-03T15:00","2023-06-03T16:00","2023-06-03T17:00","2023-06-03T18:00","2023-06-03T19:00","2023-06-03T20:00","2023-06-03T21:00","2023-06-03T22:00","2023-06-03T23:00","2023-06-04T00:00","2023-06-04T01:00","2023-06-04T02:00","2023-06-04T03:00","2023-06-04T04:00","2023-06-04T05:00","2023-06-04T06:00","2023-06-04T07:00","2023-06-04T08:00","2023-06-04T09:00","2023-06-04T10:00","2023-06-04T11:00","2023-06-04T12:00","2023-06-04T13:00","2023-06-04T14:00","2023-06-04T15:00","2023-06-04T16:00","2023-06-04T17:00","2023-06-04T18:00","2023-06-04T19:00","2023-06-04T20:00","2023-06-04T21:00","2023-06-04T22:00","2023-06-04T23:00","2023-06-05T00:00","2023-06-05T01:00","2023-06-05T02:00","2023-06-05T03:00","2023-06-05T04:00","2023-06-05T05:00","2023-06-05T06:00","2023-06-05T07:00","2023-06-05T08:00","2023-06-05T09:00","2023-06-05T10:00","2023-06-05T11:00","2023-06-05T12:00","2023-06-05T13:00","2023-06-05T14:00","2023-06-05T15:00","2023-06-05T16:00","2023-06-05T17:00","2023-06-05T18:00","2023-06-05T19:00","2023-06-05T20:00","2023-06-05T21:00","2023-06-05T22:00","2023-06-05T23:00","2023-06-06T00:00","2023-06-06T01:00","2023-06-06T02:00","2023-06-06T03:00","2023-06-06T04:00","2023-06-06T05:00","2023-06-06T06:00","2023-06-06T07:00","2023-06-06T08:00","2023-06-06T09:00","2023-06-06T10:00","2023-06-06T11:00","2023-06-06T12:00","2023-06-06T13:00","2023-06-06T14:00","2023-06-06T15:00","2023-06-06T16:00","2023-06-06T17:00","2023-06-06T18:00","2023-06-06T19:00","2023-06-06T20:00","2023-06-06T21:00","2023-06-06T22:00","2023-06-06T23:00"]
/// temperature_2m : [23.5,23.0,22.1,21.8,21.4,21.4,21.6,23.2,26.5,29.1,31.1,31.7,33.0,33.6,33.5,33.5,33.5,32.8,32.1,31.0,27.8,26.4,25.6,25.0,24.5,24.0,23.2,22.8,22.7,22.7,23.3,25.6,28.2,30.6,32.8,34.5,35.9,37.0,37.5,37.6,37.6,37.2,36.5,35.1,32.3,30.7,29.4,29.3,28.4,28.3,28.2,27.8,26.0,26.0,26.7,27.8,30.9,34.7,37.0,38.1,37.8,39.2,39.1,39.6,37.3,37.0,36.2,35.4,33.8,32.4,31.5,31.0,30.7,30.0,29.9,29.9,27.7,26.7,27.6,30.3,34.0,37.6,39.6,41.5,42.0,41.7,40.0,39.9,39.3,38.1,37.9,36.8,35.4,34.1,32.9,31.0,29.0,26.9,25.2,24.4,23.9,23.6,23.8,24.7,26.4,28.5,31.0,33.1,34.7,35.9,36.7,37.1,37.2,36.6,35.0,32.7,30.5,28.5,26.6,24.9,23.6,22.5,21.7,21.0,20.4,20.4,21.0,22.0,23.5,25.7,28.4,30.7,32.5,33.8,34.7,35.1,35.0,34.4,32.9,31.0,29.2,27.8,26.5,25.4,24.2,23.1,22.3,21.3,20.4,20.1,20.8,22.2,23.9,26.1,28.6,30.8,32.3,33.6,34.4,34.8,34.9,34.5,33.3,31.6,29.9,28.3,26.6,25.3,24.4,23.7,23.1,22.0,20.8,20.5,21.5,23.3,25.6,28.4,31.6,34.3,36.2,37.5,38.4,38.7,38.4,37.6,35.8,33.5,31.6,30.5,29.7,29.0]
/// precipitation_probability : [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,6,5,4,3,5,8,10,7,3,0,1,2,3,5,8,10,9,7,6,5,4,3,2,1,0,1,2,3,3,3,3,6,10,13,10,6,3,3,3,3,3,3,3,6,10,13,11,8,6,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

class HourlyListsEntity extends Equatable {
  const HourlyListsEntity({
    this.time,
    this.temperature2m,
    this.precipitationProbability,
    this.temperatureFeelsLike,
    this.weatherCode,
    this.relativehumidity_2m,
    this.apparent_temperature,
    this.windspeed_10m,
    this.winddirection_10m,
    this.uv_index,
    this.is_day,
  });

  final List<String>? time;
  final List<num?>? temperature2m;
  final List<num?>? precipitationProbability;
  final List<num?>? temperatureFeelsLike;
  final List<num?>? weatherCode;
  final List<num?>? relativehumidity_2m;
  final List<num?>? apparent_temperature;
  final List<num?>? windspeed_10m;
  final List<num?>? winddirection_10m;
  final List<num?>? uv_index;
  final List<num?>? is_day;

  @override
  List<Object?> get props => [
        time,
        temperature2m,
        precipitationProbability,
        temperatureFeelsLike,
        weatherCode,
        relativehumidity_2m,
        apparent_temperature,
        windspeed_10m,
        winddirection_10m,
        uv_index,
    is_day,
      ];
}

class HourlyEntity extends Equatable {
  const HourlyEntity({
    this.time,
    this.temperature2m,
    this.temperatureFeelsLike,
    this.precipitationProbability,
    this.weatherCode,
    this.relativehumidity_2m,
    this.apparent_temperature,
    this.windspeed_10m,
    this.winddirection_10m,
    this.uv_index,
    this.is_day,
  });

  final String? time;
  final num? temperature2m;
  final num? precipitationProbability;
  final num? temperatureFeelsLike;
  final num? weatherCode;
  final num? relativehumidity_2m;
  final num? apparent_temperature;
  final num? windspeed_10m;
  final num? winddirection_10m;
  final num? uv_index;
  final num? is_day;

  @override
  List<Object?> get props => [
        time,
        temperature2m,
        precipitationProbability,
        temperatureFeelsLike,
        weatherCode,
        relativehumidity_2m,
        apparent_temperature,
        windspeed_10m,
        winddirection_10m,
        uv_index,
    is_day,
      ];
}

/// time : "iso8601"
/// temperature_2m : "°C"
/// precipitation_probability : "%"

class HourlyUnitsEntity extends Equatable {
  const HourlyUnitsEntity({
    this.time,
    this.temperature2m,
    this.precipitationProbability,
    this.weatherCode,
    this.relativehumidity_2m,
    this.apparent_temperature,
    this.windspeed_10m,
    this.winddirection_10m,
    this.uv_index,
  });

  final String? time;
  final String? temperature2m;
  final String? precipitationProbability;
  final String? weatherCode;
  final String? relativehumidity_2m;
  final String? apparent_temperature;
  final String? windspeed_10m;
  final String? winddirection_10m;
  final String? uv_index;

  @override
  List<Object?> get props => [
        time,
        temperature2m,
        precipitationProbability,
        weatherCode,
        relativehumidity_2m,
        apparent_temperature,
        windspeed_10m,
        winddirection_10m,
        uv_index,
      ];
}

class DailyHourlyEntity extends Equatable {
  final DailyEntity dailyEntity;
  final List<HourlyEntity> hourlyList;

  const DailyHourlyEntity(
      {required this.dailyEntity, required this.hourlyList});

  @override
  List<Object?> get props => [dailyEntity, hourlyList];
}

class CurrentWeatherEntity extends Equatable {
  final num? temperature;
  final num? windSpeed;
  final num? windDirection;
  final num? weatherCode;
  final String? time;
  final bool? isDay;

  const CurrentWeatherEntity(
      {this.temperature,
      this.time,
      this.windSpeed,
      this.weatherCode,
      this.windDirection,
      this.isDay});

  @override
  List<Object?> get props =>
      [temperature, time, windSpeed, weatherCode, windDirection, isDay];
}
