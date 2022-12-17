import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather_app/core/constants.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather.dart';

void main() {
  group("WeatherRemoteDatSource", () {
    late WeatherRemoteDataSource weatherRemoteDataSource;
    group("WeatherRemoteDatSource without mock", () {
      test("getCurrentWeatherAPI without mock", () async {
        weatherRemoteDataSource = WeatherRemoteDatSourceImpl();
        final result = await weatherRemoteDataSource.getCurrentWeatherAPI(
            params: GetCurrentWeatherParams(
                language: "en", latitude: '30.0444', longitude: '31.2357'));
        printDebug("Result $result");
      });
      test("getPresentFutureWeatherAPI without mock", () async {
        weatherRemoteDataSource = WeatherRemoteDatSourceImpl();
        final result = await weatherRemoteDataSource.getPresentFutureWeatherAPI(
            params: GetPresentFutureWeatherParams(
                language: "en", latitude: '30.0444', longitude: '31.2357'));
        printDebug("Result $result");
      });
      test("getHistoryWeatherAPI without mock", () async {
        weatherRemoteDataSource = WeatherRemoteDatSourceImpl();
        final result = await weatherRemoteDataSource.getHistoryWeatherAPI(
            params: GetHistoryWeatherParams(
                unixTimestamp: 1671048851,
                language: "en", latitude: '30.0444', longitude: '31.2357'));
        printDebug("Result $result");
      });
    });
  });
}
