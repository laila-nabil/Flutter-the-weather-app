import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/features/weather/domain/entities/history_weather.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/weather_list.dart';

import '../../domain/entities/present_future_weather.dart';
import '../../domain/entities/weather.dart';
import 'compact_day_weather.dart';

class WeatherTabs extends StatelessWidget {
  final List<DayWeatherParams> days;

  const WeatherTabs(
      {Key? key,
      required this.days,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    const todayIndex = 4;
    return LayoutBuilder(builder: (ctx, constraints) {
      return DefaultTabController(
          length: (days.length ?? 0), // length of tabs
          initialIndex: todayIndex,
          child: Column(children: <Widget>[
            Container(
              child: TabBar(
                isScrollable: true,
                labelColor: AppColors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  ...days.asMap().entries.map((e) {
                    String day;
                    switch(e.key) {
                      case todayIndex:
                        day = 'today'.tr().toString();
                        break;
                      case todayIndex + 1:
                        day = 'tomorrow'.tr().toString();
                        break;
                      case todayIndex - 1:
                        // day = 'Yesterday';
                        day = 'yesterday'.tr().toString();
                        break;
                      default:
                        day =  DateFormat.MMMEd('locale'.tr().toString()).format(e.value.date);
                    }
                    final tab = Tab(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (e.value.isImageNetwork &&
                                (e.value.iconPath != null &&
                                    e.value.iconPath != "" &&
                                    e.value.iconPath !=
                                        'assets/weather_status/clear.png'))
                              Image.network(
                                e.value.iconPath,
                                width: 50,
                                height: 50,
                              ),
                            if (!e.value.isImageNetwork &&
                                (e.value.iconPath != null &&
                                    e.value.iconPath != "" &&
                                    e.value.iconPath !=
                                        'assets/weather_status/clear.png'))
                              Image.asset(
                                e.value.iconPath,
                                width: 35,
                                height: 35,
                              ),
                            Column(
                              children: [
                                Text(
                                  day,
                                  style: TextStyle(color: AppColors.white),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                        e.value.maxTemp,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white)),
                                    TextSpan(
                                        text:
                                        e.value.minTemp,
                                        style: TextStyle(color: AppColors.white)),

                                  ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    return tab;
                  })
                ],
              ),
            ),
            Container(
                height: constraints.maxHeight - 49,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                    children: days
                        .map((e) => WeatherList(e.details ?? []))
                        .toList()))
          ]));
    });
  }
}
