import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class CompareWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final compareWeather =
        Provider.of<WeatherProvider>(context).compareTodayYesterday;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xff272F3A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            compareWeather,
            // softWrap: true,
            maxLines: 3,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
