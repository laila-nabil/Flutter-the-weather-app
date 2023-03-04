import '../../domain/entities/weather.dart';

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01n"

class WeatherModel extends Weather{
  WeatherModel({
    int? id,
    String? main,
    String? description,
    String? icon,
  }):super(id:id,
    main:main,
    description:description,
    icon:icon,
  );

  WeatherModel.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  WeatherModel copyWith({  int? id,
    String? main,
    String? description,
    String? icon,
  }) => WeatherModel(  id: id ?? this.id,
    main: main ?? this.main,
    description: description ?? this.description,
    icon: icon ?? this.icon,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

}