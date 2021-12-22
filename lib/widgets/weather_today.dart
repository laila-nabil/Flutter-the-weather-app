import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            Text(
                '${DateFormat('dd MMMM yyyy - hh:mm').format(DateTime.now())}'),
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
                Text('${weatherToday.temp} °C' , style: TextStyle(fontSize: 25),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('The high will be ${weatherToday.tempMax}°C, the low will be ${weatherToday.tempMin}°C.'),
            ),
          ],
        ),
      ),
    );
  }
}
