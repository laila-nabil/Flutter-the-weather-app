import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather_app/features/location/data/models/location_model.dart';
import 'package:the_weather_app/features/weather/data/models/weather_model.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';

import '../../../../core/error/exceptions.dart';

abstract class LocationLocalDataSource {
  Future<LocationModel> getLocation(GetWeatherParams params);
  Future<Unit> saveLocation(LocationModel location);
}

const CACHED_LOCATION = "CACHED_WEATHER_TIMELINE";
// const CACHED_CITY = "CACHED_CITY";

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LocationModel> getLocation(GetWeatherParams params) async {
    final jsonString = sharedPreferences.getString(CACHED_LOCATION);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      return Future.value(LocationModel.fromJsonLocal(decodeJsonData));
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> saveLocation(LocationModel location) async {
    await sharedPreferences.setString(
        CACHED_LOCATION, json.encode(location.toJsonLocal()));
    return Future.value(unit);
  }

}
