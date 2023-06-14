import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/exceptions.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:the_weather_app/features/location/data/models/location_model.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';

import '../data_sources/location_local_data_source.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationRemoteDataSource locationRemoteDataSource;
  final LocationLocalDataSource locationLocalDataSource;
  LocationRepoImpl(this.locationRemoteDataSource,this.locationLocalDataSource);

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

  @override
  Future<Either<Failure, Unit>> saveLocationLocally(LocationModel location) async{
    try{
      var result = await locationLocalDataSource.saveLocation(location);
      return Right(result);
    }catch(e){
      return const Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, LocationModel>> getSavedLocationLocally() async {
    try{
      var result = await locationLocalDataSource.getLocation();
      return Right(result);
    }catch(e){
      return const Left(EmptyCacheFailure());
    }
  }
}
