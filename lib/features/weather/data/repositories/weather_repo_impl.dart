import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/exceptions.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:the_weather_app/features/weather/data/models/weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather.dart';

import '../models/current_weather.dart';

class WeatherRepoImpl extends WeatherRepo{
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource);

  @override
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeatherAPI(
      {required GetCurrentWeatherParams params}) async {
    CurrentWeatherModel result;
    try {
      result =
          await weatherRemoteDataSource.getCurrentWeatherAPI(params: params);
    } catch (exception) {
      String message = exception.toString();
      if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> getHistoryWeatherAPI(
      {required GetHistoryWeatherParams params}) async {
    List<WeatherModel> result;
    try {
      result =
      await weatherRemoteDataSource.getHistoryWeatherAPI(params: params);
    } catch (exception) {
      String message = exception.toString();
      if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> getPresentFutureWeatherAPI(
      {required GetPresentFutureWeatherParams params}) async {
    List<WeatherModel> result;
    try {
      result =
      await weatherRemoteDataSource.getPresentFutureWeatherAPI(params: params);
    } catch (exception) {
      String message = exception.toString();
      if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
    return Right(result);
  }
}