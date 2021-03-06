import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:the_weather_app/providers/weather_provider.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/location';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<Map<String, String>> autoCompleteList = [];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final theme = Theme.of(context);
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
          appBar: AppBar(
            backgroundColor: theme.backgroundColor,
            elevation: 0,
            title: Text(
              'location'.tr().toString(),
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        } else {
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
                              Text('search_location'.tr().toString()),
                            ],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.purple),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      print('location :start');
                      try{
                        await Provider.of<WeatherProvider>(context,listen: false)
                            .setLocationLatLon(byCurrentLocation: true);
                      }catch(Error){
                        print('location :error catched');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(Error.toString())));
                      }
                      print('location :end');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.my_location , color: Colors.white,),
                          SizedBox(width: 5,),
                          Text(
                            'current_location'.tr(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.7,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        return InkWell(
                            onTap: () async {
                              await Provider.of<WeatherProvider>(context,
                                      listen: false)
                                  .setLocationLatLon(
                                      byCurrentLocation: false,
                                      selectedLat:
                                          '${autoCompleteList[i]['lat']}',
                                      selectedLon:
                                          '${autoCompleteList[i]['lon']}');
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${autoCompleteList[i]['city']}${autoCompleteList[i]['country']}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ));
                      },
                      itemCount: autoCompleteList.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
