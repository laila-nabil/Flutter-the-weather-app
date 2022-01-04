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
    final city = Provider.of<WeatherProvider>(context).location;
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < screenSize.height;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        print("constraints here is $constraints");
        return Container(
          // width: constraints.maxWidth,
          // height: constraints.maxHeight,
          margin: const EdgeInsets.only(top: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: constraints.maxHeight * 0.07,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Text(
                        city,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  weatherToday.isImageNetwork
                      ? Image.network(
                          weatherToday.image,
                          width: constraints.maxWidth * 0.5,
                          height: isPortrait ? constraints.maxHeight * 0.5 : constraints.maxHeight * 0.4,
                          fit: isPortrait ? BoxFit.contain : BoxFit.fitHeight,
                        )
                      : Image.asset(
                          weatherToday.image,
                          width: constraints.maxWidth * 0.65,
                          height: isPortrait ? constraints.maxHeight * 0.5 : constraints.maxHeight * 0.4,
                          fit: isPortrait ? BoxFit.contain : BoxFit.fitHeight,
                        ),
                  Container(
                    width: constraints.maxWidth * 0.25,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '${weatherToday.temp} °C',
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: constraints.maxWidth * 0.65,
                 height: constraints.maxHeight * 0.06 ,
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
                  child: todayDetails(weatherToday: weatherToday)),
            ],
          ),
        );
      },
    );
  }
}

class todayDetails extends StatelessWidget {
  const todayDetails({
    Key key,
    @required this.weatherToday,
  }) : super(key: key);

  final CurrentWeather weatherToday;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      print("new widget constraints $constraints");
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
                  svgIcon: 'assets/dashboard_icons/rain.svg',
                  status: '${double.parse(weatherToday.rain) * 100.0}%',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  svgIcon: 'assets/dashboard_icons/sunrise.svg',
                  status:
                      '${unixSecondsToDateFormat(int.parse(weatherToday.sunrise))}',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  title: "Max",
                  status: "${weatherToday.tempMax}°C",
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
                  svgIcon: 'assets/dashboard_icons/wind_2.svg',
                  status:
                      '${weatherToday.windSpeed} m/s ${windDirection(int.parse(weatherToday.windDeg))}',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  svgIcon: 'assets/dashboard_icons/sunset.svg',
                  status:
                      '${unixSecondsToDateFormat(int.parse(weatherToday.sunset))}',
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.25,
                child: dashboardWeather(
                  title: "Min",
                  status: "${weatherToday.tempMin}°C",
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
