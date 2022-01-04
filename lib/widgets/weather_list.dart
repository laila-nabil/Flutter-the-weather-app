import 'package:intl/intl.dart';
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
        itemBuilder: (ctx, i) {
          return CompactDayWeather(weatherList[i]);
          return weatherList[i].date.isAfter(DateTime.now())
              ? CompactDayWeather(weatherList[i])
              : Center(
                  child: Column(
                  children: [
                    // Text("${weatherList[i].date}"),
                    Text("${weatherList[i].weatherTimeline}"),
                  ],
                ));
        },
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
      ),
    );
  }
}
