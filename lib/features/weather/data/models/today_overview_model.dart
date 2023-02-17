import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview.dart';

import 'day_weather_model.dart';

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

class TodayOverviewModel extends TodayOverview{
  TodayOverviewModel({
    int? queryCost,
    double? latitude,
    double? longitude,
    String? resolvedAddress,
    String? address,
    String? timezone,
    double? tzoffset,
    DayModel? day,
    CurrentConditions? currentConditions,}):super(
    latitude: latitude,
    longitude: longitude,
    timezone: timezone,
    day: day,
    address: address,
    currentConditions: currentConditions,
    queryCost: queryCost,
    resolvedAddress: resolvedAddress,
    tzoffset: tzoffset
  );

  TodayOverviewModel.fromJson(dynamic json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    if (json['days'] != null) {
      List<DayModel> days = [];
      json['days'].forEach((v) {
        days.add(DayModel.fromJson(v));
      });
      day = days.tryFirst;
    }
    currentConditions = json['currentConditions'] != null ? CurrentConditionsModel.fromJson(json['currentConditions']) : null;
  }

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

class CurrentConditionsModel extends CurrentConditions {
  CurrentConditionsModel({
    String? datetime,
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
    double? moonphase,}):super(
    visibility: visibility,
    pressure: pressure,
    temp: temp,
    sunset: sunset,
    sunrise: sunrise,
    humidity: humidity,
    iconPath: icon,
    cloudcover: cloudcover,
    conditions: conditions,
    datetime: datetime,
    datetimeEpoch:datetimeEpoch,
    dew:dew,
    feelslike:feelslike,
    moonphase:moonphase ,
    precip:precip ,
    precipprob:precipprob ,
    preciptype:preciptype ,
    snow: snow,
    snowdepth:snowdepth ,
    solarenergy:solarenergy ,
    solarradiation:solarradiation ,
    source:source ,
    stations:stations ,
    sunriseEpoch:sunriseEpoch ,
    sunsetEpoch:sunsetEpoch ,
    uvindex:uvindex ,
    winddir:winddir ,
    windgust:windgust ,
    windspeed:windspeed ,
    
  );

  CurrentConditionsModel.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    conditions = json['conditions'];
    iconPath = AppAssets.VisualCrossingFolder +"/${json['icon']}.png";
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    source = json['source'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
  }
  CurrentConditionsModel copyWith({  String? datetime,
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
}) => CurrentConditionsModel(  datetime: datetime ?? this.datetime,
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
  icon: icon ?? this.iconPath,
  stations: stations ?? this.stations,
  source: source ?? this.source,
  sunrise: sunrise ?? this.sunrise,
  sunriseEpoch: sunriseEpoch ?? this.sunriseEpoch,
  sunset: sunset ?? this.sunset,
  sunsetEpoch: sunsetEpoch ?? this.sunsetEpoch,
  moonphase: moonphase ?? this.moonphase,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['temp'] = temp;
    map['feelslike'] = feelslike;
    map['humidity'] = humidity;
    map['dew'] = dew;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['preciptype'] = preciptype;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['visibility'] = visibility;
    map['cloudcover'] = cloudcover;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['conditions'] = conditions;
    map['icon'] = iconPath;
    map['stations'] = stations;
    map['source'] = source;
    map['sunrise'] = sunrise;
    map['sunriseEpoch'] = sunriseEpoch;
    map['sunset'] = sunset;
    map['sunsetEpoch'] = sunsetEpoch;
    map['moonphase'] = moonphase;
    return map;
  }

}
