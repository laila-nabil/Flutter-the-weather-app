import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/location/data/models/location_model.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';


class SaveCurrentLocationUseCase implements UseCase<Unit,LocationModel>{

  final LocationRepo locationRepo;

  SaveCurrentLocationUseCase(this.locationRepo);

  @override
  Future<Either<Failure, Unit>> call(LocationModel location) async {
    return locationRepo.saveLocationLocally(location);
  }

}