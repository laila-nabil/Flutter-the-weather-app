import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_weather_app/models/unix.dart';

import 'package:the_weather_app/providers/weather_provider.dart';
import '../widgets/custom_icons.dart';

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherToday = Provider.of<WeatherProvider>(context).weatherNow;
    final city = Provider.of<WeatherProvider>(context).location;
    return Container(
      width: double.infinity,
      // height: 300,
      margin: const EdgeInsets.all(18.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // shadowColor: Colors.grey,
        // elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(city),
            Text(weatherToday.mainDescription),
            Row(
              children: [
                weatherToday.isImageNetwork
                    ? Image.network(
                        weatherToday.image,
                        width: 150,
                        height: 150,
                      )
                    : Image.asset(
                        weatherToday.image,
                        width: 150,
                        height: 150,
                      ),
                Text(
                  '${weatherToday.temp} °C',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            // Text('Chances of rain: ${weatherToday}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dashboardWeather(
                      svgIcon: 'assets/dashboard_icons/rain.svg',
                      status: 'Rain',
                    ),
                    dashboardWeather(
                      svgIcon: 'assets/dashboard_icons/sunrise.svg',
                      status:
                          '${unixSecondsToDateFormat(int.parse(weatherToday.sunrise))}',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dashboardWeather(
                      svgIcon: 'assets/dashboard_icons/wind_2.svg',
                      status: '${weatherToday.windSpeed}',
                    ),
                    dashboardWeather(
                      svgIcon: 'assets/dashboard_icons/sunset.svg',
                      status:
                          '${unixSecondsToDateFormat(int.parse(weatherToday.sunset))}',
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'The high will be ${weatherToday.tempMax}°C, the low will be ${weatherToday.tempMin}°C.'),
            ),
          ],
        ),
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
            width: 25,
            height: 25,
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
