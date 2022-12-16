import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather.dart';

import '../../domain/entities/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetPresentFutureWeatherUseCase _getPresentFutureWeatherUseCase;
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetHistoryWeatherUseCase _getHistoryWeatherUseCase;
  final LocationBloc locationBloc;
  StreamSubscription? _locationSubscription;
  CurrentWeather? currentWeather;
  List<Weather>? historyWeather;
  List<Weather>? presentFutureWeather;

  WeatherBloc(
      this._getPresentFutureWeatherUseCase,
      this._getCurrentWeatherUseCase,
      this._getHistoryWeatherUseCase,
      this.locationBloc)
      : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      _locationSubscription = locationBloc.stream.listen((state) async {
        if (state is SetLocationState) {
          final longitude = state.location?.lon ?? "";
          final latitude = state.location?.lat ?? "";

          ///TODO
          await getCurrentWeather(
              emit: emit,
              event: event,
              params: GetCurrentWeatherParams(
                  language: '', longitude: longitude, latitude: latitude));
          await getHistoryWeather(
              emit: emit,
              event: event,
              params: GetHistoryWeatherParams(
                  language: '',
                  longitude: longitude,
                  latitude: latitude,
                  unixTimestamp: 0));
          await getPresentFutureWeather(
              emit: emit,
              event: event,
              params: GetPresentFutureWeatherParams(
                  language: '', longitude: longitude, latitude: latitude));
        }
      });
      if (event is WeatherRefreshEvent) {
        final location = locationBloc.location;
        final longitude = location?.lon ?? "";
        final latitude = location?.lat ?? "";

        ///TODO
        await getCurrentWeather(
            emit: emit,
            event: event,
            params: GetCurrentWeatherParams(
                language: '', longitude: longitude, latitude: latitude));
        await getHistoryWeather(
            emit: emit,
            event: event,
            params: GetHistoryWeatherParams(
                language: '',
                longitude: longitude,
                latitude: latitude,
                unixTimestamp: 0));
        await getPresentFutureWeather(
            emit: emit,
            event: event,
            params: GetPresentFutureWeatherParams(
                language: '', longitude: longitude, latitude: latitude));
      } else if (event is WeatherInitialEvent) {
        final location = locationBloc.location;
        final longitude = location?.lon ?? "";
        final latitude = location?.lat ?? "";

        ///TODO
        await getCurrentWeather(
            emit: emit,
            event: event,
            params: GetCurrentWeatherParams(
                language: '', longitude: longitude, latitude: latitude));
        await getHistoryWeather(
            emit: emit,
            event: event,
            params: GetHistoryWeatherParams(
                language: '',
                longitude: longitude,
                latitude: latitude,
                unixTimestamp: 0));
        await getPresentFutureWeather(
            emit: emit,
            event: event,
            params: GetPresentFutureWeatherParams(
                language: '', longitude: longitude, latitude: latitude));
      } else if (event is _GetCurrentWeather) {
        var params = event.params;
        await getCurrentWeather(emit: emit, event: event, params: params);
      } else if (event is _GetHistoryWeather) {
        var params = event.params;
        await getHistoryWeather(emit: emit, event: event, params: params);
      } else if (event is _GetPresentFutureWeather) {
        var params = event.params;
        await getPresentFutureWeather(emit: emit, event: event, params: params);
      }
    });
  }

  Future<void> getPresentFutureWeather(
      {required Emitter<WeatherState> emit,
      required WeatherEvent event,
      required GetPresentFutureWeatherParams params}) async {
    emit(WeatherLoading(event));
    final result = await _getPresentFutureWeatherUseCase(params);
    result.fold((failure) => emit(WeatherFailure(event, failure: failure)),
        (success) {
      presentFutureWeather = success;
      emit(WeatherSuccess(event, presentFutureWeather: success));
    });
  }

  Future<void> getHistoryWeather(
      {required Emitter<WeatherState> emit,
      required GetHistoryWeatherParams params,
      required WeatherEvent event}) async {
    emit(WeatherLoading(event));
    final result = await _getHistoryWeatherUseCase(params);
    result.fold((failure) => emit(WeatherFailure(event, failure: failure)),
        (success) {
      historyWeather = success;
      emit(WeatherSuccess(event, historyWeather: success));
    });
  }

  Future<void> getCurrentWeather(
      {required Emitter<WeatherState> emit,
      required GetCurrentWeatherParams params,
      required WeatherEvent event}) async {
    emit(WeatherLoading(event));
    final result = await _getCurrentWeatherUseCase(params);
    result.fold((failure) => emit(WeatherFailure(event, failure: failure)),
        (success) {
      currentWeather = success;
      emit(WeatherSuccess(event, currentWeather: success));
    });
  }
}
