import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/features/location/presentation/pages/location_screen.dart';
import 'package:the_weather_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/bloc_observer.dart';
import 'core/injection_container.dart';
import 'core/injection_container.dart' as di;
import 'core/resources/app_theme.dart';
import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/location/presentation/bloc/location_bloc.dart';
import 'features/weather/presentation/pages/home_page.dart';
import 'firebase_options.dart';


FirebaseAnalytics analytics = FirebaseAnalytics.instance;

Future main() async {
  //order is important
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  Bloc.observer = AppBlocObserver();
  // It is required to add the following to run the meta_seo package correctly
  // before the running of the Flutter app
  if (kIsWeb) {
    MetaSEO().config();
  }
  //https://twitter.com/luke_pighetti/status/1651585533481566211?s=12&t=9UwYk3rxsHZqVkQxNhVW3g
  Paint.enableDithering = true;
  tz.initializeTimeZones();
  runApp(LocalizationImpl().localizationSetup(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>(
            create: (context) => sl<LanguageBloc>(),
          ),
          BlocProvider<LocationBloc>(
            create: (context) =>  sl<LocationBloc>(),
          ),
        ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Weather app',
        theme: theme,
        home: const MyHomePage(),
        routes: {
          MyHomePage.routeName: (ctx) => const MyHomePage(),
          LocationScreen.routeName: (ctx) => const LocationScreen(),
          SettingsScreen.routeName: (ctx) => const SettingsScreen(),
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
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
