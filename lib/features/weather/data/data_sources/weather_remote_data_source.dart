import 'dart:convert';

import 'package:the_weather_app/core/constants.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_timeline_use_case.dart';

import '../../../../core/Network/network.dart';
import '../../../../core/utils.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../models/today_overview_model.dart';
import '../models/weather_timeline_model.dart';

abstract class WeatherRemoteDataSource {
  Future<TodayOverviewModel> getTodayOverview(GetTodayOverviewParams params);
  Future<WeatherTimelineModel> getWeatherTimeline(WeatherTimelineParams params);
}

class WeatherRemoteDatSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<TodayOverviewModel> getTodayOverview(GetTodayOverviewParams params) async {
    String url =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/' +
            '${params.latitude},${params.longitude}' +
            '/today?' +
            'unitGroup=${params.unit.name}' +
            '&include=current' +
            '&key=$API_KEY' +
            '&contentType=json&lang=${params.language}';
    final result = await Network.get(
        url:
        url);

    final responseBody = json.decode(result.body);
    final todayOverview = TodayOverviewModel.fromJson(responseBody);
    printDebug("todayOverview ${todayOverview}");
    return todayOverview;
  }

  @override
  Future<WeatherTimelineModel> getWeatherTimeline(WeatherTimelineParams params)async {
    String url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/'
        '${params.latitude},${params.longitude}'
        '/${params.startDate}'
        '/${params.endDate}'
        '?unitGroup=metric'
        '&include=days%2Chours'
        '&key=$API_KEY'
        '&contentType=json&lang=${params.language}';

    final result = await Network.get(
        url:
        url);

    final responseBody = json.decode(result.body);
    final weatherTimeline = WeatherTimelineModel.fromJson(responseBody);
    printDebug("weatherTimeline ${WeatherTimelineModel}");
    return weatherTimeline;
  }
}
