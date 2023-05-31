part of 'location_bloc.dart';

enum LocationStatus {initial , loading , success, failure}

const defaultLocation =  LocationEntity(
    lat: 30.0444,
    lon: 31.2357,
    city: "Cairo",
    country: "Egypt",
    countryCode: "EG",
    timezone: "Africa/Cairo"///Africa and Cairo must start with capital letter
);
class LocationState extends Equatable {
  final LocationStatus status;
  final List<LocationEntity>? autoCompleteList;
  final LocationEntity userCurrentLocation;
  final Failure? failure;

  const LocationState({
    required this.status,
    this.autoCompleteList,
    this.userCurrentLocation = defaultLocation,
    this.failure,
  });

  @override
  List<Object?> get props => [status,
    autoCompleteList,
    userCurrentLocation,
    failure,];

}