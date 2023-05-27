import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather_app/main.dart';

import '../../../../core/constants.dart';

class GetPresentFutureWeatherUseCase
    implements UseCase<PresentFutureWeather, GetPresentFutureWeatherParams> {
  final WeatherRepo repo;

  GetPresentFutureWeatherUseCase(this.repo);

  @override
  Future<Either<Failure, PresentFutureWeather>> call(
      GetPresentFutureWeatherParams params) async{
    if (enableAnalytics) {
      analytics.logEvent(
          name: "GetPresentFutureWeatherUseCase", parameters: {
        "release": kReleaseMode.toString(),
        "latitude": params.latitude.toString(),
        "longitude": params.longitude.toString()
      });
    }
    return await repo.getPresentFutureWeather(params);
  }
}

class GetPresentFutureWeatherParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;

  const GetPresentFutureWeatherParams(this.language,
      {required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude,language];
}
