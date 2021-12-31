import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../widgets/weather_tabs.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/widgets/compare_weather.dart';
import 'package:the_weather_app/widgets/weather_list.dart';
import 'package:the_weather_app/widgets/weather_today.dart';
import 'package:the_weather_app/models/location.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var todayWeather = {};
  var historyWeatherDay = {};
  var historyWeatherNight = {};
  bool _isLoading = false;
  bool _isInit = true;
  Cron cron;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      _isLoading = true;
      try {
        await Provider.of<WeatherProvider>(context, listen: false)
            .getCurrentWeatherAPI();
        await Provider.of<WeatherProvider>(context, listen: false)
            .getPresentFutureWeatherAPI();
        await Provider.of<WeatherProvider>(context, listen: false)
            .getAllHistoryWeather();

        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        print('error in did change $error');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred! did')));
      }

      cron = Cron();
      print('Alarm set');
      //https://crontab.guru/
      //'01/30 * * * *'
      //“At minute 1 and 30.”
      cron.schedule(Schedule.parse('01,30 * * * *'), () async {
        print('01,30 * * * * ${DateTime.now()}');
        try {
          await Provider.of<WeatherProvider>(context, listen: false)
              .getCurrentWeatherAPI();
          setState(() {
            print('update');
          });
        } catch (error) {
          print(error);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('An error occurred!')));
        }
      });
      cron.schedule(Schedule.parse('01 0 * * *'), () async {
        print('01 0 * * * ${DateTime.now()}');
        try {
          await Provider.of<WeatherProvider>(context, listen: false)
              .getPresentFutureWeatherAPI();
          await Provider.of<WeatherProvider>(context, listen: false)
              .getAllHistoryWeather();
          setState(() {
            print('update');
          });
        } catch (error) {
          print(error);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('An error occurred!')));
        }
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('>>>> in the build');
    // newRefresh(
    //     repeatedAction:
    //         Provider.of<WeatherProvider>(context, listen: false).getWeather());
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.refresh),
      //   onPressed: () async {
      //     await Provider.of<WeatherProvider>(context, listen: false)
      //         .getWeather();
      //   },
      // ),
      body: RefreshIndicator(
        onRefresh: () async {
          try {
            await Provider.of<WeatherProvider>(context, listen: false)
                .getCurrentWeatherAPI();
            await Provider.of<WeatherProvider>(context, listen: false)
                .getPresentFutureWeatherAPI();
          } catch (error) {
            print('error in did change $error');
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('An error occurred! did')));
          }
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: _isLoading
                ? Center(
                    // child: Text('Loading .. .'),
                    child: Column(
                      children: [
                        Text('Loading ...'),
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: screenSize.width * 0.8,
                          height: screenSize.height * 0.58,
                          child: WeatherToday()),
                      CompareWeather(),
                      // WeatherList(),
                      WeatherTabs(),
                      Text(
                        'Last updated at ${DateFormat('dd MMM - hh:mm a').format(DateTime.now())}',
                        style: TextStyle(fontSize: 11, color: Colors.black45),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

void cronSchedule(
    {dynamic repeatedAction,
    String minute = '*',
    String hour = '*',
    String day = '*',
    String month = '*',
    String dayWeek = '*'}) {
  //https://crontab.guru/#01_00_*_*_*
  final cron = Cron();
  final time = '$minute $hour $day $month $dayWeek';
  print('time is >$time>');
  print('Alarm set');
  cron.schedule(Schedule.parse(time), () async {
    print(
        '$minute minutes,$hour hours,$day days,$month month,$dayWeek day week ${DateTime.now()}');
    repeatedAction;
    print('Alarm done');
  });
}

void newRefresh({dynamic repeatedAction}) {
  cronSchedule(repeatedAction: repeatedAction, minute: '*/39');
}
