part of 'location_bloc.dart';

enum LocationStatus {initial , loading , success, failure}
class LocationState extends Equatable {
  final LocationStatus status;
  final List<LocationEntity>? autoCompleteList;
  final LocationEntity? userCurrentLocation;
  final Failure? failure;

  const LocationState({
    required this.status,
    this.autoCompleteList,
    this.userCurrentLocation,
    this.failure,
  });

  @override
  List<Object?> get props => [status,
    autoCompleteList,
    userCurrentLocation,
    failure,];

}