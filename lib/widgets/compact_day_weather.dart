import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/widgets/detailed_weather.dart';

import 'dashboard_weather.dart';

class CompactDayWeather extends StatelessWidget {
  final Weather detailedWeather;

  CompactDayWeather(this.detailedWeather);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      print(
          'Height constraints are ${constraints.minHeight} ${constraints.maxHeight}');
      print(
          'Width constraints are ${constraints.minWidth} ${constraints.maxWidth}');
      final mediaQuery = MediaQuery.of(context);
      final isPortrait = mediaQuery.size.width < mediaQuery.size.height;
      final width = isPortrait
          ? mediaQuery.size.width * 0.2
          : mediaQuery.size.width * 0.12;
      return InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return WeatherDetailed(detailedWeather);
              });
        },
        child: Container(
          padding: EdgeInsets.all(constraints.maxHeight * 0.07),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(day),
              Container(
                  height: constraints.maxHeight * 0.2,
                  width: width,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                      DateFormat('hh a').format(detailedWeather.date),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      minFontSize: 12,
                      maxFontSize: 25)),
              detailedWeather.isImageNetwork
                  ? Image.network(
                      detailedWeather.image,
                      // width: constraints.maxHeight * 0.5,
                      height: constraints.maxHeight * 0.27,
                      width: width,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      detailedWeather.image,
                      // width: constraints.maxHeight * 0.4,
                      height: constraints.maxHeight * 0.2,
                      width: width,
                      fit: BoxFit.contain,
                    ),
              Container(
                  height: constraints.maxHeight * 0.2,
                  width: width * 0.6,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "${double.parse(detailedWeather.tempCurrent).toStringAsFixed(1)}°C",
                    style: TextStyle(fontSize: 18),
                    minFontSize: 10,
                    maxFontSize: 18,
                    maxLines: 1,
                  )),
              if (detailedWeather.rain != null && detailedWeather.rain != "")
                Container(
                  height: constraints.maxHeight * 0.12,
                  width: isPortrait
                      ? mediaQuery.size.width * 0.2
                      : mediaQuery.size.width * 0.05,
                  alignment: Alignment.center,
                  child: dashboardWeather(
                    isStatusCentered: true,
                    svgIcon: 'assets/dashboard_icons/rain.svg',
                    status: '${double.parse(detailedWeather.rain) * 100.0}%',
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
