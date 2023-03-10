import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/features/weather/domain/entities/history_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/present_future_weather.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview_v.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather_use_case.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather_use_case.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/day_weather.dart';
import '../../domain/entities/today_overview.dart';
import '../../domain/entities/weather_timeline.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case_v.dart';
import '../../domain/use_cases/get_weather_timeline_use_case.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetHistoryListWeatherUseCase _getHistoryListWeatherUseCase;
  final GetPresentFutureWeatherUseCase _getPresentFutureWeatherUseCase;
  final GetTodayWeatherOverviewUseCase _getTodayWeatherOverviewUseCase;

  WeatherBloc(this._getTodayWeatherOverviewUseCase,
      this._getHistoryListWeatherUseCase, this._getPresentFutureWeatherUseCase)
      : super(WeatherState(weatherStatus: WeatherStatus.initial)) {
    on<WeatherEvent>((event, emit) async {
      if (event is InitialWeatherEvent) {
        emit(state.copyWith(weatherStatus: WeatherStatus.loading));
        final presentFutureResult = await _getPresentFutureWeatherUseCase(
            event.getPresentFutureWeatherParams);
        presentFutureResult.fold(
            (l) => emit(state.copyWith(
                weatherStatus: WeatherStatus.presentFutureFailure,
                presentFutureFailure: l)),
            (r) => emit(state.copyWith(
                weatherStatus: WeatherStatus.presentFutureSuccess,
                presentFutureWeather: r)));
        emit(state.copyWith(weatherStatus: WeatherStatus.loading));
        final todayResult = await _getTodayWeatherOverviewUseCase(
            event.getTodayOverviewParams);
        todayResult.fold(
                (l) => emit(state.copyWith(
                weatherStatus: WeatherStatus.todayOverviewFailure,
                todayOverviewFailure: l)),
                (r) => emit(state.copyWith(
                weatherStatus: WeatherStatus.todayOverviewSuccess,
                todayOverview: r)));
        emit(state.copyWith(weatherStatus: WeatherStatus.loading));
        final historyResult = await _getHistoryListWeatherUseCase(
            event.getHistoryListWeatherParams);
        historyResult.fold(
                (l) => emit(state.copyWith(
                weatherStatus: WeatherStatus.historyFailure,
                historyListFailure: l)),
                (r) => emit(state.copyWith(
                weatherStatus: WeatherStatus.historySuccess,
                historyListWeather: r)));
      }
    });
  }

  Future<void> _getTodayOverview(
      Emitter<WeatherState> emit, GetTodayOverviewParams params) async {
    emit(state.copyWith(weatherStatus: WeatherStatus.loading));
    final result = await _getTodayWeatherOverviewUseCase(params);
    result.fold(
        (l) => emit(state.copyWith(
            weatherStatus: WeatherStatus.todayOverviewFailure,
            todayOverviewFailure: l)),
        (r) => emit(state.copyWith(
            weatherStatus: WeatherStatus.todayOverviewSuccess,
            todayOverview: r)));
  }
}

String? compareTodayYesterday(
    TodayOverview? todayOverview, HistoryWeather? yesterday) {
  if (todayOverview == null || yesterday == null) {
    return null;
  }
  final diffDay = todayOverview.main!.tempMax! > yesterday.getTempMax!
      ? "warmer".tr().toString()
      : "colder".tr().toString();
  final diffNight = todayOverview.main!.tempMin! > yesterday.getTempMin!
      ? "warmer".tr().toString()
      : "colder".tr().toString();
  final diffMax = todayOverview.main!.tempMax! - yesterday.getTempMax!;
  final diffMin = todayOverview.main!.tempMin! - yesterday.getTempMin!;
  return 'lang'.tr().toString().contains('EN')
      ? 'Today is $diffDay than yesterday by ${diffMax.toStringAsFixed(2)} °' +
          'deg'.tr().toString() +
          ' at day and is $diffNight by ${diffMin.toStringAsFixed(2)} °' +
          'deg'.tr().toString() +
          ' at night'
      : 'اليوم $diffDay من الأمس ب${diffMax.toStringAsFixed(2)} °' +
          'deg'.tr().toString() +
          ' في النهار و$diffNight ب${diffMin.toStringAsFixed(2)} °' +
          'deg'.tr().toString() +
          ' في الليل';
}
