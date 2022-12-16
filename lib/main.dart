import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/features/location/presentation/pages/location_screen.dart';
import 'package:the_weather_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:the_weather_app/features/weather/presentation/manager/weather_provider.dart';

import 'core/bloc_observer.dart';
import 'core/resources/app_theme.dart';
import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/location/presentation/bloc/location_bloc.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'features/weather/presentation/pages/home_screen.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

Future main() async {
  //order is important
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(LocalizationImpl().localizationSetup(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Weather app',
      theme: theme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>(
            create: (context) => sl<LanguageBloc>(),
          ),
          BlocProvider<LocationBloc>(
            create: (context) => sl<LocationBloc>(),
          ),
        ],
        child: MyHomePage(),
      ),
      routes: {
        MyHomePage.routeName: (ctx) => MyHomePage(),
        LocationScreen.routeName: (ctx) => LocationScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
      },
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
