import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/app_design.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/core/widgets/custom_grid.dart';
import 'package:the_weather_app/features/weather/domain/entities/wind_direction.dart';

import 'compact_day_weather.dart';
import 'dashboard_weather.dart';

class WeatherDetailed extends StatelessWidget {
  final DayWeatherParams params;

  const WeatherDetailed(this.params, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < screenSize.height;
    return LayoutBuilder(builder: (ctx, constraints) {
      final dashboard = [
        if(params.rain!="")DashboardWeather(
          isStatusCentered: false,
          svgIcon: AppAssets.iconRain,
          status: '${(double.tryParse(params.rain)! * 100).toStringAsFixed(2)}%',
        ),

        DashboardWeather(
          isStatusCentered: false,
          svgIcon: AppAssets.iconWind2,
          status: params.windSpeed.isNotEmpty && params.windDeg.isNotEmpty
              ? '${params.windSpeed} ${'m_s'.tr()} ${windDirection(int.tryParse(params.windDeg) ?? 0)}'
              : '_',
        ),
        DashboardWeather(
          isStatusCentered: false,
          title: 'pressure'.tr().toString(),
          status: '${double.tryParse(params.pressure)}  ${'hpa'.tr()}',
        ),
        DashboardWeather(
          isStatusCentered: false,
          title: 'clouds'.tr().toString(),
          status: '${double.tryParse(params.clouds)}%',
        ),
        DashboardWeather(
          isStatusCentered: false,
          title: 'uvi'.tr().toString(),
          status: '${double.tryParse(params.uvi)}',
        ),
        DashboardWeather(
          isStatusCentered: false,
          title: 'humidity'.tr().toString(),
          status: '${double.tryParse(params.humidity)}%',
        ),
        if(params.visibility!="")DashboardWeather(
          isStatusCentered: false,
          title: 'visibility'.tr().toString(),
          status: double.tryParse(params.visibility)! > 1000
              ? '${(double.tryParse(params.visibility)! / 1000).toStringAsFixed(1)} ${'km'.tr()}'
              : '${double.tryParse(params.visibility)} m',
        ),
      ];
      final cols = isPortrait ? 2 : 4;
      final rows = (dashboard.length / cols).round();
      final containerHeight = (constraints.maxHeight * (0.2)) / rows;
      final List<Widget> newDashboard = [];
      for (var element in dashboard) {
        newDashboard.add(SizedBox(
          height: containerHeight,
          child: element,
        ));
      }
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppDesign.borderRadius2),
              topLeft: Radius.circular(AppDesign.borderRadius2)),
          color: AppColors.backgroundDarkColor,
        ),
        // height: 300,
        padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * 0.06,
            horizontal: constraints.maxWidth * 0.08),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                params.isImageNetwork
                    ? Image.network(
                        params.iconPath,
                        width: isPortrait
                            ? constraints.maxWidth * 0.5
                            : constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.4,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        params.iconPath,
                        width: isPortrait
                            ? constraints.maxWidth * 0.5
                            : constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.4,
                        fit: BoxFit.contain,
                        // width: 150,
                        // height: 150,
                      ),
                Container(
                  width: isPortrait
                      ? constraints.maxWidth * 0.3
                      : constraints.maxWidth * 0.1,
                  height: constraints.maxHeight * 0.4,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    '${params.currentTemp} °${'deg'.tr()}',
                    style: const TextStyle(fontSize: 22),
                    maxLines: 1,
                    minFontSize: 15,
                    maxFontSize: 22,
                  ),
                ),
                if (!isPortrait)
                  FeelsLikeWidget(
                    constraints: constraints,
                    detailedDescription: params.detailedDescription,
                    feelsLike: params.feelsLike,
                    isPortrait: isPortrait,
                  ),
              ],
            ),
            if (isPortrait)
              FeelsLikeWidget(
                constraints: constraints,
                detailedDescription: params.detailedDescription,
                feelsLike: params.feelsLike,
                isPortrait: isPortrait,
              ),
            GoogleGrid(
              columnCount: cols,
              children: newDashboard,
              // gap: containerHeight * 0.5,
            )
          ],
        ),
      );
    });
  }
}

class FeelsLikeWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final String feelsLike;
  final String detailedDescription;
  final bool isPortrait;

  const FeelsLikeWidget(
      {Key? key, required this.constraints,
      required this.feelsLike,
      required this.detailedDescription,
      required this.isPortrait}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (feelsLike != "")
          Container(
            alignment: Alignment.center,
            height: isPortrait
                ? constraints.maxHeight * 0.1
                : constraints.maxHeight * 0.3,
            width: isPortrait? constraints.maxWidth * 0.7 : constraints.maxWidth * 0.4,
            padding:
                EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.02),
            child: AutoSizeText.rich(
              TextSpan(text: 'feels_like'.tr().toString(), children: [

                TextSpan(text:
               '$feelsLike °${'deg'.tr()}, ',
                ),
                TextSpan(
                    text: detailedDescription,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ]),
              minFontSize: 12,
              maxFontSize: 37,
              style: const TextStyle(fontSize: 25, color: AppColors.white),
              softWrap: true,
            ),
          ),
      ],
    );
  }
}
