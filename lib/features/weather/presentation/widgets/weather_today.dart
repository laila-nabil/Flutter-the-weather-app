import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/unix.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/wind_direction.dart';
import 'package:the_weather_app/widgets/frosted_glass_effect_card.dart';

import 'dashboard_weather.dart';

class WeatherToday extends StatelessWidget {
  final CurrentWeather weatherToday;
  final Weather weatherTodayNotDetailed;

  const WeatherToday(
      {Key? key,
      required this.weatherToday,
      required this.weatherTodayNotDetailed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final city = Provider.of<WeatherProvider>(context).location;
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < screenSize.height;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return isPortrait
            ? _WeatherToday(
                weatherToday: weatherToday,
                isPortrait: isPortrait,
                weatherTodayNotDetailed: weatherTodayNotDetailed,
                constraints: constraints,
              )
            : frostedGlassEffect(
                context: context,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                widget: _WeatherToday(
                  weatherToday: weatherToday,
                  isPortrait: isPortrait,
                  weatherTodayNotDetailed: weatherTodayNotDetailed,
                  constraints: constraints,
                ),
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
      required this.weatherTodayNotDetailed,
      required this.constraints})
      : super(key: key);

  final CurrentWeather weatherToday;
  final bool isPortrait;
  final Weather weatherTodayNotDetailed;
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
            weatherToday.isImageNetwork
                ? Expanded(
                    flex: 1,
                    child: Image.network(
                      weatherToday.image,
                      // width: constraints.maxWidth * 0.5,
                      // width: constraints.maxWidth * 0.325,
                      height: isPortrait
                          ? constraints.maxHeight * 0.5
                          : constraints.maxHeight * 0.4,
                      fit: BoxFit.contain,
                      alignment:
                          isPortrait ? Alignment.center : Alignment.centerLeft,
                    ),
                  )
                : Expanded(
                    flex: 1,
                    child: Image.asset(
                      weatherToday.image,
                      // width: isPortrait ? constraints.maxWidth * 0.65 : constraints.maxWidth * 0.5 ,
                      // width: isPortrait
                      //     ? constraints.maxWidth * 0.65
                      //     : constraints.maxWidth * 0.325,
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
                // width:  isPortrait ? constraints.maxWidth * 0.25 : constraints.maxWidth * 0.5 ,
                // width:  isPortrait ? constraints.maxWidth * 0.25 : constraints.maxWidth * 0.325,
                alignment: Alignment.center,
                padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: AutoSizeText(
                    '${weatherToday.temp} °' + 'deg'.tr().toString(),
                    style: TextStyle(fontSize: 40),
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
                  text: '${weatherToday.feelsLike} °' +
                      'deg'.tr().toString() +
                      ', ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                text: weatherToday.detailedDescription,
              )
            ]),
            style: TextStyle(fontSize: 25),
            minFontSize: 12,
            maxFontSize: 50,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        Container(
            // width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.25,
            child: todayDetails(
              weatherToday: weatherToday,
              weatherTodayRain: weatherTodayNotDetailed.rain,
              weatherTodayTempMax: weatherTodayNotDetailed.tempMax,
              weatherTodayTempMin: weatherTodayNotDetailed.tempMin,
            )),
      ],
    );
  }
}

class todayDetails extends StatelessWidget {
  const todayDetails(
      {Key? key,
      required this.weatherToday,
      required this.weatherTodayRain,
      required this.weatherTodayTempMax,
      required this.weatherTodayTempMin})
      : super(key: key);

  final CurrentWeather weatherToday;
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
              Container(
                width: width,
                height: height,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.IconRain,
                  status: '${double.parse(weatherTodayRain) * 100.0}%',
                ),
              ),
              Container(
                width: width,
                height: height,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.IconSunrise,
                  status:
                      '${unixSecondsToDateFormat(int.tryParse(weatherToday.sunrise)??0)}',
                ),
              ),
              Container(
                width: width,
                height: height,
                child: dashboardWeather(
                  isStatusCentered: false,
                  title: 'max'.tr().toString(),
                  status: "${weatherTodayTempMax} °" + 'deg'.tr().toString(),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width,
                height: height,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.IconWind2,
                  status:
                      '${weatherToday.windSpeed} ${'m_s'.tr()} ${windDirection(int.tryParse(weatherToday.windDeg)??0)}',
                ),
              ),
              Container(
                width: width,
                height: height,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.IconSunset,
                  status:
                      '${unixSecondsToDateFormat(int.tryParse(weatherToday.sunset)??0)}',
                ),
              ),
              Container(
                width: width,
                height: height,
                child: dashboardWeather(
                  isStatusCentered: false,
                  title: 'min'.tr().toString(),
                  status: "${weatherTodayTempMin} °" + 'deg'.tr().toString(),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
