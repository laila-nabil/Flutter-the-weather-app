import 'package:get_it/get_it.dart';
import 'package:the_weather_app/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:the_weather_app/features/location/data/repositories/location_repo_impl.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_current_location_use_case.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';

import 'features/location/domain/use_cases/autocomplete_search_location_use_case.dart';
import 'features/weather/data/data_sources/weather_remote_data_source.dart';
import 'features/weather/data/repositories/weather_repo_impl.dart';
import 'features/weather/domain/repositories/weather_repo.dart';
import 'features/weather/domain/use_cases/get_current_weather.dart';
import 'features/weather/domain/use_cases/get_history_weather.dart';
import 'features/weather/domain/use_cases/get_present_future_weather.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => WeatherBloc(sl(),sl(),sl(),sl()));
  sl.registerFactory(() => LocationBloc(sl(),sl(),sl()));

// UseCases

  sl.registerLazySingleton(() => GetPresentFutureWeatherUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentWeatherUseCase(sl()));
  sl.registerLazySingleton(() => GetHistoryWeatherUseCase(sl()));
  sl.registerLazySingleton(() => GetLocationFromCoordinatesUseCase(sl()));
  sl.registerLazySingleton(() => AutoCompleteSearchLocationUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentLocationUseCase());

// Repository

  sl.registerLazySingleton<WeatherRepo>(() => WeatherRepoImpl(sl()));
  sl.registerLazySingleton<LocationRepo>(() => LocationRepoImpl(sl()));

// DataSources

  sl.registerLazySingleton<WeatherRemoteDataSource>(
          () => WeatherRemoteDatSourceImpl());
  sl.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl());

//! Core

//! External
}
