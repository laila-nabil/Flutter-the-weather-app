import 'package:dartz/dartz.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_today_weather_overview_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/error/failures.dart';
import '../entities/today_overview_v.dart';
import '../entities/weather_timeline.dart';

abstract class WeatherRepo {
  Future<Either<Failure, TodayOverviewV>> getTodayOverview(
      GetTodayOverviewParams params);

  Future<Either<Failure, WeatherTimelineV>> getWeatherTimeline(
      WeatherTimelineParams params);
}
