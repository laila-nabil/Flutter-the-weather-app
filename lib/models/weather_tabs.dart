import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/models/weather.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class WeatherTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherList = Provider.of<WeatherProvider>(context).hourlyWeather;
    List<Weather> weatherTabs= weatherList;

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
                              ...weatherTabs.map((e) => Tab(text: e.date.toString(),)).toList()
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
                                      child: Text(e.date.toString(),
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
