import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_weather_app/core/injection_container.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/main.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/use_cases/get_weather_use_case.dart';

final weatherNotifierProvider =
AsyncNotifierProvider.autoDispose<WeatherNotifier, WeatherEntity?>(() =>
    WeatherNotifier.new(sl()));

class WeatherNotifier extends AutoDisposeAsyncNotifier<WeatherEntity?> {
  final GetWeatherUseCase _getWeatherUseCase;

  WeatherNotifier(this._getWeatherUseCase);

  @override
  FutureOr<WeatherEntity?> build() {
    return null;
  }

  FutureOr<WeatherEntity?> getWeatherEvent(
      GetWeatherParams getWeatherParams) async {
    if (getWeatherParams.lat != '' && getWeatherParams.lon != '') {
      state = AsyncLoading();
      final result = await _getWeatherUseCase(getWeatherParams);
      printDebug("result in notifier $result");
      result.fold((l) {
        analytics.logEvent(name: "error in weather notifier", parameters: {
          "release": kReleaseMode.toString(),
          "isWeb": kIsWeb.toString(),
          "error": l.message.toString(),
        });
        state = AsyncError(l, StackTrace.current);
      }, (r) {
        state = AsyncData(r);
      });
    }
    return null;
  }

}
