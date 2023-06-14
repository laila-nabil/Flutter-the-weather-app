import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';

import '../../data/models/location_model.dart';
import '../entities/location.dart';

abstract class LocationRepo {
  Future<Either<Failure, LocationEntity>> getLocationFromCoordinates(
      {required GetLocationFromCoordinatesParams params});

  Future<Either<Failure, List<LocationEntity>>> autoCompleteSearchLocation(
      String input);

  Future<Either<Failure,Unit>> saveLocationLocally(LocationModel location);
  Future<Either<Failure,LocationEntity>> getSavedLocationLocally();
}
