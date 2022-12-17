import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';

import '../repositories/location_repo.dart';

class AutoCompleteSearchLocationUseCase implements UseCase<List<LocationEntity>,String>{
  final LocationRepo locationRepo;

  AutoCompleteSearchLocationUseCase(this.locationRepo);
  @override
  Future<Either<Failure, List<LocationEntity>>> call(String params) async {
    if(params.length > 3){
      return await locationRepo.autoCompleteSearchLocation(params);
    }else {
      return Right(List<LocationEntity>.empty());
    }
  }

}