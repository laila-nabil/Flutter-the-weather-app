import 'package:dartz/dartz.dart';
import 'package:the_weather_app/features/weather/domain/entities/history_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/error/failures.dart';
import '../entities/today_overview.dart';
import '../entities/weather_timeline.dart';
import '../use_cases/get_present_future_weather_use_case.dart';
import '../use_cases/get_today_weather_overview_use_case.dart';

abstract class WeatherRepo {


  Future<Either<Failure, WeatherTimeline>> getWeatherTimeline(
      WeatherTimelineParams params);

  Future<Either<Failure, TodayOverview>> getTodayOverview(
      GetTodayOverviewParams params);

  Future<Either<Failure, PresentFutureWeather>> getPresentFutureWeather(
      GetPresentFutureWeatherParams params);

  Future<Either<Failure, List<HistoryWeather>>> getHistoryListWeather(
      GetHistoryListWeatherParams params);
}
