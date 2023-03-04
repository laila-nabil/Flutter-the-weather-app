import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/history_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

class GetHistoryListWeatherUseCase
    implements UseCase<List<HistoryWeather>, GetHistoryListWeatherParams> {
  final WeatherRepo repo;

  GetHistoryListWeatherUseCase(this.repo);

  @override
  Future<Either<Failure, List<HistoryWeather>>> call(
      GetHistoryListWeatherParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetHistoryListWeatherParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;

  GetHistoryListWeatherParams(this.language,
      {required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [this.latitude, this.longitude,language];
}
