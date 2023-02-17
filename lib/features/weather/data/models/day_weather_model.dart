
import '../../domain/entities/day_weather.dart';

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

class DayModel extends Day{
  DayModel({String? datetime,
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
    String? source,}):super(
    datetime:datetime,
    datetimeEpoch:datetimeEpoch,
    tempmax:tempmax,
    tempmin:tempmin,
    temp:temp,
    feelslikemax:feelslikemax,
    feelslikemin:feelslikemin,
    feelslike:feelslike,
    dew:dew,
    humidity:humidity,
    precip:precip,
    precipprob:precipprob,
    precipcover:precipcover,
    preciptype:preciptype,
    snow:snow,
    snowdepth:snowdepth,
    windgust:windgust,
    windspeed:windspeed,
    winddir:winddir,
    pressure:pressure,
    cloudcover:cloudcover,
    visibility:visibility,
    solarradiation:solarradiation,
    solarenergy:solarenergy,
    uvindex:uvindex,
    severerisk:severerisk,
    sunrise:sunrise,
    sunriseEpoch:sunriseEpoch,
    sunset:sunset,
    sunsetEpoch:sunsetEpoch,
    moonphase:moonphase,
    conditions:conditions,
    description:description,
    icon:icon,
    stations:stations,
    source:source,
  );

  DayModel.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    preciptype = json['preciptype'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    source = json['source'];
  }

  DayModel copyWith({  String? datetime,
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
  }) => DayModel(  datetime: datetime ?? this.datetime,
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
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['tempmax'] = tempmax;
    map['tempmin'] = tempmin;
    map['temp'] = temp;
    map['feelslikemax'] = feelslikemax;
    map['feelslikemin'] = feelslikemin;
    map['feelslike'] = feelslike;
    map['dew'] = dew;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['precipcover'] = precipcover;
    map['preciptype'] = preciptype;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['cloudcover'] = cloudcover;
    map['visibility'] = visibility;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['severerisk'] = severerisk;
    map['sunrise'] = sunrise;
    map['sunriseEpoch'] = sunriseEpoch;
    map['sunset'] = sunset;
    map['sunsetEpoch'] = sunsetEpoch;
    map['moonphase'] = moonphase;
    map['conditions'] = conditions;
    map['description'] = description;
    map['icon'] = icon;
    map['stations'] = stations;
    map['source'] = source;
    return map;
  }

}