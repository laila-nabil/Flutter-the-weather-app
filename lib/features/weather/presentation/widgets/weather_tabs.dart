import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/weather_list.dart';

import 'compact_day_weather.dart';

class WeatherTabs extends StatelessWidget {
  final List<DayWeatherParams> days;
  final int numOfHistoryDays;
  const WeatherTabs(
      {Key? key,
      required this.days,
      required this.numOfHistoryDays,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    final todayIndex = numOfHistoryDays;
    return LayoutBuilder(builder: (ctx, constraints) {
      return DefaultTabController(
          length: (days.length), // length of tabs
          initialIndex: todayIndex,
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
