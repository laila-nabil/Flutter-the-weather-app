import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather_app/features/weather/data/models/current_weather_model.dart';

import '../../../../../../../../fixtures/fixture_reader.dart';

void main(){
  final currentWeatherJson = fixtureJson("current_weather.json");

  test("CurrentWeatherModel.fromJson", (){
    print("json ${CurrentWeatherModel.fromJson(currentWeatherJson)}");
  },);
}