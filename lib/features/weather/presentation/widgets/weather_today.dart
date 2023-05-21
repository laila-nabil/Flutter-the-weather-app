import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/core/widgets/frosted_glass_effect_card.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';

import '../../../../core/config.dart';
import '../../domain/entities/today_overview.dart';
import 'dashboard_weather.dart';

class WeatherTodayWidget extends StatelessWidget {
  final TodayOverview? weatherToday;
  final Daily? weatherToday_;
  const WeatherTodayWidget(
      {Key? key,
      required this.weatherToday, required this.weatherToday_,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final city = Provider.of<WeatherProvider>(context).location;
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < screenSize.height;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        var weather = _WeatherToday(
                  weatherToday_: weatherToday_ ,
                  weatherToday: weatherToday,
                  isPortrait: isPortrait,
                  rain: (weatherToday_?.pop ?? "").toString() ,
                  constraints: constraints,
                );
        return isPortrait
            ? weather
            : FrostedGlassEffect(
                context: context,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                widget: weather,
              );
      },
    );
  }
}

class _WeatherToday extends StatelessWidget {
  const _WeatherToday(
      {Key? key,
      required this.weatherToday,
      required this.isPortrait,
      required this.rain,
      required this.constraints, required this.weatherToday_})
      : super(key: key);

  final TodayOverview? weatherToday;
  final Daily? weatherToday_;
  final bool isPortrait;
  final String rain;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                weatherToday?.weather.tryFirst?.iconPath(Config.isImageNetwork) ?? "",
                height: isPortrait
                    ? constraints.maxHeight * 0.5
                    : constraints.maxHeight * 0.4,
                fit: BoxFit.contain,
                alignment:
                isPortrait ? Alignment.center : Alignment.centerLeft,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: AutoSizeText(
                    '${weatherToday?.main?.temp } °${'deg'.tr()}',
                    style: const TextStyle(fontSize: 40),
                    maxFontSize: 55,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          height: constraints.maxHeight * 0.07,
          width: constraints.maxWidth * 0.98,
          alignment: Alignment.center,
          child: AutoSizeText.rich(
            TextSpan(text: 'feels_like'.tr().toString(), children: [
              TextSpan(
                  text: '${weatherToday?.main?.feelsLike} °${'deg'.tr()}, ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                text:weatherToday?.weather.tryFirst?.description ?? "",
              )
            ]),
            style: const TextStyle(fontSize: 25),
            minFontSize: 12,
            maxFontSize: 50,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        SizedBox(
            // width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.25,
            child: TodayDetails(
              weatherToday: weatherToday,
              weatherTodayRain: rain,
              weatherTodayTempMax: weatherToday_?.temp?.max.nullableToString() ??"",
              weatherTodayTempMin: weatherToday_?.temp?.min?.nullableToString() ??"",
            )),
      ],
    );
  }
}

class TodayDetails extends StatelessWidget {
  const TodayDetails(
      {Key? key,
      required this.weatherToday,
      required this.weatherTodayRain,
      required this.weatherTodayTempMax,
      required this.weatherTodayTempMin})
      : super(key: key);

  final TodayOverview? weatherToday;
  final String weatherTodayTempMax;
  final String weatherTodayTempMin;
  final String weatherTodayRain;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      // return Container(color: Colors.lightBlue,);
      final height = constraints.maxHeight * 0.3;
      final width = constraints.maxWidth * 0.4;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if(double.tryParse(weatherTodayRain) != null)SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.iconRain,
                  status: '${double.tryParse(weatherTodayRain) !* 100.0}%',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.iconSunrise,
                  status:
                      '${weatherToday?.sys?.getSunrise}',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  title: 'max'.tr().toString(),
                  status: "$weatherTodayTempMax °${'deg'.tr()}",
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.iconWind2,
                  status:
                      '${weatherToday?.wind?.speed} ${'m_s'.tr()} ${weatherToday?.wind?.windDirection}',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.iconSunset,
                  status:
                      '${weatherToday?.sys?.getSunset}',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  title: 'min'.tr().toString(),
                  status: "$weatherTodayTempMin °${'deg'.tr()}",
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
