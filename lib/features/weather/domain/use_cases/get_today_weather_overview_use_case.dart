import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview.dart';

import '../entities/unit.dart';

class GetTodayWeatherOverviewUseCase
    implements UseCase<TodayOverview, GetTodayOverviewParams> {
  @override
  Future<Either<Failure, TodayOverview>> call(GetTodayOverviewParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetTodayOverviewParams extends Equatable {
  final String latitude;
  final String longitude; //latitude
  final String language;
  final UnitGroup unit;

  GetTodayOverviewParams(
      {required this.unit,
      required this.latitude,
      required this.longitude,
      required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language, unit];
}
