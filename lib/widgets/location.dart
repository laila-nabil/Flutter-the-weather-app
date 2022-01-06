import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final city = Provider.of<WeatherProvider>(context).location;
    return FittedBox(
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
    );
  }
}
