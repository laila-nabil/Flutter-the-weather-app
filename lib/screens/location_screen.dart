import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/location';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> autoCompleteList = [];
  List<String> dummyList = ['a' , 'b' , 'c'];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final orientation = mediaQuery.orientation;
    final isPortrait = screenSize.width < screenSize.height;
    return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
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
                        }else{
                          autoCompleteList = [];
                        }
                        setState(() {
                          print('autoCompleteList $autoCompleteList');
                        });
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
                  Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.3,
                    child: ListView.builder(itemBuilder: (ctx,i){
                      return Text(autoCompleteList[i]);
                    },itemCount: autoCompleteList.length,),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
