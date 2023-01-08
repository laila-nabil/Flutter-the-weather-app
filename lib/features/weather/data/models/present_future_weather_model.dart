import 'package:the_weather_app/features/weather/data/models/weather_model.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';

class PresentFutureWeatherModel extends PresentFutureWeather{
  PresentFutureWeatherModel(
      {required List<Weather> presentFutureWeather,
      required int timezoneOffset})
      : super(
            presentFutureWeather: presentFutureWeather,
            timezoneOffset: timezoneOffset);

  factory PresentFutureWeatherModel.fromJson(
      {required Map<String, dynamic> json,
      required String lat,
      required String lon}) {
    ///TODO error in _presentFutureWeather
    print("json $json");
    int _timezoneOffset = json['timezone_offset'];
    // final date = json['daily'][0]['dt'] as int;
    // final icon = json['daily'][0]['weather'][0]['icon'];
    final List hourly = json['hourly'];
    print("hourly ${hourly.length} ${hourly} ");
    List<Weather> _presentFutureWeather = [];
    for(var e in hourly){
      print("mapping $_presentFutureWeather");
      _presentFutureWeather.add(WeatherModel.fromJson(
          json: e, lat: lat, lon: lon));
    }
    print("_presentFutureWeather $_presentFutureWeather");
    print("PresentFutureWeatherModel ${PresentFutureWeatherModel(
        presentFutureWeather: _presentFutureWeather,
        timezoneOffset: _timezoneOffset)}");
    return PresentFutureWeatherModel(
        presentFutureWeather: _presentFutureWeather,
        timezoneOffset: _timezoneOffset);
  }
}