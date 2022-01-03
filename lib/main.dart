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

//to reupload
// fvm flutter build web --dart-define api_key=key
// firebase deploy --only hosting

//prev error solved by deleting everything fvm related and dart cache
//then pub repair cache

//TODO adjust UI: responsiveness
//TODO add settings screen
//TODO in settings screen: change city
//TODO in settings screen: add multiple cities
//TODO in settings screen: add multiple cities + local store them
//TODO in settings screen: change language + localization
//TODO in settings screen: change unit

import 'package:flutter/material.dart';

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
        theme: ThemeData(
          backgroundColor: Color(0xff060D26),
          primaryTextTheme: Typography().white,
          textTheme: Typography().white,
        ),
        home: MyHomePage(),
        // home: DummyScreen(),
      ),
    );
  }
}