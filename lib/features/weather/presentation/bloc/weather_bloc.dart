import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/features/weather/domain/entities/today_overview.dart';

import '../../../../core/error/failures.dart';
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
        emit(state.copyWith(weatherStatus: WeatherStatus.loading));
        final result = await _getTodayWeatherOverviewUseCase(event.params);
        result.fold(
            (l) => emit(state.copyWith(
                weatherStatus: WeatherStatus.todayOverviewFailure,
                todayOverviewFailure: l)),
            (r) => emit(state.copyWith(
                weatherStatus: WeatherStatus.todayOverviewSuccess,
                todayOverview: r)));
      }
    });
  }
}
