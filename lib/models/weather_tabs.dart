import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class WeatherTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherList =
        Provider.of<WeatherProvider>(context).allWeather;
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DefaultTabController(
                length: 8, // length of tabs
                initialIndex: 5,
                child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Tab 1'),
                            Tab(text: 'Tab 2'),
                            Tab(text: 'Tab 3'),
                            Tab(text: 'Tab 4'),
                            Tab(text: 'Tab 1'),
                            Tab(text: 'Tab 2'),
                            Tab(text: 'Tab 3'),
                            Tab(text: 'Tab 4'),
                          ],
                        ),
                      ),
                      Container(
                          height: 100, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5))),
                          child:
                          TabBarView(children: <Widget>[
                            Container(
                              child: Center(
                                child: Text('Display Tab 1',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 4',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 1',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 4',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ]),
    );
  }
}
