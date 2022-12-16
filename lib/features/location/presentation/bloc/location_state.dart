part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {
  final LocationEvent event;

  LocationLoading(this.event);

  @override
  List<Object> get props => [event];
}

class LocationSuccess extends LocationState {
  final LocationEvent event;
  final List<LocationEntity>? autoCompleteSearchLocation;
  final String? locationFromCoordinates;
  final LocationEntity? userCurrentLocation;

  LocationSuccess(this.event,
      {this.autoCompleteSearchLocation,
      this.locationFromCoordinates,
      this.userCurrentLocation});

  @override
  List<Object?> get props => [
        event,
        autoCompleteSearchLocation,
        locationFromCoordinates,
        userCurrentLocation
      ];
}

class LocationFailure extends LocationState {
  final LocationEvent event;
  final Failure failure;

  LocationFailure(this.event, {required this.failure});

  @override
  List<Object> get props => [event, failure];
}

class SetLocationState extends LocationState {
  final LocationEntity? location;

  SetLocationState({this.location});

  @override
  List<Object?> get props => [location];
}
