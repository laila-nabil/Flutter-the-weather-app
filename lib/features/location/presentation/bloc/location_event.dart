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
  final void Function()? afterSuccess;
  const GetLocationFromCoordinates(this.params,{this.afterSuccess});

  @override
  List<Object?> get props => [params,afterSuccess];
}

class AutoCompleteSearchLocation extends LocationEvent{
  final String input;

  const AutoCompleteSearchLocation(this.input);

  @override
  List<Object?> get props => [input];
}

class SetLocation extends LocationEvent{
  final LocationEntity? location;
  final void Function()? afterSuccess;
  const SetLocation({this.location,this.afterSuccess});

  @override
  List<Object?> get props => [location,afterSuccess];
}
class GetCurrentLocation extends LocationEvent{
  final void Function()? afterSuccess;

  const GetCurrentLocation({this.afterSuccess});
  @override
  List<Object?> get props => [afterSuccess];
}