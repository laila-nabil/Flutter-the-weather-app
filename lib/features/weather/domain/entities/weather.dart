import 'package:equatable/equatable.dart';

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
  String get iconPath => "assets/3d/"+(icon??"")+".png";
  @override
  List<Object?> get props => [this.id,
    this.main,
    this.description,
    this.icon,];

}