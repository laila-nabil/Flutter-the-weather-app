import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

import '../repositories/weather_repo.dart';

class GetHistoryWeatherUseCase
    implements UseCase<List<Weather>, GetHistoryWeatherParams> {
  final WeatherRepo weatherRepo;

  GetHistoryWeatherUseCase(this.weatherRepo);

  @override
  Future<Either<Failure, List<Weather>>> call(GetHistoryWeatherParams params) {
    return weatherRepo.getHistoryWeatherAPI(params: params);
  }
}

class GetHistoryWeatherParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;
  final int unixTimestamp;

  GetHistoryWeatherParams(
      {required this.latitude,
      required this.longitude,
      required this.unixTimestamp,
      required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language, unixTimestamp];
}
