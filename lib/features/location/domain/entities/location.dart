import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double? lon;
  final double? lat;
  final String? city;
  final String? country;
  final String? countryCode;
  final String? timezone;

  const LocationEntity(
      {this.lon,
      this.lat,
      this.city,
      this.countryCode,
      this.country,
      this.timezone,
      });

  @override
  List<Object?> get props => [lat, lon, city, country,countryCode,timezone];
}
