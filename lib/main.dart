import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/features/language/presentation/manager/language_bloc.dart';
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
      LocalizationImpl().localizationSetup(
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
        home:
        BlocProvider<LanguageBloc>(
          create: (context) => LanguageBloc(),
          child: MyHomePage(),
        ),
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