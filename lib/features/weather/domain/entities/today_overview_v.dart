import 'package:equatable/equatable.dart';

import 'day_weather.dart';

/// queryCost : 1
/// latitude : 30.0443
/// longitude : 31.2353
/// resolvedAddress : "القاهرة, مصر"
/// address : "cairo"
/// timezone : "Africa/Cairo"
/// tzoffset : 2.0
/// days : [{"datetime":"2023-02-17","datetimeEpoch":1676584800,"tempmax":18.0,"tempmin":9.0,"temp":13.9,"feelslikemax":18.0,"feelslikemin":8.5,"feelslike":13.8,"dew":6.6,"humidity":63.4,"precip":0.0,"precipprob":0.0,"precipcover":0.0,"preciptype":null,"snow":0.0,"snowdepth":0.0,"windgust":37.4,"windspeed":29.5,"winddir":31.7,"pressure":1026.8,"cloudcover":38.8,"visibility":9.8,"solarradiation":205.2,"solarenergy":17.7,"uvindex":7.0,"severerisk":10.0,"sunrise":"06:33:36","sunriseEpoch":1676608416,"sunset":"17:45:01","sunsetEpoch":1676648701,"moonphase":0.9,"conditions":"Partially cloudy","description":"Partly cloudy throughout the day.","icon":"partly-cloudy-day","stations":["HECA"],"source":"comb"}]
/// stations : {"HECA":{"distance":18512.0,"latitude":30.13,"longitude":31.4,"useCount":0,"id":"HECA","name":"HECA","quality":50,"contribution":0.0}}
/// currentConditions : {"datetime":"19:00:00","datetimeEpoch":1676653200,"temp":15.0,"feelslike":15.0,"humidity":54.9,"dew":6.0,"precip":0.0,"precipprob":0.0,"snow":0.0,"snowdepth":0.0,"preciptype":null,"windgust":null,"windspeed":25.9,"winddir":30.0,"pressure":1027.0,"visibility":10.0,"cloudcover":50.0,"solarradiation":0.0,"solarenergy":null,"uvindex":0.0,"conditions":"Partially cloudy","icon":"partly-cloudy-night","stations":["HECA"],"source":"obs","sunrise":"06:33:36","sunriseEpoch":1676608416,"sunset":"17:45:01","sunsetEpoch":1676648701,"moonphase":0.9}

class TodayOverviewV extends Equatable{
  TodayOverviewV({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.day,
    this.currentConditions,});
  
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  DayV? day;
  CurrentConditionsV? currentConditions;

  @override
  List<Object?> get props => [queryCost,
    latitude,
    longitude,
    resolvedAddress,
    address,
    timezone,
    tzoffset,
    day,
    currentConditions,];

}

/// datetime : "19:00:00"
/// datetimeEpoch : 1676653200
/// temp : 15.0
/// feelslike : 15.0
/// humidity : 54.9
/// dew : 6.0
/// precip : 0.0
/// precipprob : 0.0
/// snow : 0.0
/// snowdepth : 0.0
/// preciptype : null
/// windgust : null
/// windspeed : 25.9
/// winddir : 30.0
/// pressure : 1027.0
/// visibility : 10.0
/// cloudcover : 50.0
/// solarradiation : 0.0
/// solarenergy : null
/// uvindex : 0.0
/// conditions : "Partially cloudy"
/// icon : "partly-cloudy-night"
/// stations : ["HECA"]
/// source : "obs"
/// sunrise : "06:33:36"
/// sunriseEpoch : 1676608416
/// sunset : "17:45:01"
/// sunsetEpoch : 1676648701
/// moonphase : 0.9

class CurrentConditionsV extends Equatable{
  CurrentConditionsV({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.iconPath,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,});

  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  dynamic preciptype;
  dynamic windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  dynamic solarenergy;
  double? uvindex;
  String? conditions;
  String? iconPath;
  List<String>? stations;
  String? source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  CurrentConditionsV copyWith({  String? datetime,
    int? datetimeEpoch,
    double? temp,
    double? feelslike,
    double? humidity,
    double? dew,
    double? precip,
    double? precipprob,
    double? snow,
    double? snowdepth,
    dynamic preciptype,
    dynamic windgust,
    double? windspeed,
    double? winddir,
    double? pressure,
    double? visibility,
    double? cloudcover,
    double? solarradiation,
    dynamic solarenergy,
    double? uvindex,
    String? conditions,
    String? icon,
    List<String>? stations,
    String? source,
    String? sunrise,
    int? sunriseEpoch,
    String? sunset,
    int? sunsetEpoch,
    double? moonphase,
  }) => CurrentConditionsV(  datetime: datetime ?? this.datetime,
    datetimeEpoch: datetimeEpoch ?? this.datetimeEpoch,
    temp: temp ?? this.temp,
    feelslike: feelslike ?? this.feelslike,
    humidity: humidity ?? this.humidity,
    dew: dew ?? this.dew,
    precip: precip ?? this.precip,
    precipprob: precipprob ?? this.precipprob,
    snow: snow ?? this.snow,
    snowdepth: snowdepth ?? this.snowdepth,
    preciptype: preciptype ?? this.preciptype,
    windgust: windgust ?? this.windgust,
    windspeed: windspeed ?? this.windspeed,
    winddir: winddir ?? this.winddir,
    pressure: pressure ?? this.pressure,
    visibility: visibility ?? this.visibility,
    cloudcover: cloudcover ?? this.cloudcover,
    solarradiation: solarradiation ?? this.solarradiation,
    solarenergy: solarenergy ?? this.solarenergy,
    uvindex: uvindex ?? this.uvindex,
    conditions: conditions ?? this.conditions,
    iconPath: icon ?? this.iconPath,
    stations: stations ?? this.stations,
    source: source ?? this.source,
    sunrise: sunrise ?? this.sunrise,
    sunriseEpoch: sunriseEpoch ?? this.sunriseEpoch,
    sunset: sunset ?? this.sunset,
    sunsetEpoch: sunsetEpoch ?? this.sunsetEpoch,
    moonphase: moonphase ?? this.moonphase,
  );

  @override
  List<Object?> get props => [datetime,
    datetimeEpoch,
    temp,
    feelslike,
    humidity,
    dew,
    precip,
    precipprob,
    snow,
    snowdepth,
    preciptype,
    windgust,
    windspeed,
    winddir,
    pressure,
    visibility,
    cloudcover,
    solarradiation,
    solarenergy,
    uvindex,
    conditions,
    iconPath,
    stations,
    source,
    sunrise,
    sunriseEpoch,
    sunset,
    sunsetEpoch,
    moonphase,];

}


