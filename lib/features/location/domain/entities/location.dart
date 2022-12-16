import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  String? lon;
  String? lat;
  String? city;
  String? country;

  LocationEntity(
      {this.lon,
      this.lat,
      this.city,
      this.country});

  @override
  List<Object?> get props => [lat, lon, city, country];
}
