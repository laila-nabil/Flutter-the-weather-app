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

//to run on web
// fvm flutter run -d edge --dart-define api_key=key

//to reupload
// fvm flutter build web --dart-define api_key=key
// firebase deploy --only hosting

//to add arguments but to android studio
//from main.dart menu
//edit configuration
//which is better than terminal
//for web

//prev error solved by deleting everything fvm related and dart cache
//then pub repair cache

//TODO adjust UI: responsiveness
//TODO add settings screen
//TODO in settings screen: change city by location search with autocomplete
//TODO in settings screen: add multiple cities
//TODO in settings screen: add multiple cities + locally store them
//TODO in settings screen: change language + localization
//TODO in settings screen: change unit
//NOTTODO is timing correct or not?==>correct since  DateTime.fromMillisecondsSinceEpoch returns in local time
//NOTTODO max &min sometimes disappear==> fixed
//NOTTODO maybe make all weather one class or use inheritance
//TODO add shimmer instead of loading circle
//TODO(next level) splash screen
//TODO(next level) icon
//TODO(next level) on play store

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/screens/location_screen.dart';

import './screens/home_screen.dart';

Future main() async {
  // await DotEnv.load(fileName: ".env");
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => WeatherProvider(),
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Weather app',
        theme: ThemeData(
          backgroundColor: Color(0xff060D26),
        primaryTextTheme: Typography().white,
        textTheme: Typography().white,
        ),
        home: MyHomePage(),
        // home: testPage(),
        // home: DummyScreen(),
        routes: { LocationScreen.routeName: (ctx)=>LocationScreen()},
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  // ScrollBehaviors now allow or disallow drag scrolling from
  // specified PointerDeviceKinds. ScrollBehavior.dragDevices, by default,
  // allows scrolling widgets to be dragged by all PointerDeviceKinds except for PointerDeviceKind.mouse.
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}