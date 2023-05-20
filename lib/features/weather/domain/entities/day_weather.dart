import 'package:equatable/equatable.dart';

/// datetime : "2023-02-17"
/// datetimeEpoch : 1676584800
/// tempmax : 18.0
/// tempmin : 9.0
/// temp : 13.9
/// feelslikemax : 18.0
/// feelslikemin : 8.5
/// feelslike : 13.8
/// dew : 6.6
/// humidity : 63.4
/// precip : 0.0
/// precipprob : 0.0
/// precipcover : 0.0
/// preciptype : null
/// snow : 0.0
/// snowdepth : 0.0
/// windgust : 37.4
/// windspeed : 29.5
/// winddir : 31.7
/// pressure : 1026.8
/// cloudcover : 38.8
/// visibility : 9.8
/// solarradiation : 205.2
/// solarenergy : 17.7
/// uvindex : 7.0
/// severerisk : 10.0
/// sunrise : "06:33:36"
/// sunriseEpoch : 1676608416
/// sunset : "17:45:01"
/// sunsetEpoch : 1676648701
/// moonphase : 0.9
/// conditions : "Partially cloudy"
/// description : "Partly cloudy throughout the day."
/// icon : "partly-cloudy-day"
/// stations : ["HECA"]
/// source : "comb"

class DayV extends Equatable{
  DayV({
    this.datetime,
    this.datetimeEpoch,
    this.tempmax,
    this.tempmin,
    this.temp,
    this.feelslikemax,
    this.feelslikemin,
    this.feelslike,
    this.dew,
    this.humidity,
    this.precip,
    this.precipprob,
    this.precipcover,
    this.preciptype,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.cloudcover,
    this.visibility,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.conditions,
    this.description,
    this.icon,
    this.stations,
    this.source,});

  String? datetime;
  int? datetimeEpoch;
  double? tempmax;
  double? tempmin;
  double? temp;
  double? feelslikemax;
  double? feelslikemin;
  double? feelslike;
  double? dew;
  double? humidity;
  double? precip;
  double? precipprob;
  double? precipcover;
  dynamic preciptype;
  double? snow;
  double? snowdepth;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? cloudcover;
  double? visibility;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  double? severerisk;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  String? conditions;
  String? description;
  String? icon;
  List<String>? stations;
  String? source;
  DayV copyWith({  String? datetime,
    int? datetimeEpoch,
    double? tempmax,
    double? tempmin,
    double? temp,
    double? feelslikemax,
    double? feelslikemin,
    double? feelslike,
    double? dew,
    double? humidity,
    double? precip,
    double? precipprob,
    double? precipcover,
    dynamic preciptype,
    double? snow,
    double? snowdepth,
    double? windgust,
    double? windspeed,
    double? winddir,
    double? pressure,
    double? cloudcover,
    double? visibility,
    double? solarradiation,
    double? solarenergy,
    double? uvindex,
    double? severerisk,
    String? sunrise,
    int? sunriseEpoch,
    String? sunset,
    int? sunsetEpoch,
    double? moonphase,
    String? conditions,
    String? description,
    String? icon,
    List<String>? stations,
    String? source,
  }) => DayV(  datetime: datetime ?? this.datetime,
    datetimeEpoch: datetimeEpoch ?? this.datetimeEpoch,
    tempmax: tempmax ?? this.tempmax,
    tempmin: tempmin ?? this.tempmin,
    temp: temp ?? this.temp,
    feelslikemax: feelslikemax ?? this.feelslikemax,
    feelslikemin: feelslikemin ?? this.feelslikemin,
    feelslike: feelslike ?? this.feelslike,
    dew: dew ?? this.dew,
    humidity: humidity ?? this.humidity,
    precip: precip ?? this.precip,
    precipprob: precipprob ?? this.precipprob,
    precipcover: precipcover ?? this.precipcover,
    preciptype: preciptype ?? this.preciptype,
    snow: snow ?? this.snow,
    snowdepth: snowdepth ?? this.snowdepth,
    windgust: windgust ?? this.windgust,
    windspeed: windspeed ?? this.windspeed,
    winddir: winddir ?? this.winddir,
    pressure: pressure ?? this.pressure,
    cloudcover: cloudcover ?? this.cloudcover,
    visibility: visibility ?? this.visibility,
    solarradiation: solarradiation ?? this.solarradiation,
    solarenergy: solarenergy ?? this.solarenergy,
    uvindex: uvindex ?? this.uvindex,
    severerisk: severerisk ?? this.severerisk,
    sunrise: sunrise ?? this.sunrise,
    sunriseEpoch: sunriseEpoch ?? this.sunriseEpoch,
    sunset: sunset ?? this.sunset,
    sunsetEpoch: sunsetEpoch ?? this.sunsetEpoch,
    moonphase: moonphase ?? this.moonphase,
    conditions: conditions ?? this.conditions,
    description: description ?? this.description,
    icon: icon ?? this.icon,
    stations: stations ?? this.stations,
    source: source ?? this.source,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [datetime,
    datetimeEpoch,
    tempmax,
    tempmin,
    temp,
    feelslikemax,
    feelslikemin,
    feelslike,
    dew,
    humidity,
    precip,
    precipprob,
    precipcover,
    preciptype,
    snow,
    snowdepth,
    windgust,
    windspeed,
    winddir,
    pressure,
    cloudcover,
    visibility,
    solarradiation,
    solarenergy,
    uvindex,
    severerisk,
    sunrise,
    sunriseEpoch,
    sunset,
    sunsetEpoch,
    moonphase,
    conditions,
    description,
    icon,
    stations,
    source,];

}