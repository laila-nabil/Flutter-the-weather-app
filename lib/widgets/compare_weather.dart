import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class CompareWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final compareWeather = Provider.of<WeatherProvider>(context).compareTodayYesterday;
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          compareWeather,
          softWrap: true,
          maxLines: 2,
          style:
              TextStyle(fontWeight: FontWeight.bold,
                  // fontSize: 30
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
