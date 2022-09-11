
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

enum languagesEnum { ar, en }

abstract class Localization {
  Locale languagesEnumToLocale(languagesEnum language);
  Locale getCurrentLocale(BuildContext context);
  String getCurrentLangCode(BuildContext context);
  void setLocale(BuildContext context, Locale selectedLanguage);
  void setLanguage(BuildContext context, languagesEnum selectedLanguage);
  String translate(String key);
  bool isRTL(BuildContext context);
  localizationSetup(Widget app);
}

class LocalizationImpl implements Localization{
  @override
  Locale getCurrentLocale(BuildContext context) {
    return context.locale;
  }

  @override
  bool isRTL(BuildContext context) {
    return Directionality.of(context).toString().toLowerCase().contains('rtl');
  }

  @override
  Locale languagesEnumToLocale(languagesEnum language) {
    switch(language){
      case languagesEnum.ar:
        return Locale('ar', 'EG');
      case languagesEnum.en:
        return Locale('en', 'UK');
    }
  }

  @override
  localizationSetup(Widget app) {
    const _assetsPath = 'assets/locales';
    const supportedLocales = [Locale('en', 'UK'), Locale('ar', 'EG')];
    final defaultLocale = supportedLocales[0];
    return EasyLocalization(
        path: _assetsPath,
        supportedLocales: supportedLocales,
        startLocale: defaultLocale,
        child: app
    );
  }

  @override
  void setLanguage(BuildContext context, languagesEnum selectedLanguage) {
    context.setLocale(languagesEnumToLocale(selectedLanguage));
  }

  @override
  void setLocale(BuildContext context, Locale selectedLanguage) {
    context.setLocale(selectedLanguage);
  }

  @override
  String translate(String key) {
    return key.tr();
  }

  @override
  String getCurrentLangCode(BuildContext context) {
    return context.locale.toString();
  }

}