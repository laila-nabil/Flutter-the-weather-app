import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:universal_html/html.dart' as html;

// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/features/weather/presentation/manager/weather_provider.dart';
import 'package:the_weather_app/features/location/presentation/pages/location_screen.dart';
import 'package:the_weather_app/features/settings/presentation/pages/settings_screen.dart';


import 'features/weather/presentation/widgets/home_screen.dart';

Future main() async {
  //order is important
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          path: 'assets/locales',
          //changing locale that is used at first is from here,may need to uninstall/reinstall the app
          supportedLocales: [Locale('en', 'UK'), Locale('ar', 'EG')],
          child:
          MyApp()
      )
  );
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Weather app',
        theme: ThemeData(
          backgroundColor: AppColors.backgroundDarkColor,
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