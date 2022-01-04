import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/widgets/detailed_weather.dart';

import 'dashboard_weather.dart';

class CompactDayWeather extends StatelessWidget {
  final Weather detailedWeather;

  CompactDayWeather(this.detailedWeather);

  // final DateTime date;
  // final String day;
  // final String maxTemp;
  // final String minTemp;
  // final String temp;
  // final String image;
  // final bool isImageNetwork;
  //
  // CompactDayWeather({
  //   @required this.date,
  //   @required this.day,
  //   this.maxTemp,
  //   @required this.isImageNetwork,
  //   @required this.image,
  //   this.minTemp,
  //   this.temp,
  // });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      print(
          'Height constraints are ${constraints.minHeight} ${constraints.maxHeight}');
      print(
          'Width constraints are ${constraints.minWidth} ${constraints.maxWidth}');
      final mediaQuery = MediaQuery.of(context);
      final isPortrait = mediaQuery.size.width < mediaQuery.size.height;
      final width = isPortrait ? mediaQuery.size.width * 0.2 : mediaQuery.size.width * 0.12;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(day),
              Container(
                  height: constraints.maxHeight * 0.2,
                  width: width,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                          DateFormat('hh:mm a').format(detailedWeather.date)))),
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
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("${detailedWeather.tempCurrent}°C"))),
              if (detailedWeather.rain != null && detailedWeather.rain != "")
                Container(
                  height: constraints.maxHeight * 0.2,
                  width: width,
                  child: dashboardWeather(
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
