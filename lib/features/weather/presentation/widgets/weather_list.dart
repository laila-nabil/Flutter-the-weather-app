import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/compact_day_weather.dart';

class WeatherList extends StatelessWidget {
  final List<DayWeatherParams> weatherList;

  const WeatherList(this.weatherList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScrollablePositionedList.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (ctx, i) {
          return CompactDayWeather(weatherList[i]);
        },
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
      ),
    );
  }
}
