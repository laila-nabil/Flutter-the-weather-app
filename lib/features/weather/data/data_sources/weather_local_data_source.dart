import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/error/exceptions.dart';
import '../models/weather_timeline_model_v.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherTimelineModelV> getWeatherTimeline(WeatherTimelineParams params);
  Future<Unit> saveWeatherTimeline(WeatherTimelineModelV weatherTimelineModel);
}

const CACHED_WEATHER_TIMELINE = "CACHED_WEATHER_TIMELINE";
// const CACHED_CITY = "CACHED_CITY";

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherTimelineModelV> getWeatherTimeline(
      WeatherTimelineParams params) async {
    final jsonString = sharedPreferences.getString(CACHED_WEATHER_TIMELINE);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      return Future.value(WeatherTimelineModelV.fromJson(decodeJsonData));
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> saveWeatherTimeline(WeatherTimelineModelV weatherTimelineModel) async {
    await sharedPreferences.setString(
        CACHED_WEATHER_TIMELINE, json.encode(weatherTimelineModel.toJson()));
    return Future.value(unit);
  }

}
