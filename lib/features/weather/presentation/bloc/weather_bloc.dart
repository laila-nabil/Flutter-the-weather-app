import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather_app/core/config.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:the_weather_app/features/weather/presentation/widgets/compact_day_weather.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/unix.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  WeatherBloc(this.getWeatherUseCase,)
      : super(WeatherState(weatherStatus: WeatherStatus.initial)) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeatherEvent) {
        emit(state.copyWith(weatherStatus: WeatherStatus.loading));
        final result = await getWeatherUseCase(
            event.getWeatherParams);
        printDebug("result in bloc $result");
        result.fold(
                (l) => emit(state.copyWith(
                weatherStatus: WeatherStatus.failure,
                getWeatherFailure: l)),
                (r) {
                  final diffMax = ((state.weather?.dailyList?.temperature2mMax.tryElementAt(0) ?? 0) -
                      (state.weather?.dailyList?.temperature2mMax.tryElementAt(1) ?? 0));
                  final diffMin = ((state.weather?.dailyList?.temperature2mMin.tryElementAt(0) ?? 0) -
                      (state.weather?.dailyList?.temperature2mMin.tryElementAt(1) ?? 0));
                  final diffDay = (diffMax > 0) == true
                      ? "warmer"
                      : "colder";
                  final diffNight = (diffMin > 0) == true
                      ? "warmer"
                      : "colder";
                  var compare = LocalizationImpl()
                    .translate("compareWeather", namedArguments: {
                  "diffDay": LocalizationImpl().translate(diffDay),
                  "diffNight": LocalizationImpl().translate(diffNight),
                  "diffMax": diffMax.toStringAsFixed(1),
                  "diffMin": diffMin.toStringAsFixed(1),
                });
                  printDebug("diffMax $diffMax");
                  printDebug("diffMin $diffMin");
                  printDebug("compare $compare");
                  emit(state.copyWith(
                weatherStatus: WeatherStatus.success,
                weather: r,
                    compareTodayYesterday: compare));
                });
      }
    });
  }

}
