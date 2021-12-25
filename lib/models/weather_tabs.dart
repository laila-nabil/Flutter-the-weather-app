import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

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
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                              ...weatherTabs.map((e) => Tab(text: e[0].date.toString()),).toList()
                          ],
                        ),
                      ),
                      Container(
                          height: 100, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            ...weatherTabs
                                .map((e) => Container(
                                        child: Center(
                                      child: Text(e[0].date.toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    )))
                                .toList()
                          ]))
                    ])),
          ]),
    );
  }
}
