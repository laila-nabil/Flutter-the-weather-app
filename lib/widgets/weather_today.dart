import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_weather_app/models/unix.dart';
import 'package:the_weather_app/models/wind_direction.dart';

import 'package:the_weather_app/providers/weather_provider.dart';

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherToday = Provider.of<WeatherProvider>(context).weatherNow;
    final city = Provider.of<WeatherProvider>(context).location;
    return Container(
      width: double.infinity,
      // height: 300,
      margin: const EdgeInsets.only(top: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on),
              Text(city),
            ],
          ),
          Row(
            children: [
              weatherToday.isImageNetwork
                  ? Image.network(
                      weatherToday.image,
                      height: 180,
                      fit: BoxFit.fitHeight,
                    )
                  : Image.asset(
                      weatherToday.image,
                      height: 170,
                      fit: BoxFit.fitHeight,
                    ),
              Text(
                '${weatherToday.temp} °C',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Feels like ${weatherToday.feelsLike}°C, ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(weatherToday.detailedDescription),
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
                    status: '${double.parse(weatherToday.rain) * 100.0}%',
                  ),
                  dashboardWeather(
                    svgIcon: 'assets/dashboard_icons/sunrise.svg',
                    status:
                        '${unixSecondsToDateFormat(int.parse(weatherToday.sunrise))}',
                  ),
                  dashboardWeather(title: "Max",status: "${weatherToday.tempMax}°C",)
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
                  dashboardWeather(title: "Min",status: "${weatherToday.tempMin}°C",)
                ],
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
  final String title;
  final String status;

  dashboardWeather({this.svgIcon,this.title, this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if(svgIcon!= null)
          SvgPicture.asset(
            svgIcon,
            width: 22,
            height: 22,
            color: Colors.white,
          ),
          if(title!= null)Text(title),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(status),
          )
        ],
      ),
    );
  }
}
