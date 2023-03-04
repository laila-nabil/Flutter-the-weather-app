import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview_v.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

import '../entities/unit.dart';

class GetTodayWeatherOverviewUseCase
    implements UseCase<TodayOverviewV, GetTodayOverviewParams> {
  final WeatherRepo repo;

  GetTodayWeatherOverviewUseCase(this.repo);
  @override
  Future<Either<Failure, TodayOverviewV>> call(GetTodayOverviewParams params) async{
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
