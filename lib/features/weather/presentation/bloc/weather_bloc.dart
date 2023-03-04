import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview_v.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/day_weather.dart';
import '../../domain/entities/weather_timeline.dart';
import '../../domain/use_cases/get_today_weather_overview_use_case.dart';
import '../../domain/use_cases/get_weather_timeline_use_case.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetTodayWeatherOverviewUseCase _getTodayWeatherOverviewUseCase;
  final GetWeatherTimelineUseCase _getWeatherTimelineUseCase;

  WeatherBloc(this._getTodayWeatherOverviewUseCase, this._getWeatherTimelineUseCase)
      : super(WeatherState(weatherStatus: WeatherStatus.initial)) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetTodayOverview) {
        await _getTodayOverview(emit, event.params);
      }else if(event is GetWeatherTimeline){
        await _getWeatherTimeline(emit, event.params);
      }else if(event is InitialWeatherEvent){
        await _getTodayOverview(emit, event.getTodayOverviewParams);
        await _getWeatherTimeline(emit, event.weatherTimelineParams);
      }
    });
  }

  Future<void> _getTodayOverview(Emitter<WeatherState> emit, GetTodayOverviewParams params) async {
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

  Future<void> _getWeatherTimeline(Emitter<WeatherState> emit, WeatherTimelineParams params) async {
    emit(state.copyWith(weatherStatus: WeatherStatus.loading));
    final result = await _getWeatherTimelineUseCase(params);
    result.fold(
            (l) => emit(state.copyWith(
            weatherStatus: WeatherStatus.weatherTimelineFailure,
            weatherTimelineFailure: l)),
            (r) => emit(state.copyWith(
            weatherStatus: WeatherStatus.weatherTimelineSuccess,
            weatherTimeline: r,
            compareTodayYesterday: compareTodayYesterday(state.todayOverview,
                state.weatherTimeline?.days?.elementAt(params.daysBeforeToday-1)))));
  }
}

String? compareTodayYesterday(TodayOverviewV? todayOverview,DayV? yesterday) {
  if(todayOverview == null || yesterday == null){
    return null;
  }
  final diffDay = todayOverview.day!.tempmax! > yesterday.tempmax!
      ? "warmer".tr().toString()
      : "colder".tr().toString();
  final diffNight = todayOverview.day!.tempmin! > yesterday.tempmin!
      ? "warmer".tr().toString()
      : "colder".tr().toString();
  final diffMax = todayOverview.day!.tempmax! - yesterday.tempmax!;
  final diffMin = todayOverview.day!.tempmin! - yesterday.tempmin!;
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