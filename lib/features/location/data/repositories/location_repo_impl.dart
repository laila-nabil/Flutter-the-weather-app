import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/exceptions.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:the_weather_app/features/location/data/models/location_model.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepoImpl(this.locationRemoteDataSource);

  @override
  Future<Either<Failure, LocationModel>> getLocationFromCoordinates(
      {required GetLocationFromCoordinatesParams params}) async {
    try {
      final result = await locationRemoteDataSource.getLocationFromCoordinates(
          params: params);
      return Right(result);
    } catch (error) {
      if (error is ServerException) {
        return Left(
            ServerFailure(message: error.message ?? "An error occurred"));
      }
      return const Left(ServerFailure(message: "An error occurred"));
    }
  }

  @override
  Future<Either<Failure, List<LocationModel>>> autoCompleteSearchLocation(
      String input) async {
    try {
      final result =
          await locationRemoteDataSource.autoCompleteSearchLocation(input);
      return Right(result);
    } catch (error) {
      if (error is ServerException) {
        return Left(
            ServerFailure(message: error.message ?? "An error occurred"));
      }
      return const Left(ServerFailure(message: "An error occurred"));
    }
  }
}
