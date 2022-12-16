import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

import '../entities/current_weather.dart';

class GetCurrentWeatherUseCase
    implements UseCase<CurrentWeather, GetCurrentWeatherParams> {
  final WeatherRepo weatherRepo;

  GetCurrentWeatherUseCase(this.weatherRepo);

  @override
  Future<Either<Failure, CurrentWeather>> call(GetCurrentWeatherParams params) {
    return weatherRepo.getCurrentWeatherAPI(params: params);
  }
}

class GetCurrentWeatherParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;

  GetCurrentWeatherParams(
      {required this.latitude,
      required this.longitude,
      required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language];
}
