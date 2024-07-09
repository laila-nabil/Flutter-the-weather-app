import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';


class GetSavedCurrentLocationUseCase implements UseCase<LocationEntity,NoParams>{

  final LocationRepo locationRepo;

  GetSavedCurrentLocationUseCase(this.locationRepo);

  @override
  Future<Either<Failure, LocationEntity>> call(NoParams params) async {
    return locationRepo.getSavedLocationLocally();
  }

}