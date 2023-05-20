import '../../domain/entities/today_overview.dart';
import 'weather_model.dart';

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

class TodayOverviewModel extends TodayOverview{
  TodayOverviewModel({
    CoordModel? coord,
    List<WeatherModel>? weather,
    String? base,
    MainModel? main,
    int? visibility,
    WindModel? wind,
    CloudsModel? clouds,
    int? dt,
    SysModel? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,}):super(coord:coord,
    weather:weather,
    base:base,
    main:main,
    visibility:visibility,
    wind:wind,
    clouds:clouds,
    dt:dt,
    sys:sys,
    timezone:timezone,
    id:id,
    name:name,
    cod:cod,
  );

  TodayOverviewModel.fromJson(dynamic json) {
    coord = json['coord'] != null ? CoordModel.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(WeatherModel.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? MainModel.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? WindModel.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? SysModel.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = (coord as CoordModel).toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => (v as WeatherModel).toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = (wind as WindModel).toJson();
    }
    if (clouds != null) {
      map['clouds'] = (clouds as CloudsModel).toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = (sys as SysModel).toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }

}

/// type : 1
/// id : 2514
/// country : "EG"
/// sunrise : 1675399472
/// sunset : 1675438383

class SysModel extends Sys{
  SysModel({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset, }):super(type:type,
    id:id,
    country:country,
    sunrise:sunrise,
    sunset:sunset,
  );

  SysModel.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;
SysModel copyWith({  int? type,
  int? id,
  String? country,
  int? sunrise,
  int? sunset,
}) => SysModel(  type: type ?? this.type,
  id: id ?? this.id,
  country: country ?? this.country,
  sunrise: sunrise ?? this.sunrise,
  sunset: sunset ?? this.sunset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}

/// all : 0

class CloudsModel extends Clouds {
  CloudsModel({
    int? all}):super(all:all);

  CloudsModel.fromJson(dynamic json) {
    all = json['all'];
  }
CloudsModel copyWith({  int? all,
}) => CloudsModel(  all: all ?? this.all,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }

}

/// speed : 1.54
/// deg : 280

class WindModel extends Wind{
  WindModel({
    double? speed,
    int? deg,}):super(speed: speed,deg:deg);

  WindModel.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  
WindModel copyWith({  double? speed,
  int? deg,
}) => WindModel(  speed: speed ?? this.speed,
  deg: deg ?? this.deg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }

}

/// temp : 16.33
/// feels_like : 15.09
/// temp_min : 15.7
/// temp_max : 16.33
/// pressure : 1021
/// humidity : 41

class MainModel extends Main {
  MainModel({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }):super(temp:temp,
    feelsLike:feelsLike,
    tempMin:tempMin,
    tempMax:tempMax,
    pressure:pressure,
    humidity:humidity,
  );

  MainModel.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

MainModel copyWith({  double? temp,
  double? feelsLike,
  double? tempMin,
  double? tempMax,
  int? pressure,
  int? humidity,
}) => MainModel(  temp: temp ?? this.temp,
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

}


/// lon : 31.2357
/// lat : 30.0444

class CoordModel extends Coord {
  CoordModel({
    double? lon,
    double? lat}):super(lon:lon,lat: lat);

  CoordModel.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

CoordModel copyWith({  double? lon,
  double? lat,
}) => CoordModel(  lon: lon ?? this.lon,
  lat: lat ?? this.lat,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}