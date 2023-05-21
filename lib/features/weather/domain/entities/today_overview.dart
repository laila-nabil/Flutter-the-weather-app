import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/features/weather/domain/entities/unix.dart';

import 'weather.dart';

/// coord : {"lon":31.2357,"lat":30.0444}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]
/// base : "stations"
/// main : {"temp":16.33,"feels_like":15.09,"temp_min":15.7,"temp_max":16.33,"pressure":1021,"humidity":41}
/// visibility : 10000
/// wind : {"speed":1.54,"deg":280}
/// clouds : {"all":0}
/// dt : 1675448724
/// sys : {"type":1,"id":2514,"country":"EG","sunrise":1675399472,"sunset":1675438383}
/// timezone : 7200
/// id : 7922173
/// name : "Al ‘Atabah"
/// cod : 200

class TodayOverview extends Equatable{
  TodayOverview({
      this.coord, 
      this.weather, 
      this.base, 
      this.main, 
      this.visibility, 
      this.wind, 
      this.clouds, 
      this.dt, 
      this.sys, 
      this.timezone, 
      this.id, 
      this.name, 
      this.cod,});

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;


  @override
  List<Object?> get props => [coord,
    weather,
    base,
    main,
    visibility,
    wind,
    clouds,
    dt,
    sys,
    timezone,
    id,
    name,
    cod,];

}

/// type : 1
/// id : 2514
/// country : "EG"
/// sunrise : 1675399472
/// sunset : 1675438383

class Sys extends Equatable{
  Sys({
      this.type, 
      this.id, 
      this.country, 
      this.sunrise, 
      this.sunset,});

  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;


  String? get getSunset => sunset == null ? null : unixSecondsToDateFormat(sunset!);
  String? get getSunrise => sunrise == null ? null : unixSecondsToDateFormat(sunrise!);
  @override
  List<Object?> get props => [type,
    id,
    country,
    sunrise,
    sunset,];

}

/// all : 0

class Clouds extends Equatable {
  Clouds({
      this.all,});

  int? all;

  @override
  List<Object?> get props => [all];

}

/// speed : 1.54
/// deg : 280

class Wind extends Equatable{
  Wind({
      this.speed, 
      this.deg,});

  double? speed;
  int? deg;

  String get windDirection
  {
    final directionsEn = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"];
    // final directionsAr = ["شمال","شمال","شمال شرق","شرق","شرق","شرق","جنوب شرق","جنوب","جنوب","جنوب","جنوب غرب","غرب","غرب","غرب","شمال غرب","شمال","شمال"];
    final directionsAr = ["ش","ش","ش ق","ق","ق","ق","ج ق","ج","ج","ج","ج غ","غ","غ","غ","ش غ","ش","ش"];
    var deg_ = deg ?? 0;
    final result = 'lang'.tr().contains('EN')? directionsEn[(deg_/22.5).round()] : directionsAr[(deg_/22.5).round()];
    return  result;
  }

  @override
  List<Object?> get props => [speed,deg];

}

/// temp : 16.33
/// feels_like : 15.09
/// temp_min : 15.7
/// temp_max : 16.33
/// pressure : 1021
/// humidity : 41

class Main extends Equatable {
  Main({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.humidity,});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
Main copyWith({  double? temp,
  double? feelsLike,
  double? tempMin,
  double? tempMax,
  int? pressure,
  int? humidity,
}) => Main(  temp: temp ?? this.temp,
  feelsLike: feelsLike ?? this.feelsLike,
  tempMin: tempMin ?? this.tempMin,
  tempMax: tempMax ?? this.tempMax,
  pressure: pressure ?? this.pressure,
  humidity: humidity ?? this.humidity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }

  @override
  List<Object?> get props => [temp,
    feelsLike,
    tempMin,
    tempMax,
    pressure,
    humidity,];

}


/// lon : 31.2357
/// lat : 30.0444

class Coord extends Equatable{
  Coord({
      this.lon, 
      this.lat,});

  double? lon;
  double? lat;


  @override
  List<Object?> get props => [lat,lon];

}