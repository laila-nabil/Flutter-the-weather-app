import 'dart:convert';

import 'package:the_weather_app/features/weather/data/models/weather_model.dart';

import '../../../../core/Network/network.dart';
import '../../../../core/utils.dart';
import '../../domain/use_cases/get_weather_use_case.dart';


abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(GetWeatherParams params);
}

class WeatherRemoteDatSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<WeatherModel> getWeather(GetWeatherParams params) async {
    String url =
        // 'https://api.open-meteo.com/v1/forecast?latitude=${params.lat}&longitude=${params.lon}&hourly=temperature_2m,precipitation_probability&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_probability_max&past_days=1&timezone=${params.timezone}';
      'https://api.open-meteo.com/v1/forecast?latitude=${params.lat}&longitude=${params.lon}&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability,windspeed_10m,winddirection_10m,uv_index&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_probability_max&current_weather=true&past_days=1&timezone=${params.timezone}';
    final result = await Network.get(url: url);

    final responseBody = json.decode(result.body);
    final weather = WeatherModel.fromJson(responseBody);
    printDebug("weather $WeatherModel");
    return weather;
  }
}
