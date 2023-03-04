import 'dart:convert';

import 'package:the_weather_app/core/constants.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/Network/network.dart';
import '../../../../core/utils.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../models/present_future_weather_model.dart';
import '../models/today_overview_model.dart';
import '../models/today_overview_model_v.dart';
import '../models/weather_timeline_model_v.dart';

abstract class WeatherRemoteDataSource {
  Future<TodayOverviewModelV> getTodayOverviewV(GetTodayOverviewParams params);

  Future<TodayOverviewModel> getTodayOverview(GetTodayOverviewParams params);

  Future<PresentFutureWeatherModel> getPresentFutureWeatherModel(GetPresentFutureWeatherParams params);

  Future<WeatherTimelineModelV> getWeatherTimeline(
      WeatherTimelineParams params);
}

class WeatherRemoteDatSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<TodayOverviewModelV> getTodayOverviewV(
      GetTodayOverviewParams params) async {
    String url =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/' +
            '${params.latitude},${params.longitude}' +
            '/today?' +
            'unitGroup=${params.unit.name}' +
            '&include=current' +
            '&key=$API_KEY' +
            '&contentType=json&lang=${params.language}&iconSet=icons2';
    final result = await Network.get(url: url);

    final responseBody = json.decode(result.body);
    final todayOverview = TodayOverviewModelV.fromJson(responseBody);
    printDebug("todayOverview ${todayOverview}");
    return todayOverview;
  }

  @override
  Future<WeatherTimelineModelV> getWeatherTimeline(
      WeatherTimelineParams params) async {
    String url =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/'
        // '${params.latitude},${params.longitude}'
        '${params.city}'
        '/${params.startDate}'
        '/${params.endDate}'
        '?unitGroup=metric'
        '&elements=datetime%2CdatetimeEpoch%2Ctempmax%2Ctempmin%2Ctemp'
        '&key=$API_KEY'
        '&contentType=json&lang=${params.language}&iconSet=icons2';

    final result = await Network.get(url: url);

    final responseBody = json.decode(result.body);
    final weatherTimeline = WeatherTimelineModelV.fromJson(responseBody);
    printDebug("weatherTimeline ${WeatherTimelineModelV}");
    return weatherTimeline;
  }

  @override
  Future<TodayOverviewModel> getTodayOverview(
      GetTodayOverviewParams params) async {
    String url = "https://api.openweathermap.org/data/2.5/weather?" +
        "lat=${params.latitude}&lon=${params.longitude}" +
        "&appid=$API_KEY'&units=metric&lang${params.language}";

    final result = await Network.get(url: url);

    final responseBody = json.decode(result.body);
    final todayOverview = TodayOverviewModel.fromJson(responseBody);
    printDebug("todayOverview ${todayOverview}");
    return todayOverview;
  }

  @override
  Future<PresentFutureWeatherModel> getPresentFutureWeatherModel(
      GetPresentFutureWeatherParams params) async {
    String url = "https://api.openweathermap.org/data/2.5/onecall?" +
        "lat=${params.latitude}&lon=${params.longitude}" +
        "&exclude=minutely&lang${params.language}" +
        "&appid=$API_KEY";

    final response = await Network.get(url: url);
    final responseBody = json.decode(response.body);
    final result = PresentFutureWeatherModel.fromJson(responseBody);
    printDebug("getPresentFutureWeatherModel ${result}");
    return result;
  }
}
