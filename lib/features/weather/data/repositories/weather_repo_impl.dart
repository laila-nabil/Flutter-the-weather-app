import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_local_data_source.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:the_weather_app/features/weather/data/models/weather_model.dart';
import 'package:the_weather_app/features/weather/domain/entities/unix.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';

import '../../../../core/error/exceptions.dart';


class WeatherRepoImpl extends WeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource, this.weatherLocalDataSource);

  @override
  Future<Either<Failure, WeatherModel>> getWeather(GetWeatherParams params) async {
    WeatherModel result;
    try {
      final oldResult = await weatherLocalDataSource.getWeatherTimeline(params);

      result = await weatherRemoteDataSource.getWeather(params);
      await weatherLocalDataSource.saveWeatherTimeline(result);

    } catch (exception) {
      String message = exception.toString();
      if (exception is EmptyCacheException) {
        return const Left(EmptyCacheFailure());
      } else if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
    return Right(result);
  }


}