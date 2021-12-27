import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:the_weather_app/providers/weather_provider.dart';
import '../widgets/custom_icons.dart';

class CompactDayWeather extends StatelessWidget {
  final DateTime date;
  final String day;
  final String maxTemp;
  final String minTemp;
  final String temp;
  final String image;
  final bool isImageNetwork;

  CompactDayWeather({
    @required this.date,
    @required this.day,
    this.maxTemp,
    @required this.isImageNetwork,
    @required this.image,
    this.minTemp,
    this.temp,
  });

  bool isToday(DateTime date) {
    final today = DateTime.now();
    return date.day == today.day &&
        date.month == today.month &&
        date.year == today.year;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      // print('Height constraints are ${constraints.minHeight} ${constraints.maxHeight}');
      // print('Width constraints are ${constraints.minWidth} ${constraints.maxWidth}');
      return Card(
        // color: isToday(date) ? Colors.lightBlue : Colors.white60,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          padding: EdgeInsets.all(constraints.minHeight * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(day),
              Text(DateFormat('kk:mm a').format(date)),
              isImageNetwork
                  ? Image.network(
                      image,
                      width: constraints.maxHeight * 0.5,
                      height: constraints.maxHeight * 0.27,
                    )
                  : Image.asset(
                      CustomIcons.sunny,
                      width: constraints.maxHeight * 0.5,
                      height: constraints.maxHeight * 0.27,
                    ),
              // Text(maxTemp),
              // Text(minTemp),
              Text(temp),
            ],
          ),
        ),
      );
    });
    ;
  }
}
