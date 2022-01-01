import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/widgets/detailed_weather.dart';

import '../widgets/custom_icons.dart';

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
      print('Height constraints are ${constraints.minHeight} ${constraints.maxHeight}');
      print('Width constraints are ${constraints.minWidth} ${constraints.maxWidth}');

      return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return WeatherDetailed(detailedWeather);
              });
        },
        child: Container(
          padding: EdgeInsets.all(constraints.minHeight * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(day),
              Text(DateFormat('hh:mm a').format(detailedWeather.date)),
              detailedWeather.isImageNetwork
                  ? Image.network(
                      detailedWeather.image,
                      width: constraints.maxHeight * 0.5,
                      height: constraints.maxHeight * 0.27,
                    )
                  : Image.asset(
                detailedWeather.image,
                      width: constraints.maxHeight * 0.4,
                      height: constraints.maxHeight * 0.2,
                    ),
              Text("${detailedWeather.tempCurrent}°C"),
              if(detailedWeather.rain!=null && detailedWeather.rain!="")
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/rain.svg',
                status: '${double.parse(detailedWeather.rain) * 100.0}%',
              ),
            ],
          ),
        ),
      );
    });
  }
}
