import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/weather_list.dart';

import 'compact_day_weather.dart';

int todayIndex(List<DayWeatherParams> days){
  int todayIndex =
  days.indexWhere((element) {
    printDebug("element.date ${element.date}");
    printDebug("element.date ${element.date.isSameDay(DateTime.now())}");
    return element.date.isSameDay(DateTime.now());
  });
  if(todayIndex < 0){
    todayIndex = 3;
  }
  printDebug("todayIndex is $todayIndex");
  return todayIndex;
}

class WeatherTabs extends StatelessWidget {
  final List<DayWeatherParams> days;
  const WeatherTabs(
      {Key? key,
      required this.days,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (ctx, constraints) {
      return DefaultTabController(
          length: (days.length), // length of tabs
          initialIndex: todayIndex(days),
          child: Column(children: <Widget>[
            TabBar(
              isScrollable: true,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.grey,
              tabs: days.asMap().entries.map((e) {
                String day = DateFormat.MMMEd('locale'.tr().toString())
                    .format(e.value.date);
                final tab = Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (e.value.isImageNetwork &&
                          (e.value.iconPath != "" &&
                              e.value.iconPath !=
                                  'assets/weather_status/clear.png'))
                        Image.network(
                          e.value.iconPath,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      if (!e.value.isImageNetwork &&
                          (e.value.iconPath != "" &&
                              e.value.iconPath !=
                                  'assets/weather_status/clear.png'))
                        Image.asset(
                          e.value.iconPath,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            day,
                            style: const TextStyle(color: AppColors.white),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                    double.tryParse(e.value.maxTemp)?.round().toStringAsFixed(0) ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.white)),
                                const SizedBox(width: 10,),
                                Text(
                                    double.tryParse(e.value.minTemp)?.round().toStringAsFixed(0) ?? "",
                                    style: const TextStyle(color: AppColors.white))
                              ],),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                return tab;
              }).toList(),
            ),
            Container(
                height: constraints.maxHeight - 49,
                alignment: Alignment.topRight,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: AppColors.grey, width: 0.5))),
                child: TabBarView(
                    children: days
                        .map((e) => WeatherList(e.details ?? []))
                        .toList()))
          ]));
    });
  }
}
