import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_weather_app/widgets/compact_day_weather.dart';

class WeatherList extends StatelessWidget {
  final List<Weather> weatherList;

  WeatherList(this.weatherList);

  @override
  Widget build(BuildContext context) {
    // final weatherList =
    //     Provider.of<WeatherProvider>(context).allWeather;
    return Container(
      // height: 150,
      width: double.infinity,
      child: ScrollablePositionedList.builder(
        physics: AlwaysScrollableScrollPhysics(),

        itemBuilder: (ctx, i) {
          return CompactDayWeather(weatherList[i]);
        },
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
      ),
    );
  }
}
