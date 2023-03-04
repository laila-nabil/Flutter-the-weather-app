
import 'package:equatable/equatable.dart';

import 'weather.dart';

/// lat : 30.0444
/// lon : 31.2357
/// timezone : "Africa/Cairo"
/// timezone_offset : 7200
/// current : {"dt":1674933743,"sunrise":1674881267,"sunset":1674919668,"temp":291.48,"feels_like":290.73,"pressure":1016,"humidity":52,"dew_point":281.46,"uvi":0,"clouds":0,"visibility":10000,"wind_speed":2.57,"wind_deg":80,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]}
/// hourly : [{"dt":1674932400,"temp":291.48,"feels_like":290.73,"pressure":1016,"humidity":52,"dew_point":281.46,"uvi":0,"clouds":0,"visibility":10000,"wind_speed":6.46,"wind_deg":44,"wind_gust":9.94,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1674936000,"temp":291.24,"feels_like":290.51,"pressure":1016,"humidity":54,"dew_point":281.8,"uvi":0,"clouds":20,"visibility":10000,"wind_speed":5.94,"wind_deg":46,"wind_gust":9.46,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"pop":0},{"dt":1674939600,"temp":290.81,"feels_like":290.12,"pressure":1016,"humidity":57,"dew_point":282.2,"uvi":0,"clouds":40,"visibility":10000,"wind_speed":5.45,"wind_deg":40,"wind_gust":8.94,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"pop":0},{"dt":1674943200,"temp":290.18,"feels_like":289.58,"pressure":1015,"humidity":63,"dew_point":283.09,"uvi":0,"clouds":60,"visibility":10000,"wind_speed":5.52,"wind_deg":32,"wind_gust":9.18,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1674946800,"temp":289.42,"feels_like":288.9,"pressure":1015,"humidity":69,"dew_point":283.73,"uvi":0,"clouds":80,"visibility":10000,"wind_speed":5.46,"wind_deg":36,"wind_gust":9.52,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1674950400,"temp":288.54,"feels_like":288.15,"pressure":1014,"humidity":77,"dew_point":284.44,"uvi":0,"clouds":98,"visibility":10000,"wind_speed":5.34,"wind_deg":42,"wind_gust":9.59,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"pop":0},{"dt":1674954000,"temp":288.12,"feels_like":287.76,"pressure":1014,"humidity":80,"dew_point":284.61,"uvi":0,"clouds":92,"visibility":10000,"wind_speed":5.28,"wind_deg":32,"wind_gust":9.28,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"pop":0},{"dt":1674957600,"temp":287.59,"feels_like":287.23,"pressure":1014,"humidity":82,"dew_point":284.48,"uvi":0,"clouds":93,"visibility":10000,"wind_speed":5.67,"wind_deg":29,"wind_gust":9.91,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"pop":0},{"dt":1674961200,"temp":287.27,"feels_like":286.9,"pressure":1014,"humidity":83,"dew_point":284.26,"uvi":0,"clouds":62,"visibility":10000,"wind_speed":5.71,"wind_deg":36,"wind_gust":10.49,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1674964800,"temp":287.17,"feels_like":286.77,"pressure":1014,"humidity":82,"dew_point":284.16,"uvi":0,"clouds":49,"visibility":10000,"wind_speed":5.45,"wind_deg":36,"wind_gust":10.35,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"pop":0},{"dt":1674968400,"temp":287.24,"feels_like":286.85,"pressure":1014,"humidity":82,"dew_point":284.07,"uvi":0,"clouds":59,"visibility":10000,"wind_speed":5.75,"wind_deg":37,"wind_gust":11.06,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"pop":0},{"dt":1674972000,"temp":287.91,"feels_like":287.48,"pressure":1015,"humidity":78,"dew_point":283.97,"uvi":0.39,"clouds":64,"visibility":10000,"wind_speed":6.15,"wind_deg":34,"wind_gust":11.16,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"pop":0},{"dt":1674975600,"temp":289.55,"feels_like":289.07,"pressure":1015,"humidity":70,"dew_point":283.95,"uvi":1.53,"clouds":100,"visibility":10000,"wind_speed":7.17,"wind_deg":44,"wind_gust":10.75,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1674979200,"temp":291.57,"feels_like":291.01,"pressure":1015,"humidity":59,"dew_point":283.45,"uvi":2.84,"clouds":97,"visibility":10000,"wind_speed":7.45,"wind_deg":49,"wind_gust":8.71,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1674982800,"temp":293.13,"feels_like":292.49,"pressure":1015,"humidity":50,"dew_point":282.51,"uvi":3.93,"clouds":98,"visibility":10000,"wind_speed":7.13,"wind_deg":45,"wind_gust":7.53,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1674986400,"temp":294.03,"feels_like":293.35,"pressure":1013,"humidity":45,"dew_point":281.67,"uvi":3.75,"clouds":98,"visibility":10000,"wind_speed":6.72,"wind_deg":47,"wind_gust":6.91,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1674990000,"temp":295.06,"feels_like":294.35,"pressure":1012,"humidity":40,"dew_point":280.95,"uvi":3.32,"clouds":98,"visibility":10000,"wind_speed":6.83,"wind_deg":49,"wind_gust":6.81,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1674993600,"temp":295.67,"feels_like":294.94,"pressure":1012,"humidity":37,"dew_point":280.38,"uvi":2.32,"clouds":96,"visibility":10000,"wind_speed":6.04,"wind_deg":51,"wind_gust":5.67,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1674997200,"temp":295.62,"feels_like":294.89,"pressure":1011,"humidity":37,"dew_point":279.98,"uvi":1.37,"clouds":99,"visibility":10000,"wind_speed":6.32,"wind_deg":46,"wind_gust":6.11,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1675000800,"temp":295.34,"feels_like":294.55,"pressure":1011,"humidity":36,"dew_point":279.6,"uvi":0.45,"clouds":98,"visibility":10000,"wind_speed":6.72,"wind_deg":48,"wind_gust":6.65,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1675004400,"temp":294.29,"feels_like":293.45,"pressure":1011,"humidity":38,"dew_point":279.57,"uvi":0,"clouds":98,"visibility":10000,"wind_speed":7.11,"wind_deg":47,"wind_gust":7.91,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"pop":0},{"dt":1675008000,"temp":292.74,"feels_like":291.85,"pressure":1012,"humidity":42,"dew_point":279.3,"uvi":0,"clouds":97,"visibility":10000,"wind_speed":7.3,"wind_deg":43,"wind_gust":9.62,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"pop":0},{"dt":1675011600,"temp":291.45,"feels_like":290.48,"pressure":1012,"humidity":44,"dew_point":279.07,"uvi":0,"clouds":80,"visibility":10000,"wind_speed":7.59,"wind_deg":44,"wind_gust":10.65,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1675015200,"temp":290.25,"feels_like":289.32,"pressure":1013,"humidity":50,"dew_point":279.58,"uvi":0,"clouds":71,"visibility":10000,"wind_speed":7.52,"wind_deg":40,"wind_gust":10.95,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1675018800,"temp":289.31,"feels_like":288.47,"pressure":1014,"humidity":57,"dew_point":280.77,"uvi":0,"clouds":7,"visibility":10000,"wind_speed":7.1,"wind_deg":35,"wind_gust":11.06,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1675022400,"temp":288.51,"feels_like":287.8,"pressure":1014,"humidity":65,"dew_point":281.74,"uvi":0,"clouds":6,"visibility":10000,"wind_speed":6.55,"wind_deg":31,"wind_gust":10.75,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1675026000,"temp":287.92,"feels_like":287.23,"pressure":1014,"humidity":68,"dew_point":281.94,"uvi":0,"clouds":4,"visibility":10000,"wind_speed":6.35,"wind_deg":29,"wind_gust":10.64,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1675029600,"temp":287.44,"feels_like":286.75,"pressure":1014,"humidity":70,"dew_point":281.84,"uvi":0,"clouds":3,"visibility":10000,"wind_speed":5.98,"wind_deg":27,"wind_gust":10.19,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1675033200,"temp":287.04,"feels_like":286.34,"pressure":1014,"humidity":71,"dew_point":281.65,"uvi":0,"clouds":11,"visibility":10000,"wind_speed":5.77,"wind_deg":24,"wind_gust":9.87,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"pop":0},{"dt":1675036800,"temp":286.64,"feels_like":285.92,"pressure":1013,"humidity":72,"dew_point":281.57,"uvi":0,"clouds":12,"visibility":10000,"wind_speed":5.54,"wind_deg":23,"wind_gust":9.62,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"pop":0},{"dt":1675040400,"temp":286.27,"feels_like":285.57,"pressure":1013,"humidity":74,"dew_point":281.7,"uvi":0,"clouds":20,"visibility":10000,"wind_speed":5.23,"wind_deg":23,"wind_gust":9.03,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"pop":0},{"dt":1675044000,"temp":285.97,"feels_like":285.32,"pressure":1013,"humidity":77,"dew_point":281.98,"uvi":0,"clouds":53,"visibility":10000,"wind_speed":5.25,"wind_deg":22,"wind_gust":8.99,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1675047600,"temp":285.7,"feels_like":285.1,"pressure":1013,"humidity":80,"dew_point":282.27,"uvi":0,"clouds":56,"visibility":10000,"wind_speed":4.9,"wind_deg":23,"wind_gust":8.44,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"pop":0},{"dt":1675051200,"temp":285.52,"feels_like":284.93,"pressure":1014,"humidity":81,"dew_point":282.34,"uvi":0,"clouds":42,"visibility":10000,"wind_speed":4.47,"wind_deg":24,"wind_gust":7.67,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"pop":0},{"dt":1675054800,"temp":285.4,"feels_like":284.82,"pressure":1014,"humidity":82,"dew_point":282.3,"uvi":0,"clouds":54,"visibility":10000,"wind_speed":4.28,"wind_deg":23,"wind_gust":7.2,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"pop":0},{"dt":1675058400,"temp":286.18,"feels_like":285.55,"pressure":1014,"humidity":77,"dew_point":282.09,"uvi":0.53,"clouds":54,"visibility":10000,"wind_speed":4.53,"wind_deg":20,"wind_gust":7.34,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"pop":0},{"dt":1675062000,"temp":287.82,"feels_like":287.12,"pressure":1015,"humidity":68,"dew_point":281.84,"uvi":1.46,"clouds":3,"visibility":10000,"wind_speed":4.79,"wind_deg":22,"wind_gust":6.83,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675065600,"temp":289.55,"feels_like":288.79,"pressure":1015,"humidity":59,"dew_point":281.57,"uvi":2.68,"clouds":3,"visibility":10000,"wind_speed":4.88,"wind_deg":25,"wind_gust":6.26,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675069200,"temp":291.08,"feels_like":290.26,"pressure":1014,"humidity":51,"dew_point":280.65,"uvi":3.7,"clouds":3,"visibility":10000,"wind_speed":5.05,"wind_deg":23,"wind_gust":5.65,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675072800,"temp":292.4,"feels_like":291.48,"pressure":1013,"humidity":42,"dew_point":279.25,"uvi":4,"clouds":3,"visibility":10000,"wind_speed":4.63,"wind_deg":16,"wind_gust":5.05,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675076400,"temp":293.45,"feels_like":292.5,"pressure":1012,"humidity":37,"dew_point":278.33,"uvi":3.54,"clouds":3,"visibility":10000,"wind_speed":3.93,"wind_deg":7,"wind_gust":4.55,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675080000,"temp":294.28,"feels_like":293.34,"pressure":1012,"humidity":34,"dew_point":277.62,"uvi":2.49,"clouds":2,"visibility":10000,"wind_speed":3.62,"wind_deg":354,"wind_gust":4.59,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675083600,"temp":294.74,"feels_like":293.74,"pressure":1011,"humidity":30,"dew_point":276.65,"uvi":1.26,"clouds":0,"visibility":10000,"wind_speed":3.47,"wind_deg":336,"wind_gust":4.58,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675087200,"temp":294.7,"feels_like":293.67,"pressure":1011,"humidity":29,"dew_point":275.71,"uvi":0.42,"clouds":0,"visibility":10000,"wind_speed":4.45,"wind_deg":315,"wind_gust":4.89,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675090800,"temp":293.71,"feels_like":292.6,"pressure":1012,"humidity":30,"dew_point":275.52,"uvi":0,"clouds":0,"visibility":10000,"wind_speed":5.79,"wind_deg":303,"wind_gust":6.11,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"pop":0},{"dt":1675094400,"temp":292.05,"feels_like":290.94,"pressure":1012,"humidity":36,"dew_point":276.42,"uvi":0,"clouds":0,"visibility":10000,"wind_speed":5.83,"wind_deg":312,"wind_gust":7.78,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1675098000,"temp":290.43,"feels_like":289.31,"pressure":1013,"humidity":42,"dew_point":277.36,"uvi":0,"clouds":0,"visibility":10000,"wind_speed":6.51,"wind_deg":345,"wind_gust":8.62,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0},{"dt":1675101600,"temp":289.32,"feels_like":288.27,"pressure":1014,"humidity":49,"dew_point":278.37,"uvi":0,"clouds":0,"visibility":10000,"wind_speed":4.83,"wind_deg":359,"wind_gust":6.81,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"pop":0}]
/// daily : [{"dt":1674900000,"sunrise":1674881267,"sunset":1674919668,"moonrise":1674896880,"moonset":0,"moon_phase":0.25,"temp":{"day":296.02,"min":290.06,"max":297.4,"night":290.81,"eve":293.62,"morn":290.4},"feels_like":{"day":294.78,"night":290.12,"eve":292.69,"morn":288.81},"pressure":1013,"humidity":16,"dew_point":268.69,"wind_speed":7.32,"wind_deg":35,"wind_gust":11.8,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":87,"pop":0,"uvi":4.77},{"dt":1674986400,"sunrise":1674967639,"sunset":1675006121,"moonrise":1674985260,"moonset":1674945600,"moon_phase":0.27,"temp":{"day":294.03,"min":287.17,"max":295.67,"night":287.92,"eve":292.74,"morn":287.17},"feels_like":{"day":293.35,"night":287.23,"eve":291.85,"morn":286.77},"pressure":1013,"humidity":45,"dew_point":281.67,"wind_speed":7.59,"wind_deg":44,"wind_gust":11.16,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":98,"pop":0,"uvi":3.93},{"dt":1675072800,"sunrise":1675054008,"sunset":1675092573,"moonrise":1675073820,"moonset":1675035600,"moon_phase":0.31,"temp":{"day":292.4,"min":285.4,"max":294.74,"night":287.28,"eve":292.05,"morn":285.52},"feels_like":{"day":291.48,"night":286.21,"eve":290.94,"morn":284.93},"pressure":1013,"humidity":42,"dew_point":279.25,"wind_speed":6.51,"wind_deg":345,"wind_gust":10.19,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":3,"pop":0,"uvi":4},{"dt":1675159200,"sunrise":1675140376,"sunset":1675179026,"moonrise":1675162620,"moonset":1675125480,"moon_phase":0.34,"temp":{"day":289.72,"min":285.02,"max":290.69,"night":287.88,"eve":289.73,"morn":285.28},"feels_like":{"day":288.48,"night":286.69,"eve":288.59,"morn":283.75},"pressure":1013,"humidity":40,"dew_point":275.96,"wind_speed":8.9,"wind_deg":266,"wind_gust":11.39,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"clouds":12,"pop":0.16,"uvi":3.1},{"dt":1675245600,"sunrise":1675226743,"sunset":1675265479,"moonrise":1675251720,"moonset":1675215360,"moon_phase":0.37,"temp":{"day":289.06,"min":285.15,"max":290.39,"night":285.53,"eve":287.99,"morn":285.15},"feels_like":{"day":287.83,"night":283.97,"eve":286.89,"morn":283.74},"pressure":1015,"humidity":43,"dew_point":276.53,"wind_speed":11.19,"wind_deg":274,"wind_gust":13.29,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":5,"pop":0.62,"rain":0.67,"uvi":2.9},{"dt":1675332000,"sunrise":1675313108,"sunset":1675351931,"moonrise":1675341120,"moonset":1675305000,"moon_phase":0.4,"temp":{"day":288.09,"min":283.26,"max":291.49,"night":286.44,"eve":289.62,"morn":283.26},"feels_like":{"day":286.66,"night":285.26,"eve":288.31,"morn":281.76},"pressure":1023,"humidity":39,"dew_point":274.39,"wind_speed":5.64,"wind_deg":312,"wind_gust":11.08,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":100,"pop":0,"uvi":3.83},{"dt":1675418400,"sunrise":1675399472,"sunset":1675438383,"moonrise":1675430760,"moonset":1675394400,"moon_phase":0.43,"temp":{"day":288.22,"min":284.45,"max":290.17,"night":286.83,"eve":290.17,"morn":284.45},"feels_like":{"day":286.93,"night":285.14,"eve":288.76,"morn":283.23},"pressure":1023,"humidity":44,"dew_point":275.98,"wind_speed":2.52,"wind_deg":284,"wind_gust":3.02,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"clouds":81,"pop":0,"uvi":4},{"dt":1675504800,"sunrise":1675485835,"sunset":1675524835,"moonrise":1675520520,"moonset":1675483500,"moon_phase":0.46,"temp":{"day":290.03,"min":284.32,"max":292.25,"night":287.56,"eve":291.52,"morn":284.32},"feels_like":{"day":288.43,"night":286,"eve":290.04,"morn":282.56},"pressure":1019,"humidity":25,"dew_point":269.88,"wind_speed":4.57,"wind_deg":255,"wind_gust":5.61,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":95,"pop":0,"uvi":4}]

class PresentFutureWeather extends Equatable{
  PresentFutureWeather({
      this.lat, 
      this.lon, 
      this.timezone, 
      this.timezoneOffset, 
      this.current, 
      this.hourly, 
      this.daily,});

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  @override
  List<Object?> get props => [this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,];



}

/// dt : 1674900000
/// sunrise : 1674881267
/// sunset : 1674919668
/// moonrise : 1674896880
/// moonset : 0
/// moon_phase : 0.25
/// temp : {"day":296.02,"min":290.06,"max":297.4,"night":290.81,"eve":293.62,"morn":290.4}
/// feels_like : {"day":294.78,"night":290.12,"eve":292.69,"morn":288.81}
/// pressure : 1013
/// humidity : 16
/// dew_point : 268.69
/// wind_speed : 7.32
/// wind_deg : 35
/// wind_gust : 11.8
/// weather : [{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}]
/// clouds : 87
/// pop : 0
/// uvi : 4.77

class Daily extends Equatable{
  Daily({
      this.dt, 
      this.sunrise, 
      this.sunset, 
      this.moonrise, 
      this.moonset, 
      this.moonPhase, 
      this.temp, 
      this.feelsLike, 
      this.pressure, 
      this.humidity, 
      this.dewPoint, 
      this.windSpeed, 
      this.windDeg, 
      this.windGust, 
      this.weather, 
      this.clouds, 
      this.pop, 
      this.uvi,});

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  int? pop;
  double? uvi;


  @override
  List<Object?> get props => [this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,];

}


/// day : 294.78
/// night : 290.12
/// eve : 292.69
/// morn : 288.81

class FeelsLike extends Equatable {
  FeelsLike({
      this.day, 
      this.night, 
      this.eve, 
      this.morn,});

  double? day;
  double? night;
  double? eve;
  double? morn;

  @override
  List<Object?> get props => [this.day,
    this.night,
    this.eve,
    this.morn,];


}

/// day : 296.02
/// min : 290.06
/// max : 297.4
/// night : 290.81
/// eve : 293.62
/// morn : 290.4

class Temp extends Equatable{
  Temp({
      this.day, 
      this.min, 
      this.max, 
      this.night, 
      this.eve, 
      this.morn,});

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  @override
  List<Object?> get props => [this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,];


}

/// dt : 1674932400
/// temp : 291.48
/// feels_like : 290.73
/// pressure : 1016
/// humidity : 52
/// dew_point : 281.46
/// uvi : 0
/// clouds : 0
/// visibility : 10000
/// wind_speed : 6.46
/// wind_deg : 44
/// wind_gust : 9.94
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]
/// pop : 0

class Hourly extends Equatable{
  Hourly({
      this.dt, 
      this.temp, 
      this.feelsLike, 
      this.pressure, 
      this.humidity, 
      this.dewPoint, 
      this.uvi, 
      this.clouds, 
      this.visibility, 
      this.windSpeed, 
      this.windDeg, 
      this.windGust, 
      this.weather, 
      this.pop,});

  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? pop;


  @override
  List<Object?> get props => [this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,];

}


/// dt : 1674933743
/// sunrise : 1674881267
/// sunset : 1674919668
/// temp : 291.48
/// feels_like : 290.73
/// pressure : 1016
/// humidity : 52
/// dew_point : 281.46
/// uvi : 0
/// clouds : 0
/// visibility : 10000
/// wind_speed : 2.57
/// wind_deg : 80
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]

class Current extends Equatable {
  Current({
      this.dt, 
      this.sunrise, 
      this.sunset, 
      this.temp, 
      this.feelsLike, 
      this.pressure, 
      this.humidity, 
      this.dewPoint, 
      this.uvi, 
      this.clouds, 
      this.visibility, 
      this.windSpeed, 
      this.windDeg, 
      this.weather,});

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  List<Weather>? weather;

  @override
  List<Object?> get props => [this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,];
}