import 'dart:async';
import 'package:riverpod/riverpod.dart';
import 'package:the_weather_app/core/localization/localization.dart';

final languageNotifierProvider =
    AsyncNotifierProvider.autoDispose<LanguageNotifier, LanguagesEnum>(
        LanguageNotifier.new);

class LanguageNotifier extends AutoDisposeAsyncNotifier<LanguagesEnum> {
  @override
  FutureOr<LanguagesEnum> build() async {
    return LanguagesEnum.en;
  }

  FutureOr<void> selectLanguage(LanguagesEnum languageEnum) {
    state = AsyncData(languageEnum);
  }
}
