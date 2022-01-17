import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    List<String> autoCompleteList = [];
    return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white.withOpacity(0.2), width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff2d3647)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (input) async {
                      print('input $input');
                      if (input.length > 3) {
                        autoCompleteList = await Provider.of<WeatherProvider>(
                                context,
                                listen: false)
                            .autoCompleteSearchLocation(input);
                        print('autoCompleteList $autoCompleteList');
                      }
                    },
                    decoration: InputDecoration(
                        label: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Add Location'),
                          ],
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.purple),
                  ),
                ),
                ...autoCompleteList
                    .map((e) => Container(
                          color: Colors.orange,
                          child: Text(
                            e,
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ));
  }
}
