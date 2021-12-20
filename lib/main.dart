// web setup
// fvm use stable in windows powershell as admin
// a .fvm folder is added with shortcut
// get full path of shortcut and add to project as flutter path instead of original path
// fvm flutter config --enable-web in terminal/windows powershell as admin
// fvm flutter create .
// fvm flutter run -d chrome/edge
// firebase init hosting
// build/web, single web page, not overwrite
// firebase deploy --only hosting
// fvm flutter build web --dart-define api_key=key

//prev error solved by deleting everything fvm related and dart cache
//then pub repair cache

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';

import './screens/home_screen.dart';

Future main() async {
  // await DotEnv.load(fileName: ".env");
  print('before loading api');
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('in myApp');
    return ChangeNotifierProvider(
      create: (ctx) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather app',
        theme: ThemeData(),
        home: MyHomePage(),
        // home: DummyScreen(),
      ),
    );
  }
}


class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('the app'),),
      body: Center(
        child: Text('Hi hello'),
      ),
    );
  }
}

void cronSchedule({Function function,String minute ='*',String hour='*',String day='*',String month='*',String dayWeek='*'}){
  //https://crontab.guru/#01_00_*_*_*
  final cron = Cron();
  final time = '$minute $hour $day $month $dayWeek';
  print('time is >$time>');
  print('Alarm set');
  function();
  cron.schedule(Schedule.parse(time), () async {
    print('$minute minutes,$hour hours,$day days,$month month,$dayWeek day week ${DateTime.now()}');
    function();
    print('Alarm done');
  });
}

void newDayRefresh(Function function){
  cronSchedule(function: function,minute: '*/16');
}