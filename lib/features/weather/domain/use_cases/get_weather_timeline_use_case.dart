import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_timeline.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';

import '../entities/unit.dart';

class GetWeatherTimelineUseCase
    implements UseCase<WeatherTimelineV, WeatherTimelineParams> {
  final WeatherRepo repo;

  GetWeatherTimelineUseCase(this.repo);

  @override
  Future<Either<Failure, WeatherTimelineV>> call(WeatherTimelineParams params) async {
    return await repo.getWeatherTimeline(params);
  }
}

class WeatherTimelineParams extends Equatable {
  // final String latitude;
  // final String longitude;
  final String city;
  final String language;
  final UnitGroup unit;
  final int daysBeforeToday;
  final int daysAfterToday;

  WeatherTimelineParams({
    this.unit = UnitGroup.metric,
    required this.city,
    // required this.latitude,
    // required this.longitude,
    required this.language,
    required this.daysBeforeToday,
    required this.daysAfterToday,
  });

  String get startDate => DateFormat("yyyy-M-d")
      .format(DateTime.now().subtract(Duration(days: daysBeforeToday)));

  String get endDate => DateFormat("yyyy-M-d")
      .format(DateTime.now().add(Duration(days: daysAfterToday)));

  @override
  List<Object?> get props => [
        // latitude,
        // longitude,
        city,
        language,
        unit,
        daysAfterToday,
        daysAfterToday,
        startDate,
        endDate
      ];
}
