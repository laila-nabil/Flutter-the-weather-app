import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/widgets/weather_list.dart';

class WeatherTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherTabs = Provider.of<WeatherProvider>(context).allWeather;
    const todayIndex = 4;
    return LayoutBuilder(builder: (ctx, constraints) {
      return DefaultTabController(
          length: weatherTabs.length, // length of tabs
          initialIndex: todayIndex,
          child: Column(children: <Widget>[
            Container(
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  ...weatherTabs.asMap().entries.map((e) {
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
                                (e.value.image != null &&
                                    e.value.image != "" &&
                                    e.value.image !=
                                        'assets/weather_status/clear.png'))
                              Image.network(
                                e.value.image,
                                width: 50,
                                height: 50,
                              ),
                            if (!e.value.isImageNetwork &&
                                (e.value.image != null &&
                                    e.value.image != "" &&
                                    e.value.image !=
                                        'assets/weather_status/clear.png'))
                              Image.asset(
                                e.value.image,
                                width: 35,
                                height: 35,
                              ),
                            Column(
                              children: [
                                Text(
                                  day,
                                  style: TextStyle(color: Colors.white),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                        "${double.tryParse(e.value.tempMax).toStringAsFixed(1)} ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    TextSpan(
                                        text:
                                        "${double.tryParse(e.value.tempMin).toStringAsFixed(1)} ",
                                        style: TextStyle(color: Colors.white)),

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
                child: TabBarView(children: <Widget>[
                  ...weatherTabs
                      // .map((e) => WeatherList(e.weatherTimeline))
                      .map((e) {
                    // print("e.date ${e.date}");
                    // print("e.weatherTimeline ${e.weatherTimeline.length}");
                    return WeatherList(e.weatherTimeline);
                  }).toList()
                ]))
          ]));
    });
  }
}
