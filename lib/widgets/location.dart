import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/screens/location_screen.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final city = Provider.of<WeatherProvider>(context,listen: true).location;
    return LayoutBuilder(builder: (ctx, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(constraints.maxHeight * 0.1),
            child: IconButton(
                onPressed: () async {
                  print('location :start');
                  try{
                    await Provider.of<WeatherProvider>(context,listen: false)
                        .setLocationLatLon();
                  }catch(Error){
                    print('location :error catched');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(Error.toString())));
                  }
                  print('location :end');
                },
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: constraints.maxHeight * 0.8,
                )),
          ),
          Container(
            width: constraints.maxWidth * 0.4,
            padding:
                EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.1),
            child: AutoSizeText(
              city,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              minFontSize: 10.0,
              maxFontSize: 20.0,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(constraints.maxHeight * 0.1),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LocationScreen.routeName);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: constraints.maxHeight * 0.8,
                )),
          ),
        ],
      );
    });
  }
}
