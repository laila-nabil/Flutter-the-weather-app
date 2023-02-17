import 'dart:convert';

import 'package:the_weather_app/core/constants.dart';

import '../../../../core/Network/network.dart';
import '../../../../core/utils.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../models/today_overview_model.dart';

abstract class WeatherRemoteDataSource {
  Future<TodayOverviewModel> getTodayOverview(GetTodayOverviewParams params);
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
}
