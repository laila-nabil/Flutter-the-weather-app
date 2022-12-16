part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}
class LocationInitialEvent extends LocationEvent{
  @override
  List<Object?> get props => [];
}

class GetLocationFromCoordinates extends LocationEvent{
  final GetLocationFromCoordinatesParams params;

  GetLocationFromCoordinates(this.params);

  @override
  List<Object?> get props => [params];
}

class AutoCompleteSearchLocation extends LocationEvent{
  final String input;

  AutoCompleteSearchLocation(this.input);

  @override
  List<Object?> get props => [input];
}

class SetLocation extends LocationEvent{
  final LocationEntity? location;

  SetLocation({this.location});

  @override
  List<Object?> get props => [location];
}
class GetCurrentLocation extends LocationEvent{

  @override
  List<Object?> get props => [];
}