import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';

class GetLocationFromCoordinatesUseCase{
  final LocationRepo locationRepo;

  GetLocationFromCoordinatesUseCase(this.locationRepo);

  Future<Either<Failure,String>> call(
      GetLocationFromCoordinatesParams params) async {
    return await locationRepo.getLocationFromCoordinates(params: params);
  }
}

class GetLocationFromCoordinatesParams extends Equatable{
  final String lat;
  final String lon;

  GetLocationFromCoordinatesParams({required this.lat, required this.lon});

  @override
  List<Object?> get props => [lat,lon];
}
