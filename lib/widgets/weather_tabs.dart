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
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DefaultTabController(
                length: weatherTabs.length, // length of tabs
                initialIndex: 5,
                child: Column(children: <Widget>[
                  Container(
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        ...weatherTabs.map((e) => Tab(
                              child: Row(
                                children: [
                                  if (e.isImageNetwork && e.image != null)
                                    Image.network(
                                      e.image,
                                      width: 50,
                                      height: 50,
                                    ),
                                  if (e.isImageNetwork && e.image == null)
                                    Image.asset(
                                      e.image,
                                      width: 10,
                                      height: 10,
                                    ),
                                  Column(
                                    children: [
                                      Text(DateFormat.MMMEd().format(e.date)),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "${e.tempMax}°C ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: "${e.tempMin}°C",
                                              style: TextStyle(
                                                  color: Colors.black)),
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
                            .map((e) => WeatherList(e.weatherTimeline))
                            .toList()
                      ]))
                ])),
          ]),
    );
  }
}
