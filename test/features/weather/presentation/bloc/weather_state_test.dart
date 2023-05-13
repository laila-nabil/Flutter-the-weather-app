import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/features/weather/data/models/history_weather_model.dart';
import 'package:the_weather_app/features/weather/presentation/bloc/weather_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  testWidgets("WeatherState days test", (widgetTester) async {
    final weatherState = WeatherState(
        weatherStatus: WeatherStatus.presentFutureSuccess,
        historyListWeather: [
          HistoryWeatherModel.fromJson(fixtureJson("history_weather_1.json"))
        ]);
    widgetTester.printToConsole(
        "historyListWeather ${weatherState.historyListWeather.tryFirst?.hourly?.length}");
    int i = 0;
    weatherState.historyListWeather.tryFirst?.hourly?.forEach((e) {
      widgetTester.printToConsole(
            "$i: dt ${e.dt}, ${e.date(10800)}");
      i++;
    });
    widgetTester.printToConsole(
        "historyListWeather ${weatherState.historyListWeather.tryFirst?.hourly}");
  });
}
