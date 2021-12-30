import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/widgets/weather_list.dart';

class WeatherTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherTabs = Provider.of<WeatherProvider>(context).weatherTabs;
    print('weatherTabs.length, ${weatherTabs.length}');
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DefaultTabController(
                length: weatherTabs.length, // length of tabs
                initialIndex: 5,
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                              // ...weatherTabs.map((e) => Tab(text: e[0].date.toString()),).toList()
                              ...weatherTabs.keys.map((e) => Tab(text: e.toString(),)).toList()
                          ],
                        ),
                      ),
                      Container(
                          height: 150, //height of TabBarView
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(
                              children: <Widget>[
                            ...weatherTabs.values
                                .map((e) {
                                print("e[0].is network");
                                  print(e[0].isImageNetwork);
                                  return  WeatherList(e);
                              }
                            )
                                .toList()
                          ]))
                    ])),
          ]),
    );
  }
}
