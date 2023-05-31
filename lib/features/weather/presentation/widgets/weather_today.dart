import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/core/widgets/frosted_glass_effect_card.dart';
import 'dashboard_weather.dart';

class WeatherTodayDetails {
  final String? iconPath;
  final String? currentTemp;
  final String? feelsLike;
  final String? description;
  final String? rain;
  final String? todayMax;
  final String? todayMin;
  final String? sunrise;
  final String? sunset;
  final String? windSpeed;
  final String? windDirection;

  WeatherTodayDetails(
      {this.iconPath,
      this.currentTemp,
      this.feelsLike,
      this.description,
      this.rain,
      this.todayMax,
      this.todayMin,
      this.windSpeed,
      this.windDirection,
      this.sunrise,
      this.sunset});
}

class WeatherTodayWidget extends StatelessWidget {
  final WeatherTodayDetails? weatherTodayDetails;

  const WeatherTodayWidget({
    Key? key,
    required this.weatherTodayDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final city = Provider.of<WeatherProvider>(context).location;
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < screenSize.height;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        var weather = _WeatherToday(
          weatherToday: weatherTodayDetails,
          isPortrait: isPortrait,
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
  const _WeatherToday({
    Key? key,
    required this.weatherToday,
    required this.isPortrait,
    required this.constraints,
  }) : super(key: key);

  final WeatherTodayDetails? weatherToday;
  final bool isPortrait;
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
            if (weatherToday?.iconPath?.isNotEmpty == true)
              Expanded(
                flex: 1,
                child: Image.asset(
                  weatherToday?.iconPath ?? "",
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
                    '${weatherToday?.currentTemp} °${'deg'.tr()}',
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
                  text: '${weatherToday?.feelsLike} °${'deg'.tr()}, ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                text: weatherToday?.description ?? "",
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
            )),
      ],
    );
  }
}

class TodayDetails extends StatelessWidget {
  const TodayDetails({
    Key? key,
    required this.weatherToday,
  }) : super(key: key);

  final WeatherTodayDetails? weatherToday;

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
              if (double.tryParse(weatherToday?.rain ?? "") != null)
                SizedBox(
                  width: width,
                  height: height,
                  child: DashboardWeather(
                    isStatusCentered: false,
                    svgIcon: AppAssets.iconRain,
                    status:
                        '${double.tryParse(weatherToday?.rain ?? "")! * 100.0}%',
                  ),
                ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.iconSunrise,
                  status: '${weatherToday?.sunrise}',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  title: 'max'.tr().toString(),
                  status: "${weatherToday?.todayMax} °${'deg'.tr()}",
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
                      '${weatherToday?.windSpeed} ${'m_s'.tr()} ${weatherToday?.windDirection}',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  svgIcon: AppAssets.iconSunset,
                  status: '${weatherToday?.sunset}',
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: DashboardWeather(
                  isStatusCentered: false,
                  title: 'min'.tr().toString(),
                  status: "${weatherToday?.todayMin} °${'deg'.tr()}",
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
