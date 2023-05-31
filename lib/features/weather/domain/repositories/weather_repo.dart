
import 'package:dartz/dartz.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';

import '../../../../core/error/failures.dart';

abstract class WeatherRepo {

  Future<Either<Failure,WeatherEntity>> getWeather(GetWeatherParams params);
}
