import 'package:dartz/dartz.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

import '../use_cases/get_current_weather.dart';
import '../use_cases/get_history_weather.dart';
import '../use_cases/get_present_future_weather.dart';

abstract class WeatherRepo{
  Future<Either<Failure,CurrentWeather>> getCurrentWeatherAPI(
      {required GetCurrentWeatherParams params});

  Future<Either<Failure,List<Weather>>> getPresentFutureWeatherAPI(
      {required GetPresentFutureWeatherParams params});

  Future<Either<Failure,List<Weather>>> getHistoryWeatherAPI(
      {required GetHistoryWeatherParams params});
}