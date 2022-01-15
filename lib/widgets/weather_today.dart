import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/models/current_weather.dart';
import 'package:the_weather_app/models/unix.dart';
import 'package:the_weather_app/models/wind_direction.dart';

import 'package:the_weather_app/providers/weather_provider.dart';

import 'dashboard_weather.dart';

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherToday = Provider.of<WeatherProvider>(context).weatherNow;
    final weatherTodayNotDetailed =
        Provider.of<WeatherProvider>(context).todayWeather;
    // final city = Provider.of<WeatherProvider>(context).location;
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < screenSize.height;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          margin: const EdgeInsets.only(top: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: isPortrait
                      ? constraints.maxHeight * 0.015
                      : constraints.maxHeight * 0.017,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    weatherToday.isImageNetwork
                        ? Image.network(
                            weatherToday.image,
                            // width: constraints.maxWidth * 0.5,
                            width: constraints.maxWidth * 0.325,
                            height: isPortrait
                                ? constraints.maxHeight * 0.5
                                : constraints.maxHeight * 0.4,
                            fit: isPortrait ? BoxFit.contain : BoxFit.fitHeight,
                          )
                        : Image.asset(
                            weatherToday.image,
                            // width: isPortrait ? constraints.maxWidth * 0.65 : constraints.maxWidth * 0.5 ,
                            width: isPortrait ? constraints.maxWidth * 0.65 : constraints.maxWidth *0.325 ,
                            height: isPortrait
                                ? constraints.maxHeight * 0.5
                                : constraints.maxHeight * 0.4,
                            fit: isPortrait ? BoxFit.contain : BoxFit.fitHeight,
                          ),
                    Container(
                      // width:  isPortrait ? constraints.maxWidth * 0.25 : constraints.maxWidth * 0.5 ,
                      width:  isPortrait ? constraints.maxWidth * 0.25 : constraints.maxWidth * 0.325,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(18.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: AutoSizeText(
                          '${weatherToday.temp} °C',
                          style: TextStyle(fontSize: 40),
                          maxFontSize: 55,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.65,
                height: constraints.maxHeight * 0.06,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Feels like ${weatherToday.feelsLike}°C, ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(weatherToday.detailedDescription),
                    ],
                  ),
                ),
              ),
              Container(
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.3,
                  child: todayDetails(
                    weatherToday: weatherToday,
                    weatherTodayRain: weatherTodayNotDetailed.rain,
                    weatherTodayTempMax: weatherTodayNotDetailed.tempMax,
                    weatherTodayTempMin: weatherTodayNotDetailed.tempMin,
                  )),
            ],
          ),
        );
      },
    );
  }
}

class todayDetails extends StatelessWidget {
  const todayDetails(
      {Key key,
      @required this.weatherToday,
      this.weatherTodayRain,
      this.weatherTodayTempMax,
      this.weatherTodayTempMin})
      : super(key: key);

  final CurrentWeather weatherToday;
  final String weatherTodayTempMax;
  final String weatherTodayTempMin;
  final String weatherTodayRain;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      // return Container(color: Colors.lightBlue,);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: 'assets/dashboard_icons/rain.svg',
                  status: '${double.tryParse(weatherTodayRain) * 100.0}%',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: 'assets/dashboard_icons/sunrise.svg',
                  status:
                      '${unixSecondsToDateFormat(int.parse(weatherToday.sunrise))}',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  isStatusCentered: false,
                  title: "Max",
                  status: "${weatherTodayTempMax}°C",
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: 'assets/dashboard_icons/wind_2.svg',
                  status:
                      '${weatherToday.windSpeed} m/s ${windDirection(int.parse(weatherToday.windDeg))}',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  isStatusCentered: false,
                  svgIcon: 'assets/dashboard_icons/sunset.svg',
                  status:
                      '${unixSecondsToDateFormat(int.parse(weatherToday.sunset))}',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  isStatusCentered: false,
                  title: "Min",
                  status: "${weatherTodayTempMin}°C",
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
