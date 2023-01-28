import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/data/models/weather_model.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

class PresentFutureWeatherModel extends PresentFutureWeather{
  PresentFutureWeatherModel(
      {required List<Weather> presentFutureWeatherList,
      required int timezoneOffset})
      : super(
            presentFutureWeather: presentFutureWeatherList,
            timezoneOffset: timezoneOffset);

  factory PresentFutureWeatherModel.fromJson(
      {required Map<String, dynamic> json,
      required String lat,
      required String lon}) {
    ///TODO error in _presentFutureWeatherList
    printDebug("json $json");
    int _timezoneOffset = json['timezone_offset'];
    // final date = json['daily'][0]['dt'] as int;
    // final icon = json['daily'][0]['weather'][0]['icon'];
    final List hourly = json['hourly'];
    List<WeatherModel> hourlyWeatherModel = [];
    for(var e in hourly){
      printDebug("mapping1 $e");
      hourlyWeatherModel.add(WeatherModel.fromJson(
          json: e,
          lat: lat,
          lon: lon,
          timezoneOffset: _timezoneOffset,
          jsonDaily: json['daily']));
      printDebug("hourlyWeatherModel now ${hourlyWeatherModel} ");
    }
    printDebug("hourlyWeatherModel ${hourlyWeatherModel} ");
    printDebug("hourly ${hourly.length} ${hourly} ");
    List<Weather> _presentFutureWeatherList = [];
    for(var e in hourly){
      printDebug("mapping2 $e");
      _presentFutureWeatherList.add(WeatherModel.fromJsonWithTimeline(
          json: e,
          hourly: hourlyWeatherModel,
          lat: lat,
          lon: lon,
          timezoneOffset: _timezoneOffset));
    }
    printDebug("_presentFutureWeatherList $_presentFutureWeatherList");
    printDebug("PresentFutureWeatherModel ${PresentFutureWeatherModel(
        presentFutureWeatherList: _presentFutureWeatherList,
        timezoneOffset: _timezoneOffset)}");
    return PresentFutureWeatherModel(
        presentFutureWeatherList: _presentFutureWeatherList,
        timezoneOffset: _timezoneOffset);
  }
}