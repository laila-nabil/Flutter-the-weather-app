import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/core/resources/app_colors.dart';
import 'package:the_weather_app/core/resources/assets_paths.dart';
import 'package:the_weather_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants.dart';
import '../../../language/presentation/bloc/language_bloc.dart';
import '../../../weather/presentation/pages/home_page.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final theme = Theme.of(context);
    void toggleLanguage() async{
      // setState(() {
      //   //printDebug('_toggleLanguage');
      // });
      context.setLocale(context.locale == const Locale('en', 'UK')
          ? const Locale('ar', 'EG')
          : const Locale('en', 'UK'));
      final languageBloc = BlocProvider.of<LanguageBloc>(context);
      var currentLanguagesEnum = LocalizationImpl().getCurrentLanguagesEnum(context);
      if(currentLanguagesEnum!=null){
        languageBloc.add(SelectLanguage(currentLanguagesEnum));
      }
      if (enableAnalytics) {
        analytics.logEvent(
            name: "ChangeLanguage", parameters: {
          "lang": context.locale.toString(),
          "release": kReleaseMode.toString(),
          "isWeb": kIsWeb.toString(),
        });
      }
      Navigator.of(context).pushReplacementNamed(MyHomePage.routeName);
    }
    return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme.backgroundColor,
              elevation: 0,
              title: Text(
                'settings'.tr().toString(),
                style: const TextStyle(
                    fontSize: 34,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            backgroundColor: theme.backgroundColor,
            body: Container(
                padding: const EdgeInsets.all(25.0),
                width: screenSize.width,
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: 'lang'.tr().contains('En') ? CrossAxisAlignment.end:CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () => toggleLanguage(),
                        icon: const Icon(Icons.language),
                        label: Text('change_lang'.tr().toString())),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if(kIsWeb)Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: (){
                                launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.lailanabil.the_weather_app"));
                              },
                              child: Image.asset(AppAssets.googlePlay,width: 18,height: 18,),
                            ),
                          )else
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                onTap: (){
                                  launchUrl(Uri.parse("https://flutter-weather-app.web.app/"));
                                },
                                child: Icon(Icons.link,size: 18,color: Colors.white,),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: (){
                                launchUrl(Uri.parse("https://twitter.com/laila_nabil_"));
                              },
                              child: Image.asset(AppAssets.twitter,width: 18,height: 18,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: (){
                                launchUrl(Uri.parse("https://github.com/laila-nabil/Flutter-the-weather-app"));
                              },
                              child: Image.asset(AppAssets.github,width: 18,height: 18,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${LocalizationImpl().translate("madeWith")} ${LocalizationImpl().translate("flutter")} ",
                          style: const TextStyle(color: AppColors.white),
                        ),
                        const Icon(Icons.favorite,color: Colors.blue,),
                        Text(
                          " ${LocalizationImpl().translate("by")} ",
                          style: const TextStyle(color: AppColors.white),
                        ),
                        TextButton(
                            onPressed: () async {
                              if (enableAnalytics) {
                                analytics.logEvent(
                                    name: "launchGithub",
                                    parameters: {"release": kReleaseMode.toString(),
                                      "isWeb": kIsWeb.toString(),});
                              }
                              await launchUrl(
                                Uri.parse( "https://github.com/laila-nabil/"),
                              );
                            },
                            child: Text(
                                LocalizationImpl().translate("lailaNabil"),style: const TextStyle(color: AppColors.white)))
                      ],
                    ),
                    ],
                ))));
  }
}
