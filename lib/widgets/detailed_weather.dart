import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/models/wind_direction.dart';
import 'dashboard_weather.dart';

class WeatherDetailed extends StatelessWidget {
  final Weather weatherDay;

  WeatherDetailed(this.weatherDay);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (ctx , constraints){
      print("for detailed,$constraints");
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
          color: Theme.of(context).backgroundColor,

        ),
        // height: 300,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            weatherDay.isImageNetwork
                ? Image.network(
              weatherDay.image,
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.4,
              fit: BoxFit.contain,
            )
                : Image.asset(
              weatherDay.image,
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.4,
              fit: BoxFit.contain,
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
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
    });
  }
}