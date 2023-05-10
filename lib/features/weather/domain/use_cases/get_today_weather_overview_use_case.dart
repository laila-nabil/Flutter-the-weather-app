import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview_v.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

import '../../../../core/constants.dart';
import '../../../../main.dart';
import '../entities/today_overview.dart';
import '../entities/unit.dart';

class GetTodayWeatherOverviewUseCase
    implements UseCase<TodayOverview, GetTodayOverviewParams> {
  final WeatherRepo repo;

  GetTodayWeatherOverviewUseCase(this.repo);
  @override
  Future<Either<Failure, TodayOverview>> call(GetTodayOverviewParams params) async{
    if (enableAnalytics) {
      // analytics.logEvent(name: "GetTodayWeatherOverviewUseCase",);
    }
    return await repo.getTodayOverview(params);
  }
}

class GetTodayOverviewParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;
  final UnitGroup unit;

  GetTodayOverviewParams(
      {this.unit = UnitGroup.metric,
      required this.latitude,
      required this.longitude,
      required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language, unit];
}
