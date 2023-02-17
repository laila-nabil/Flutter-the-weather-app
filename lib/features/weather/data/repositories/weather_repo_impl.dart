import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:the_weather_app/features/weather/data/models/today_overview_model.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview.dart';

import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_today_weather_overview_use_case.dart';

import '../../../../core/error/exceptions.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource);

  @override
  Future<Either<Failure, TodayOverviewModel>> getTodayOverview(
      GetTodayOverviewParams params) async {
    TodayOverviewModel result;
    try {
      result =
          await weatherRemoteDataSource.getTodayOverview(params);
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
