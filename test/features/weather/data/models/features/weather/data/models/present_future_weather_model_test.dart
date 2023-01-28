import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather_app/features/weather/data/models/present_future_weather_model.dart';
import 'package:the_weather_app/features/weather/data/models/weather_model.dart';

import '../../../../../../../../fixtures/fixture_reader.dart';

void main(){
  final presentFutureWeatherModelJson = fixtureJson("present_future_weather.json");
  final weatherPresentFutureWeatherModelJson = fixtureJson("weather_present_future_weather.json");

  test("PresentFutureWeatherModel.fromJson", (){
    print("json ${PresentFutureWeatherModel.fromJson(
        json: presentFutureWeatherModelJson, lat: "30.0444", lon: "31.2357")}");
  },);
  // test("WeatherModel.fromJson", (){
  //   print("json ${WeatherModel.fromJson(
  //       json: weatherPresentFutureWeatherModelJson, lat: "30.0444", lon: "31.2357")}");
  // });
}