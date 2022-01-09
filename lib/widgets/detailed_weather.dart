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
    final isPortrait = screenSize.width < screenSize.height;
    print("detailed weather for ${weatherDay.date} ${weatherDay.lat} ${weatherDay.lon}");
    return LayoutBuilder(builder: (ctx, constraints) {
      final dashboard = [
        dashboardWeather(
          isStatusCentered: false,
          svgIcon: 'assets/dashboard_icons/rain.svg',
          status: '${double.tryParse(weatherDay.rain) * 100.0}%',
        ),

        dashboardWeather(
          isStatusCentered: false,
          svgIcon: 'assets/dashboard_icons/wind_2.svg',
          status:
      weatherDay.windSpeed.isNotEmpty&&weatherDay.windDeg.isNotEmpty ? '${weatherDay.windSpeed} m/s ${windDirection(int.tryParse(weatherDay.windDeg))}' : '_',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Pressure',
          status: '${double.tryParse(weatherDay.pressure)}  hPa',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Clouds',
          status: '${double.tryParse(weatherDay.clouds)}%',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Uvi',
          status: '${double.tryParse(weatherDay.uvi)}',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Humidity',
          status: '${double.tryParse(weatherDay.humidity)}%',
        ),
        dashboardWeather(
          isStatusCentered: false,
          title: 'Visibility',
          status: double.tryParse(weatherDay.visibility) > 1000
              ? '${(double.tryParse(weatherDay.visibility) / 1000).toStringAsFixed(1)} km'
              : '${double.tryParse(weatherDay.visibility)} m',
        ),
      ];
      final cols = isPortrait ? 2 : 4;
      final rows = (dashboard.length / cols).round();
      final containerHeight = (constraints.maxHeight * (0.2)) / rows;
      final List<Widget> newDashboard = [];
      dashboard.forEach((element) {
        newDashboard.add(Container(
          height: containerHeight,
          child: element,
        ));
      });
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          color: Theme.of(context).backgroundColor,
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
                weatherDay.isImageNetwork
                    ? Image.network(
                        weatherDay.image,
                        width: isPortrait
                            ? constraints.maxWidth * 0.5
                            : constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.4,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        weatherDay.image,
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
                    '${weatherDay.tempCurrent} °C',
                    style: TextStyle(fontSize: 22),
                    maxLines: 1,
                    minFontSize: 15,
                    maxFontSize: 22,
                  ),
                ),
                if (!isPortrait)
                  feelsLike(
                    constraints: constraints,
                    weatherDay: weatherDay,
                    isPortrait: isPortrait,
                  ),
              ],
            ),
            if (isPortrait)
              feelsLike(
                constraints: constraints,
                weatherDay: weatherDay,
                isPortrait: isPortrait,
              ),
            Expanded(child: Text(weatherDay.date.toString())),
            Expanded(child: Text('lat ${weatherDay.lat}, lon ${weatherDay.lon}')),
            GoogleGrid(
              // children: dashboard,
              children: newDashboard,
              columnCount: cols,
              // gap: containerHeight * 0.5,
            )
          ],
        ),
      );
    });
  }
}

class feelsLike extends StatelessWidget {
  final BoxConstraints constraints;
  final Weather weatherDay;
  final bool isPortrait;

  feelsLike({this.constraints, this.weatherDay, this.isPortrait});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (weatherDay.feelsLike != null && weatherDay.feelsLike != "")
          Container(
            alignment: Alignment.center,
            height: isPortrait
                ? constraints.maxHeight * 0.1
                : constraints.maxHeight * 0.3,
            width: isPortrait? constraints.maxWidth * 0.7 : constraints.maxWidth * 0.4,
            padding:
                EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.02),
            child: AutoSizeText.rich(
              TextSpan(text: 'Feels like ', children: [
                TextSpan(text: '${weatherDay.feelsLike}°C , '),
                TextSpan(
                    text: '${weatherDay.detailedDescription}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ]),
              // 'Feels like ${weatherDay.feelsLike}°C, ${weatherDay.detailedDescription}'
              minFontSize: 12,
              maxFontSize: 37,
              style: TextStyle(fontSize: 25, color: Colors.white),
              softWrap: true,
            ),
          ),
      ],
    );
  }
}
