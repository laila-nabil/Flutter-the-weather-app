import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/location/data/models/location_model.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../main.dart';

class GetSavedCurrentLocationUseCase implements UseCase<LocationEntity,NoParams>{

  final LocationRepo locationRepo;

  GetSavedCurrentLocationUseCase(this.locationRepo);

  @override
  Future<Either<Failure, LocationEntity>> call(NoParams params) async {
    return locationRepo.getSavedLocationLocally();
  }

}