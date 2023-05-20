import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_local_data_source.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:the_weather_app/features/weather/data/models/today_overview_model_v.dart';
import 'package:the_weather_app/features/weather/domain/entities/unix.dart';


import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/present_future_weather.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case_v.dart';
import '../models/history_weather_model.dart';
import '../models/present_future_weather_model.dart';
import '../models/today_overview_model.dart';
import '../models/weather_timeline_model_v.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:the_weather_app/core/extensions.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource, this.weatherLocalDataSource);

  @override
  Future<Either<Failure, TodayOverviewModelV>> getTodayOverviewV(
      GetTodayOverviewParamsV params) async {
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
    List<HistoryWeatherModel> resultFromApi = List.empty(growable: true);
    List<HistoryWeatherModel> resultAdjustedForUI = List.empty(growable: true);
    try {
      DateTime now =
          DateTime.now().toUtc();
      var utcNumOfDays =
          params.numOfDays >= 4 ? 4 : params.numOfDays;
      final dates =
          List.generate(utcNumOfDays, (index) {
            printDebug("index $index");
            return now.subDays(index + 1);
          });
      printDebug("now $now");
      printDebug("dates $dates");
      for (final date in dates) {
        final dt = date.millisecondsSinceEpoch ~/ 1000;
        printDebug("date dt $date $dt");
        resultFromApi.add(await weatherRemoteDataSource.getHistoryWeather(
            params: params, dt: dt));
      }
      resultAdjustedForUI =
          _mapHistoryUtcToTimezone(resultFromApi,);
      return Right(resultAdjustedForUI);
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

@visibleForTesting
List<HistoryWeatherModel> mapHistoryUtcToTimezone(
  List<HistoryWeatherModel> resultFromApi,
) =>
    _mapHistoryUtcToTimezone(resultFromApi,);

List<HistoryWeatherModel> _mapHistoryUtcToTimezone(
  List<HistoryWeatherModel> resultFromApi,
) {
  Map<DateTime,List<Hourly>> hourlyByDate = {};
  List<Hourly> resultAdjustedForUIHourly = List.empty(growable: true);
  for (var element in resultFromApi) {
    resultAdjustedForUIHourly =
        resultAdjustedForUIHourly + (element.hourly ?? []);

  }

  for (var element in resultAdjustedForUIHourly) {
    var date = unixSecondsToDateTimezone(
        element.dt!.toInt(), resultFromApi.first.actualTimezoneOffset!);
    date = DateTime(date.year,date.month,date.day);
    hourlyByDate[date] = (hourlyByDate[date] ?? []) + [element];
  }
  printDebug("hourlyByDate $hourlyByDate");
  hourlyByDate.removeWhere((key, value) => value.length < 24);
  hourlyByDate.forEach((key, value) {
    printDebug("key $key");
    printDebug("value ${value.length} $value");
    value.sort((a, b) =>  a.dt?.compareTo(b.dt ??0) ?? 0);
  });

  List<HistoryWeatherModel> resultAdjustedForUI =
      List.generate(hourlyByDate.length, (index) =>
          HistoryWeatherModel(
            lon: resultFromApi[index].lon,
            lat: resultFromApi[index].lat,
            timezone: resultFromApi[index].timezone,
            timezoneOffset: resultFromApi[index].actualTimezoneOffset,
            hourly: hourlyByDate.values.elementAt(index).map((e) => e as HourlyModel).toList()
          ));

  for (var element in resultAdjustedForUI) {
    printDebug("resultAdjustedForUI element ${element.hourly?.length} ${element.hourly}");
  }
  printDebug("getHistoryListWeather $resultFromApi $resultAdjustedForUI");
  return resultAdjustedForUI.reversed.toList();
}

int? _actualTimezoneOffset(String timezone){
  // Set the timezone to your desired location
  final location = tz.getLocation(timezone );

  // Get the current UTC time
  final utcTime = DateTime.now().toUtc();

  // Convert UTC time to local time
  final localTime = tz.TZDateTime.from(utcTime, location);

  var timezoneOffset = (localTime.hour -utcTime.hour)*3600;
  return timezoneOffset;
}