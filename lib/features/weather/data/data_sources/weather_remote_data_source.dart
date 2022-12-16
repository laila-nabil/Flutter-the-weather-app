import 'dart:convert';

import 'package:the_weather_app/core/Network/Network.dart';
import 'package:the_weather_app/core/constants.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/data/models/current_weather.dart';
import 'package:the_weather_app/features/weather/data/models/weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather.dart';

import '../../domain/use_cases/get_history_weather.dart';

abstract class WeatherRemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeatherAPI(
      {required GetCurrentWeatherParams params});

  Future<List<WeatherModel>> getPresentFutureWeatherAPI(
      {required GetPresentFutureWeatherParams params});

  Future<List<WeatherModel>> getHistoryWeatherAPI(
      {required GetHistoryWeatherParams params});
}

class WeatherRemoteDatSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<CurrentWeatherModel> getCurrentWeatherAPI(
      {required GetCurrentWeatherParams params}) async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?'
                +'lat=${params.latitude}'
                +'&lon=${params.longitude}'
                +'&units=metric${params.language}'
                +'&appid=$API_KEY';
    final result = await Network.get(
        url:
            url);
    
    final responseBody = json.decode(result.body);
    final currentWeather = CurrentWeatherModel.fromJson(
        json: responseBody, lat: params.latitude, lon: params.longitude);
    return currentWeather;
  }

  @override
  Future<List<WeatherModel>> getPresentFutureWeatherAPI(
      {required GetPresentFutureWeatherParams params}) async {
    List<WeatherModel> presentFutureWeather = [];
    const excludedPart = 'minutely';
    String url = 'https://api.openweathermap.org/data/2.5/onecall?'
                +'lat=${params.latitude}'
                +'&lon=${params.longitude}'
                +'&exclude=$excludedPart'
                +'&units=metric${params.language}'
                '+'+'&appid=${API_KEY}';

    final result = await Network.get(
        url:
        url);
    
    final responseBody = json.decode(result.body);
    int timezoneOffset = responseBody['timezone_offset'];
    final date = responseBody['daily'][0]['dt'] as int;
    final icon = responseBody['daily'][0]['weather'][0]['icon'];
    final List hourly = responseBody['hourly'];
    hourly.map((e) => presentFutureWeather.add(WeatherModel.fromJson(
        json: e, lat: params.latitude, lon: params.longitude)));
    return presentFutureWeather;
  }

  @override
  Future<List<WeatherModel>> getHistoryWeatherAPI(
      {required GetHistoryWeatherParams params})  async {
    List<WeatherModel> historyWeather = [];
    const excludedPart = 'minutely';
    String url = 'https://api.openweathermap.org/data/2.5/onecall/timemachine?' +
            'lat=${params.latitude}' +
            '&lon=${params.longitude}' +
            '&dt=${params.unixTimestamp}' +
            '&exclude=$excludedPart' +
            '&units=metric${params.language}' +
            '&appid=${API_KEY}';

    final result = await Network.get(
        url:
        url);
    
    final responseBody = json.decode(result.body);
    final List hourly = responseBody['hourly'];
    hourly.map((e) => historyWeather.add(WeatherModel.fromJson(
        json: e, lat: params.latitude, lon: params.longitude)));
    return historyWeather;
  }
}
