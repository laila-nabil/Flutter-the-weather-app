import 'package:the_weather_app/features/weather/data/models/current_weather.dart';
import 'package:the_weather_app/features/weather/data/models/weather.dart';

abstract class RemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeatherAPI();
  Future<WeatherModel> getPresentFutureWeatherAPI();
}