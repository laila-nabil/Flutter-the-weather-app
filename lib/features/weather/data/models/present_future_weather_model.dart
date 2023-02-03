import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';

class PresentFutureWeatherModel extends PresentFutureWeather {
  PresentFutureWeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  }) : super(timezoneOffset: timezoneOffset, lon: lon, lat: lat, weather: []);

  final num? lat;
  final num? lon;
  final String? timezone;
  final int? timezoneOffset;
  final _CurrentModel? current;
  final List<_CurrentModel> hourly;
  final List<_DailyModel> daily;

  factory PresentFutureWeatherModel.fromJson(Map<String, dynamic> json) {
    return PresentFutureWeatherModel(
      lat: json["lat"],
      lon: json["lon"],
      timezone: json["timezone"],
      timezoneOffset: json["timezone_offset"],
      current: json["current"] == null
          ? null
          : _CurrentModel.fromJson(json["current"]),
      hourly: json["hourly"] == null
          ? []
          : List<_CurrentModel>.from(
              json["hourly"]!.map((x) => _CurrentModel.fromJson(x))),
      daily: json["daily"] == null
          ? []
          : List<_DailyModel>.from(
              json["daily"]!.map((x) => _DailyModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current?.toJson(),
        "hourly": hourly.map((x) => x.toJson()).toList(),
        "daily": daily.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        lat,
        lon,
        timezone,
        timezoneOffset,
        current,
        hourly,
        daily,
      ];
}

class _CurrentModel extends Current {
  _CurrentModel({
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
  }) : super(
            weather: weather,
            uvi: uvi,
            pop: pop,
            dewPoint: dewPoint,
            feelsLike: feelsLike,
            humidity: humidity,
            sunrise: sunrise,
            sunset: sunset,
            temp: temp,
            windDeg: windDeg,
            pressure: pressure,
            clouds: clouds,
            windSpeed: windSpeed,
            dt: dt,
            visibility: visibility,
            windGust: windGust);

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
  final List<_WeatherModel> weather;
  final num? windGust;
  final int? pop;

  factory _CurrentModel.fromJson(Map<String, dynamic> json) {
    return _CurrentModel(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      temp: json["temp"],
      feelsLike: json["feels_like"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"],
      uvi: json["uvi"],
      clouds: json["clouds"],
      visibility: json["visibility"],
      windSpeed: json["wind_speed"],
      windDeg: json["wind_deg"],
      weather: json["weather"] == null
          ? []
          : List<_WeatherModel>.from(
              json["weather"]!.map((x) => _WeatherModel.fromJson(x))),
      windGust: json["wind_gust"],
      pop: json["pop"],
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": weather.map((x) => x.toJson()).toList(),
        "wind_gust": windGust,
        "pop": pop,
      };

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        weather,
        windGust,
        pop,
      ];
}

class _WeatherModel extends PresentFutureWeatherDetails {
  _WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  }) : super(description: description, icon: icon, id: id, main: main);

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) {
    return _WeatherModel(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}

class _DailyModel extends Daily {
  _DailyModel({
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
  }) : super(
            windSpeed: windSpeed,
            dt: dt,
            clouds: clouds,
            pressure: pressure,
            windDeg: windDeg,
            temp: temp,
            sunset: sunset,
            sunrise: sunrise,
            humidity: humidity,
            feelsLike: feelsLike,
            dewPoint: dewPoint,
            moonPhase: moonPhase,
            moonrise: moonrise,
            moonset: moonset,
            pop: pop,
            uvi: uvi,
            weather: weather,
            windGust: windGust);

  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final num? moonPhase;
  final TempModel? temp;
  final FeelsLikeModel? feelsLike;
  final int? pressure;
  final int? humidity;
  final num? dewPoint;
  final num? windSpeed;
  final int? windDeg;
  final num? windGust;
  final List<_WeatherModel> weather;
  final int? clouds;
  final num? pop;
  final num? uvi;

  factory _DailyModel.fromJson(Map<String, dynamic> json) {
    return _DailyModel(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"],
      temp: json["temp"] == null ? null : TempModel.fromJson(json["temp"]),
      feelsLike: json["feels_like"] == null
          ? null
          : FeelsLikeModel.fromJson(json["feels_like"]),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"],
      windSpeed: json["wind_speed"],
      windDeg: json["wind_deg"],
      windGust: json["wind_gust"],
      weather: json["weather"] == null
          ? []
          : List<_WeatherModel>.from(
              json["weather"]!.map((x) => _WeatherModel.fromJson(x))),
      clouds: json["clouds"],
      pop: json["pop"],
      uvi: json["uvi"],
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": weather.map((x) => x.toJson()).toList(),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
      };

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        windGust,
        weather,
        clouds,
        pop,
        uvi,
      ];
}

class FeelsLikeModel extends FeelsLike {
  FeelsLikeModel({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  }) : super(night: night, morn: morn, eve: eve, day: day);

  final num? day;
  final num? night;
  final num? eve;
  final num? morn;

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModel(
      day: json["day"],
      night: json["night"],
      eve: json["eve"],
      morn: json["morn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };

  @override
  List<Object?> get props => [
        day,
        night,
        eve,
        morn,
      ];
}

class TempModel extends Temp {
  TempModel({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  }) : super(day: day, eve: eve, max: max, min: min, morn: morn, night: night);

  final num? day;
  final num? min;
  final num? max;
  final num? night;
  final num? eve;
  final num? morn;

  factory TempModel.fromJson(Map<String, dynamic> json) {
    return TempModel(
      day: json["day"],
      min: json["min"],
      max: json["max"],
      night: json["night"],
      eve: json["eve"],
      morn: json["morn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };

  @override
  List<Object?> get props => [
        day,
        min,
        max,
        night,
        eve,
        morn,
      ];
}
