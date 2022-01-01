import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/widgets/weather_list.dart';

class WeatherTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherTabs = Provider.of<WeatherProvider>(context).allWeather;
    print('weatherTabs.length, ${weatherTabs.length}');
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        DefaultTabController(
            length: weatherTabs.length, // length of tabs
            initialIndex: 5,
            child: Column(children: <Widget>[
              Container(
                child: TabBar(
                  isScrollable: true,
                  // labelColor: Colors.green,
                  labelColor: Colors.black,
                  // indicatorColor: Colors.purple,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    ...weatherTabs.map((e) => Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (e.isImageNetwork &&
                                  (e.image != null &&
                                      e.image != "" &&
                                      e.image !=
                                          'assets/weather_status/clear.png'))
                                Image.network(
                                  e.image,
                                  width: 50,
                                  height: 50,
                                ),
                              if (!e.isImageNetwork &&
                                  (e.image != null &&
                                      e.image != "" &&
                                      e.image !=
                                          'assets/weather_status/clear.png'))
                                Image.asset(
                                  e.image,
                                  width: 35,
                                  height: 35,
                                ),
                              Column(
                                children: [
                                  Text(DateFormat.MMMEd().format(e.date)),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "${double.parse(e.tempMax).toStringAsFixed(1)} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text:
                                              "${double.parse(e.tempMin).toStringAsFixed(1)} ",
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                  height: 150, //height of TabBarView
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(children: <Widget>[
                    ...weatherTabs
                        // .map((e) => WeatherList(e.weatherTimeline))
                        .map((e) {
                      print("e.date ${e.date}");
                      print("e.weatherTimeline ${e.weatherTimeline.length}");
                      return WeatherList(e.weatherTimeline);
                    }).toList()
                  ]))
            ])),
      ]),
    );
  }
}
