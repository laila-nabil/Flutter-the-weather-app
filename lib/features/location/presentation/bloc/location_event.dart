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
  const GetLocationFromCoordinates(this.params);

  @override
  List<Object?> get props => [params];
}

class AutoCompleteSearchLocation extends LocationEvent{
  final String input;

  const AutoCompleteSearchLocation(this.input);

  @override
  List<Object?> get props => [input];
}

class SetLocation extends LocationEvent{
  final LocationEntity? location;
  final void Function()? goHomePage;
  const SetLocation({this.location,this.goHomePage});

  @override
  List<Object?> get props => [location,goHomePage];
}

class GetCurrentLocation extends LocationEvent{
  final void Function()? goHomePage;

  const GetCurrentLocation({this.goHomePage});
  @override
  List<Object?> get props => [goHomePage];
}