import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  double? lon;
  double? lat;
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
