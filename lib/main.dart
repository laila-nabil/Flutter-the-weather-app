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
//TODO in settings screen: change city
//TODO in settings screen: add multiple cities
//TODO in settings screen: add multiple cities + local store them
//TODO in settings screen: change language + localization
//TODO in settings screen: change unit
//NOTTODO is timing correct or not?==>correct since  DateTime.fromMillisecondsSinceEpoch returns in local time
//TODO max &min sometimes disappear==> fix bug
//TODO maybe make all weather one class or use inheritance
//TODO add shimmer instead of loading circle
//TODO(next level) splash screen
//TODO(next level) icon
//TODO(next level) on play store

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
        // theme: ThemeData(
        //   backgroundColor: Color(0xff060D26),
          // primaryTextTheme: Typography().white,
          // textTheme: Typography().white,
        // ),
        // home: MyHomePage(),
        home: testPage(),
        // home: DummyScreen(),
      ),
    );
  }
}

class testPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theList = [
      Container(
        height: 50,
        width: 50,
        color: Colors.red,
        child: Text("1"),
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.blueAccent,
        child: Text("2"),
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.black54,
        child: Text("3"),
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.yellow,
        child: Text("4"),
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.green,
        child: Text("5"),
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.grey,
        child: Text("6"),
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.purple,
        child: Text("7"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("ok"),),
      body: Center(child: customGrid(items: theList,)),
    );
  }
}

class customGrid extends StatelessWidget {
  final List<Widget> items;
  final int NumCols;

  customGrid({ this.items, this.NumCols});

  @override
  Widget build(BuildContext context) {

    //take first(order) three items(numberItems)
    List<Widget> partList(List<Widget> list ,int order,int numberItems){
      int number = (list.length ~/ numberItems);
      final partialList = list.reversed.take((number - order) * numberItems).toList();
      return [...partialList.reversed.take(numberItems)];
    }

    List<Widget> newList;
    // newList = [...items.reversed.take(3)];
    newList = partList(items,1,3);
    // List<List<Widget>>colsLists = [];
    // int i = 0;
    //
    // items.forEach((element) {
    //   if(i + 1- NumCols == 0){
    //     colsLists[NumCols-1].add(element);
    //   }
    //   i++;
    // });
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: newList,
    );

  }
}
