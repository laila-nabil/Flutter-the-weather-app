import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
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
      height: 150,
      // width: double.infinity,
      child: ScrollablePositionedList.builder(
        // initialScrollIndex: 4,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CompactDayWeather(
              date: weatherList[i].date,
              day:  DateFormat('EEE').format(weatherList[i].date),
              maxTemp: weatherList[i].tempMax,
              minTemp: weatherList[i].tempMin,
              image:weatherList[i].image,
              isImageNetwork: weatherList[i].isImageNetwork,
              temp: weatherList[i].tempCurrent,

            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
        padding: const EdgeInsets.all(25.0),
      ),
    );
  }
}
