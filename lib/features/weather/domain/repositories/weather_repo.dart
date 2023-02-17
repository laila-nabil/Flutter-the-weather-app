import 'package:dartz/dartz.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_today_weather_overview_use_case.dart';

import '../../../../core/error/failures.dart';
import '../entities/today_overview.dart';

abstract class WeatherRepo {
  Future<Either<Failure, TodayOverview>> getTodayOverview(
      GetTodayOverviewParams params);
}
