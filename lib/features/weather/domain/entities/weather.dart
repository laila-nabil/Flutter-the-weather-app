import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01n"

///todo model and entity
class Weather extends Equatable{
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  int? id;
  String? main;
  String? description;
  String? icon;

  String iconPath(bool isNetwork) =>
      isNetwork ? "${AppAssets.Icon3dPath}/${icon ?? ""}.png" : icon.toString();
  @override
  List<Object?> get props => [id,
    main,
    description,
    icon,];

}