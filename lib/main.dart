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
//which is better than tercminal
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
//DONE is timing correct or not?==>correct since  DateTime.fromMillisecondsSinceEpoch returns in local time
//DONE max &min sometimes disappear==> fixed
//DONE maybe make all weather one class or use inheritance
//TODO add shimmer instead of loading circle
//TODO(next level) splash screen
//DONE(next level) icon
//TODO(next level) on play store

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/providers/weather_provider.dart';
import 'package:the_weather_app/screens/location_screen.dart';
import 'package:the_weather_app/screens/settings_screen.dart';


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
        debugShowCheckedModeBanner: false,
        title: 'Weather app',
        theme: ThemeData(
          backgroundColor: Color(0xff060D26),
          primaryTextTheme: Typography().white,
          textTheme: Typography().white,
        ),
        home: MyHomePage(),
        routes: {
          MyHomePage.routeName: (ctx) => MyHomePage(),
          LocationScreen.routeName: (ctx) => LocationScreen(),
        SettingsScreen.routeName:(ctx)=> SettingsScreen(),
        },
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

// import 'package:flutter/material.dart';
// import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter MapBox AutoComplete',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final _startPointController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter MapBox AutoComplete example"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: CustomTextField(
//           hintText: "Select starting point",
//           textController: _startPointController,
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MapBoxAutoCompleteWidget(
//                   apiKey: 'pk.eyJ1IjoibG45NSIsImEiOiJja3kzaXUwaXIwMmcyMnhvamtoZTA2YnpiIn0.NY30EgaJ_bcBMc-JKqSs1g',
//                   hint: "Select starting point",
//                   onSelect: (place) {
//                     _startPointController.text = place.placeName;
//                   },
//                   limit: 10,
//                   country: "EG",
//                 ),
//               ),
//             );
//           },
//           enabled: true,
//         ),
//       ),
//     );
//   }
// }