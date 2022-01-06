import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/models/wind_direction.dart';
import 'package:the_weather_app/widgets/custom_grid.dart';
import 'dashboard_weather.dart';

class WeatherDetailed extends StatelessWidget {
  final Weather weatherDay;

  WeatherDetailed(this.weatherDay);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (ctx, constraints) {
      final dashboard = [
        dashboardWeather(
          isStatusCentered: false,
          svgIcon: 'assets/dashboard_icons/rain.svg',
          status: '${double.parse(weatherDay.rain) * 100.0}%',
        ),
        dashboardWeather(
          isStatusCentered: false,
          svgIcon: 'assets/dashboard_icons/wind_2.svg',
          status:
              '${weatherDay.windSpeed} m/s ${windDirection(int.parse(weatherDay.windDeg))}',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Pressure',
          status: '${double.parse(weatherDay.pressure)}  hPa',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Clouds',
          status: '${double.parse(weatherDay.clouds)}%',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Uvi',
          status: '${double.parse(weatherDay.uvi)}',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Humidity',
          status: '${double.parse(weatherDay.humidity)}%',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Visibility',
          status: double.parse(weatherDay.visibility) > 1000
              ? '${(double.parse(weatherDay.visibility) / 1000).toStringAsFixed(1)} km'
              : '${double.parse(weatherDay.visibility)} m',
        ),
      ];
      final cols = 2;
      final rows = (dashboard.length / cols).round();
      final containerHeight = (constraints.maxHeight * (0.2)) / rows;
      print(
          "constraints.maxHeight ${constraints.maxHeight} containerHeight $containerHeight for rows $rows and cols $cols");
      final List<Widget> newDashboard = [];
      dashboard.forEach((element) {
        newDashboard.add(Container(
          height: containerHeight,
          child: element,
        ));
      });
      print("for detailed,$constraints");
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          color: Theme.of(context).backgroundColor,
        ),
        // height: 300,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                weatherDay.isImageNetwork
                    ? Image.network(
                        weatherDay.image,
                        width: constraints.maxWidth * 0.6,
                        height: constraints.maxHeight * 0.4,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        weatherDay.image,
                        width: constraints.maxWidth * 0.6,
                        height: constraints.maxHeight * 0.4,
                        fit: BoxFit.contain,
                        // width: 150,
                        // height: 150,
                      ),
                AutoSizeText(
                  '${weatherDay.tempCurrent} °C',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (weatherDay.feelsLike != null && weatherDay.feelsLike != "")
                  Container(
                    height: constraints.maxHeight * 0.1,
                    padding: EdgeInsets.all(constraints.maxHeight * 0.02),
                    child: AutoSizeText(
                      'Feels like ${weatherDay.feelsLike}°C, ',
                      minFontSize: 20,
                      maxFontSize: 37,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                AutoSizeText(
                  weatherDay.detailedDescription,
                  minFontSize: 20,
                  maxFontSize: 37,
                ),
              ],
            ),
            GoogleGrid(
              // children: dashboard,
              children: newDashboard,
              columnCount: cols,
              gap: containerHeight * 0.5,
            )
          ],
        ),
      );
    });
  }
}
