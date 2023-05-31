import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

class GetWeatherUseCase
    implements UseCase<WeatherEntity, GetWeatherParams> {
  final WeatherRepo repo;

  GetWeatherUseCase(this.repo);

  @override
  Future<Either<Failure, WeatherEntity>> call(GetWeatherParams params) {
    return repo.getWeather(params);
  }
}

class GetWeatherParams extends Equatable {
  final String lat;
  final String lon;
  final String timezone;

  const GetWeatherParams(
      {required this.lat, required this.lon, required this.timezone});

  @override
  List<Object?> get props => [lat, lon, timezone];

}