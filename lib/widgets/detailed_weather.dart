import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_weather_app/models/unix.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/models/wind_direction.dart';

import 'package:the_weather_app/providers/weather_provider.dart';

class WeatherDetailed extends StatelessWidget {
  final Weather weatherDay;

  WeatherDetailed(this.weatherDay);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      // height: 300,
      margin: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              weatherDay.isImageNetwork
                  ? Image.network(
                weatherDay.image,
                      width: 150,
                      height: 150,
                    )
                  : Image.asset(
                weatherDay.image,
                      width: 150,
                      height: 150,
                    ),
              // Text(
              //   '${weatherDay.temp} °C',
              //   style: TextStyle(fontSize: 25),
              // )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Feels like ${weatherDay.feelsLike}°C, ',
              //   style:
              //   TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              // ),
              Text(weatherDay.detailedDescription),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dashboardWeather(
                    svgIcon: 'assets/dashboard_icons/rain.svg',
                    status: '${double.parse(weatherDay.rain)*100.0}%',
                  ),
                  // dashboardWeather(
                  //   svgIcon: 'assets/dashboard_icons/sunrise.svg',
                  //   status:
                  //       '${unixSecondsToDateFormat(int.parse(weatherDay.sunrise))}',
                  // ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // dashboardWeather(
                  //   svgIcon: 'assets/dashboard_icons/wind_2.svg',
                  //   status:
                  //       '${weatherToday.windSpeed} m/s ${windDirection(int.parse(weatherToday.windDeg))}',
                  // ),
                  // dashboardWeather(
                  //   svgIcon: 'assets/dashboard_icons/sunset.svg',
                  //   status:
                  //       '${unixSecondsToDateFormat(int.parse(weatherToday.sunset))}',
                  // ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'The high will be ${weatherDay.tempMax}°C, the low will be ${weatherDay.tempMin}°C.'),
          ),
        ],
      ),
    );
  }
}

class dashboardWeather extends StatelessWidget {
  final String svgIcon;
  final String status;

  dashboardWeather({this.svgIcon, this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIcon,
            width: 22,
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(status),
          )
        ],
      ),
    );
  }
}
