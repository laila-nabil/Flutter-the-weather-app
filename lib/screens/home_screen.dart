import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widgets/weather_tabs.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/widgets/compare_weather.dart';
import 'package:the_weather_app/widgets/weather_today.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred! did $error')));
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
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final orientation = mediaQuery.orientation;
    final isPortrait = screenSize.width < screenSize.height;
    print("screenSize $screenSize");
    print("orientation $orientation");
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
          // padding: const EdgeInsets.all(18.0),
          child: Center(
            child: _isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                : Container(
                    height: screenSize.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // todayOverview(screenSize.width < screenSize.height),
                        if (isPortrait)
                          Expanded(flex: 7, child: WeatherToday()),
                        if (screenSize.width < screenSize.height)
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CompareWeather(),
                            ),
                          ),
                        if(!isPortrait)
                          Expanded(
                            flex: 6,
                            child: Row(
                              children: [
                                Container(
                                    width: screenSize.width * 0.6,
                                    // height: screenSize.height * 0.5,
                                    child: WeatherToday()),
                                Container(
                                  width: screenSize.width * 0.4,
                                  // height: screenSize.height * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CompareWeather(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                            // flex: isPortrait ? 4 : 5,
                          //TODO here
                          flex: 4,
                            child: WeatherTabs()),
                        if(screenSize.width < screenSize.height)
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Last updated at ${DateFormat('dd MMM - hh:mm a').format(DateTime.now())}',
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class todayOverview extends StatelessWidget {
  final bool portrait;

  todayOverview(this.portrait);

  @override
  Widget build(BuildContext context) {
    return !portrait
        ? Row(
            children: [
              SizedBox.expand(child: WeatherToday()),
              SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompareWeather(),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(flex: 7, child: WeatherToday()),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompareWeather(),
                ),
              ),
            ],
          );
  }
}

List<Widget> weatherTodayOverview = [
  Container(child: WeatherToday()),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: CompareWeather(),
  ),
];

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
