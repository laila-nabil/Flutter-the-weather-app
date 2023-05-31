import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather_app/features/weather/data/models/weather_model.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';

import '../../../../core/error/exceptions.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherModel> getWeatherTimeline(GetWeatherParams params);
  Future<Unit> saveWeatherTimeline(WeatherModel weather);
}

const CACHED_WEATHER_TIMELINE = "CACHED_WEATHER_TIMELINE";
// const CACHED_CITY = "CACHED_CITY";

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherModel> getWeatherTimeline(
      GetWeatherParams params) async {
    final jsonString = sharedPreferences.getString(CACHED_WEATHER_TIMELINE);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      return Future.value(WeatherModel.fromJson(decodeJsonData));
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> saveWeatherTimeline(WeatherModel weather) async {
    await sharedPreferences.setString(
        CACHED_WEATHER_TIMELINE, json.encode(weather.toJson()));
    return Future.value(unit);
  }

}
