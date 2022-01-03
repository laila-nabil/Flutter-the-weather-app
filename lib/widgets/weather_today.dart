import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_weather_app/models/current_weather.dart';
import 'package:the_weather_app/models/unix.dart';
import 'package:the_weather_app/models/wind_direction.dart';

import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/widgets/custom_grid.dart';

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherToday = Provider.of<WeatherProvider>(context).weatherNow;
    final city = Provider.of<WeatherProvider>(context).location;
    return LayoutBuilder(
      builder: (ctx, constraints) {
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
                          height: constraints.maxHeight * 0.5,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          weatherToday.image,
                          width: constraints.maxWidth * 0.65,
                          height: constraints.maxHeight * 0.5,
                          fit: BoxFit.contain,
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
              // Expanded(
              Container(
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.3,
                  child: NewWidget(weatherToday: weatherToday)),
            ],
          ),
        );
      },
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.weatherToday,
  }) : super(key: key);

  final CurrentWeather weatherToday;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraints){
      print("new widget constraints $constraints");
      // return Container(color: Colors.lightBlue,);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/rain.svg',
                status: '${double.parse(weatherToday.rain) * 100.0}%',
              ),
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/sunrise.svg',
                status:
                '${unixSecondsToDateFormat(int.parse(weatherToday.sunrise))}',
              ),
              dashboardWeather(
                title: "Max",
                status: "${weatherToday.tempMax}°C",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/wind_2.svg',
                status:
                '${weatherToday.windSpeed} m/s ${windDirection(int.parse(weatherToday.windDeg))}',
              ),
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/sunset.svg',
                status:
                '${unixSecondsToDateFormat(int.parse(weatherToday.sunset))}',
              ),
              dashboardWeather(
                title: "Min",
                status: "${weatherToday.tempMin}°C",
              )
            ],
          ),
        ],
      );
    });
  }
}

class dashboardWeather extends StatelessWidget {
  final String svgIcon;
  final String title;
  final String status;

  dashboardWeather({this.svgIcon, this.title, this.status});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      print("dashboardWeather constraints $constraints");
      return Row(
        children: [
          if (svgIcon != null)
            SvgPicture.asset(
              svgIcon,
              // width: 22,
              // height: 22,
              color: Colors.white,
            ),
          if (title != null) Text(title),
          Text(status)
        ],
      );
    });
  }
}
