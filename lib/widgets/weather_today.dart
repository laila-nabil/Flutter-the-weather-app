import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

import '../widgets/custom_icons.dart';

class WeatherToday extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final weatherToday = Provider.of<WeatherProvider>(context).todayWeather;
    return Container(
      width: double.infinity,
      // height: 300,
      margin: const EdgeInsets.all(25.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // shadowColor: Colors.grey,
        // elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(weatherToday.mainDescription),
            Text('${DateFormat('dd MMMM yyyy - hh:mm').format(DateTime.now())}'),
            Image.asset(CustomIcons.cloudy, width: 150,height: 150, ),
            Text(weatherToday.tempMax),
            Text(weatherToday.tempMin),
          ],
        ),
      ),
    );
  }
}
