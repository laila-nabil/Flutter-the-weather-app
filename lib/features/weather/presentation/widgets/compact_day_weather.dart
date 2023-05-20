import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';
import 'package:the_weather_app/widgets/frosted_glass_effect_card.dart';

import 'dashboard_weather.dart';
import 'detailed_weather.dart';

class DayWeatherParams extends Equatable {
  final String iconPath;
  final String currentTemp;
  final String minTemp;
  final String maxTemp;
  final String rain;
  final String windSpeed;
  final String windDeg;
  final String pressure;
  final String clouds;
  final String uvi;
  final String humidity;
  final String visibility;
  final String detailedDescription;
  final String feelsLike;
  final bool isImageNetwork;
  final DateTime date;
  final List<DayWeatherParams>? details;

  const DayWeatherParams({
    required this.iconPath,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.rain,
    required this.windSpeed,
    required this.windDeg,
    required this.pressure,
    required this.clouds,
    required this.uvi,
    required this.humidity,
    required this.visibility,
    required this.detailedDescription,
    required this.feelsLike,
    required this.isImageNetwork,
    required this.date,
    this.details,
  });

  @override
  String toString() {
    return 'DayWeatherParams{iconPath: $iconPath, currentTemp: $currentTemp, minTemp: $minTemp, maxTemp: $maxTemp, rain: $rain, windSpeed: $windSpeed, windDeg: $windDeg, pressure: $pressure, clouds: $clouds, uvi: $uvi, humidity: $humidity, visibility: $visibility, detailedDescription: $detailedDescription, feelsLike: $feelsLike, isImageNetwork: $isImageNetwork, date: $date, details: $details}';
  }

  @override
  List<Object?> get props =>[
    this.iconPath,
    this.currentTemp,
    this.minTemp,
    this.maxTemp,
    this.rain,
    this.windSpeed,
    this.windDeg,
    this.pressure,
    this.clouds,
    this.uvi,
    this.humidity,
    this.visibility,
    this.detailedDescription,
    this.feelsLike,
    this.isImageNetwork,
    this.date,
    this.details
  ];


}

class CompactDayWeather extends StatelessWidget {
  final DayWeatherParams params;

  CompactDayWeather(this.params);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final isPortrait = mediaQuery.size.width < mediaQuery.size.height;
      final width = isPortrait
          ? mediaQuery.size.width * 0.2
          : mediaQuery.size.width * 0.12;
      var compactDay = _CompactDay(
        width: width,
        params: params,
        isPortrait: isPortrait,
        mediaQuery: mediaQuery,
        constraints: constraints,
      );
      return InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return WeatherDetailed(params);
              });
        },
        child: true
            ? compactDay
            : frostedGlassEffect(
                context: context,
                width: 200,
                height: 200,
                widget: compactDay,
              ),
      );
    });
  }
}

class _CompactDay extends StatelessWidget {
  const _CompactDay({
    Key? key,
    required this.width,
    required this.params,
    required this.isPortrait,
    required this.mediaQuery,
    required this.constraints,
  }) : super(key: key);

  final double width;
  final DayWeatherParams params;
  final bool isPortrait;
  final MediaQueryData mediaQuery;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    double imageHeight = min(constraints.maxHeight * 0.27,30);
    return Container(
      padding: EdgeInsets.all(constraints.maxHeight * 0.07),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(day),
          Container(
              height: constraints.maxHeight * 0.2,
              width: width,
              alignment: Alignment.center,
              child: AutoSizeText(
                  DateFormat('h a', 'locale'.tr().toString())
                      .format(params.date),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  minFontSize: 10,
                  maxFontSize: 20)),
          params.isImageNetwork
              ? Image.network(
                  params.iconPath,
                  height: imageHeight,
                  width: width,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  params.iconPath,
                  height: imageHeight,
                  width: width,
                  fit: BoxFit.contain,
                ),
         Container(
              height: constraints.maxHeight * 0.2,
              width: width * 0.6,
              alignment: Alignment.center,
              child: AutoSizeText(
                "${double.tryParse(params.currentTemp)?.toStringAsFixed(0)}°" +
                    'deg'.tr().toString(),
                style: TextStyle(fontSize: 18),
                minFontSize: 10,
                maxFontSize: 18,
                maxLines: 1,
              )),
           if (params.rain != "" && params.rain!="null")
            Container(
              height: constraints.maxHeight * 0.12,
              width: isPortrait
                  ? mediaQuery.size.width * 0.2
                  : mediaQuery.size.width * 0.05,
              alignment: Alignment.center,
              child: DashboardWeather(
                isStatusCentered: true,
                svgIcon: AppAssets.iconRain,
                status:
                    '${(double.tryParse(params.rain)! * 100).toStringAsFixed(0)}%',
              ),
            ),
        ],
      ),
    );
  }
}
