import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather.dart';

import '../../domain/entities/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetPresentFutureWeatherUseCase getPresentFutureWeatherUseCase;
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetHistoryWeatherUseCase getHistoryWeatherUseCase;

  WeatherBloc(this.getPresentFutureWeatherUseCase,
      this.getCurrentWeatherUseCase, this.getHistoryWeatherUseCase)
      : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      on<WeatherInitialEvent>((event, emit) {
        //TODO
        add(_GetCurrentWeather(GetCurrentWeatherParams(
            language: '', longitude: '', latitude: '')));
        add(_GetHistoryWeather(GetHistoryWeatherParams(
            language: '', longitude: '', latitude: '', unixTimestamp: 0)));
        add(_GetPresentFutureWeather(GetPresentFutureWeatherParams(
            language: '', longitude: '', latitude: '')));
      });
      on<_GetCurrentWeather>((event, emit) async {
        emit(WeatherLoading(event));
        final result = await getCurrentWeatherUseCase(event.params);
        result.fold((failure) =>
            emit(WeatherFailure(event, failure: failure)), (success) =>
            emit(WeatherSuccess(event,currentWeather: success)));
      });
      on<_GetHistoryWeather>((event, emit) async {
        emit(WeatherLoading(event));
        final result = await getHistoryWeatherUseCase(event.params);
        result.fold((failure) =>
            emit(WeatherFailure(event, failure: failure)), (success) =>
            emit(WeatherSuccess(event,history: success)));
      });
      on<_GetPresentFutureWeather>((event, emit) async {
        emit(WeatherLoading(event));
        final result = await getPresentFutureWeatherUseCase(event.params);
        result.fold((failure) =>
            emit(WeatherFailure(event, failure: failure)), (success) =>
            emit(WeatherSuccess(event,presentFuture: success)));
      });
    });
  }
}
