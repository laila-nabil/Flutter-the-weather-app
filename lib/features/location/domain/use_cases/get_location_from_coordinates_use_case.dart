import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';

import '../../../../core/constants.dart';
import '../../../../main.dart';

class GetLocationFromCoordinatesUseCase
    implements UseCase<LocationEntity, GetLocationFromCoordinatesParams> {
  final LocationRepo locationRepo;

  GetLocationFromCoordinatesUseCase(this.locationRepo);

  @override
  Future<Either<Failure,LocationEntity>> call(
      GetLocationFromCoordinatesParams params) async {
    if (enableAnalytics) {
      analytics.logEvent(
          name: "GetLocationFromCoordinatesUseCase", parameters: {
        "release": kReleaseMode.toString(),
        "latitude": params.lat.toString(),
        "longitude": params.lon.toString(),
        "isWeb": kIsWeb.toString(),
      });
    }
    return await locationRepo.getLocationFromCoordinates(params: params);
  }
}

class GetLocationFromCoordinatesParams extends Equatable{
  final String lat;
  final String lon;

  const GetLocationFromCoordinatesParams({required this.lat, required this.lon});

  @override
  List<Object?> get props => [lat,lon];
}
