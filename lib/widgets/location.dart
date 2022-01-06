import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final city = Provider.of<WeatherProvider>(context).location;
    return LayoutBuilder(builder: (ctx,constraints){
      print("location constraints $constraints");
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight *0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: (){}, icon:  Icon(Icons.location_on , color: Colors.white,size: constraints.maxHeight * 0.8,)),
            AutoSizeText(
              city,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
              minFontSize: 10.0,
              maxFontSize: 18.0,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
