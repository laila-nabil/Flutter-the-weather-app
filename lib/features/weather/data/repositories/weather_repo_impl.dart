import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_local_data_source.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:the_weather_app/features/weather/data/models/today_overview_model_v.dart';
import 'package:the_weather_app/features/weather/domain/entities/history_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview_v.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_timeline.dart';

import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_today_weather_overview_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/error/exceptions.dart';
import '../models/history_weather_model.dart';
import '../models/present_future_weather_model.dart';
import '../models/today_overview_model.dart';
import '../models/weather_timeline_model_v.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource, this.weatherLocalDataSource);

  @override
  Future<Either<Failure, TodayOverviewModelV>> getTodayOverviewV(
      GetTodayOverviewParams params) async {
    TodayOverviewModelV result;
    try {
      result = await weatherRemoteDataSource.getTodayOverviewV(params);
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
  Future<Either<Failure, WeatherTimelineModelV>> getWeatherTimeline(
      WeatherTimelineParams params) async {
    WeatherTimelineModelV result;
    try {
      final oldResult = await weatherLocalDataSource.getWeatherTimeline(params);

      ///TODO CONDITION MAY NEED TO BE FIXED
      if (oldResult.address?.contains(params.city) == true) {
        result = oldResult;
      } else {
        result = await weatherRemoteDataSource.getWeatherTimeline(params);
        await weatherLocalDataSource.saveWeatherTimeline(result);
      }
    } catch (exception) {
      String message = exception.toString();
      if (exception is EmptyCacheException) {
        return Left(EmptyCacheFailure());
      } else if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, TodayOverviewModel>> getTodayOverview(
      GetTodayOverviewParams params) async {
    try {
      final result = await weatherRemoteDataSource.getTodayOverview(params);
      return Right(result);
    } catch (exception) {
      String message = exception.toString();
      if (exception is EmptyCacheException) {
        return Left(EmptyCacheFailure());
      } else if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
  }

  @override
  Future<Either<Failure, PresentFutureWeatherModel>> getPresentFutureWeather(
      GetPresentFutureWeatherParams params) async {
    try {
      final result =
          await weatherRemoteDataSource.getPresentFutureWeather(params);
      return Right(result);
    } catch (exception) {
      String message = exception.toString();
      if (exception is EmptyCacheException) {
        return Left(EmptyCacheFailure());
      } else if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
  }

  @override
  Future<Either<Failure, List<HistoryWeatherModel>>> getHistoryListWeather(
      GetHistoryListWeatherParams params) async {
    List<HistoryWeatherModel> result = List.empty(growable: true);
    try {
      final now = DateTime.now().toUtc().subtract(Duration(days: 1));
      final dates =
          List.generate(5, (index) => now.subtract(Duration(days: index)));
      for (final date in dates) {
        final dt = date.millisecondsSinceEpoch ~/ 1000;
        result.add(await weatherRemoteDataSource.getHistoryWeather(
            params: params, dt: dt));
      }
      printDebug("getHistoryListWeather $result");
      return Right(result);
    } catch (exception) {
      String message = exception.toString();
      if (exception is EmptyCacheException) {
        return Left(EmptyCacheFailure());
      } else if (exception is ServerException) {
        message = exception.message ?? "";
      }
      return Left(ServerFailure(message: message));
    }
  }
}
