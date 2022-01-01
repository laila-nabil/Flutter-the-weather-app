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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      // height: 300,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          weatherDay.isImageNetwork
              ? Image.network(
            weatherDay.image,
            width: 150,
            height: 150,
            fit: BoxFit.fitHeight,
          )
              : Image.asset(
            weatherDay.image,
            // width: 150,
            // height: 150,
          ),
          Text(
            '${weatherDay.tempCurrent} °C',
            style: TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(weatherDay.feelsLike!=null && weatherDay.feelsLike!="")
                Text(
                'Feels like ${weatherDay.feelsLike}°C, ',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(weatherDay.detailedDescription),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if(weatherDay.rain!=null && weatherDay.rain!="")
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/rain.svg',
                status: '${double.parse(weatherDay.rain) * 100.0}%',
              ),
              if(weatherDay.windSpeed!=null && weatherDay.windSpeed!="")
              dashboardWeather(
                svgIcon: 'assets/dashboard_icons/wind_2.svg',
                status:
                    '${weatherDay.windSpeed} m/s ${windDirection(int.parse(weatherDay.windDeg))}',
              ),
            ],
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
