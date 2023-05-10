import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview_v.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

import '../../../../core/constants.dart';
import '../../../../main.dart';
import '../entities/unit.dart';

class GetTodayWeatherOverviewUseCaseV
    implements UseCase<TodayOverviewV, GetTodayOverviewParamsV> {
  final WeatherRepo repo;

  GetTodayWeatherOverviewUseCaseV(this.repo);
  @override
  Future<Either<Failure, TodayOverviewV>> call(GetTodayOverviewParamsV params) async{
    if (enableAnalytics) {
      // analytics.logEvent(name: "GetTodayWeatherOverviewUseCaseV",);
    }
    return await repo.getTodayOverviewV(params);
  }
}

class GetTodayOverviewParamsV extends Equatable {
  final String latitude;
  final String longitude;
  final String language;
  final UnitGroup unit;

  GetTodayOverviewParamsV(
      {this.unit = UnitGroup.metric,
      required this.latitude,
      required this.longitude,
      required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language, unit];
}
