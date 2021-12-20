import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:provider/provider.dart';
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
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      try {
        Provider.of<WeatherProvider>(context)
            .getPresentFutureWeatherAPI()
            .then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred!')));
      }

      cron = Cron();
      print('Alarm set');
      //https://crontab.guru/
      cron.schedule(Schedule.parse('01 * * * *'), () async {
        print('01 * * * * ${DateTime.now()}');
        try {
          await Provider.of<WeatherProvider>(context, listen: false)
              .getPresentFutureWeatherAPI()
              .then((_) {
            print('in the then');
          });
        } catch (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('An error occurred!')));
        }

        print('Alarm done');
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
      body: Center(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.55,
                      child: WeatherToday()),
                  // Expanded(child: CompareWeather()),
                  Container(
                      width: double.infinity,
                      height: screenSize.height * 0.32,
                      child: WeatherList()),
                ],
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
