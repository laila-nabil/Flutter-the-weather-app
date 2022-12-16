import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

import '../repositories/weather_repo.dart';

class GetPresentFutureWeatherUseCase
    implements UseCase<List<Weather>, GetPresentFutureWeatherParams> {
  final WeatherRepo weatherRepo;

  GetPresentFutureWeatherUseCase(this.weatherRepo);

  @override
  Future<Either<Failure, List<Weather>>> call(
      GetPresentFutureWeatherParams params) {
    return weatherRepo.getPresentFutureWeatherAPI(params: params);
  }

}

class GetPresentFutureWeatherParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;

  GetPresentFutureWeatherParams({required this.latitude,
    required this.longitude,
    required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language];
}