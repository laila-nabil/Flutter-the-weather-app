import 'package:flutter/material.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/compact_day_weather.dart';

class WeatherList extends StatelessWidget {
  final List<WeatherEntity> weatherList;

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
