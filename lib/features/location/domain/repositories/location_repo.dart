import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates.dart';

abstract class LocationRepo{
  Future<Either<Failure,String>> getLocationFromCoordinates({required GetLocationFromCoordinatesParams params});
}