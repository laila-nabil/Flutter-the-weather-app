import 'package:equatable/equatable.dart';

///timezone example: Africa/Cairo where Africa and Cairo must start with capital letter
class LocationEntity extends Equatable {
  final double? lon;
  final double? lat;
  final String? city;
  final String? country;
  final String? countryCode;
  final String? timezone;

  const LocationEntity({
    required this.lon,
    required this.lat,
    required this.city,
    required this.countryCode,
    required this.country,
    required this.timezone,
  });

  @override
  List<Object?> get props => [lat, lon, city, country,countryCode,timezone];
}
