import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  String? lon;
  String? lat;
  String? city;
  String? country;
  String? countryCode;
  LocationEntity(
      {this.lon,
      this.lat,
      this.city,
      this.countryCode,
      this.country});

  @override
  List<Object?> get props => [lat, lon, city, country,countryCode];
}
