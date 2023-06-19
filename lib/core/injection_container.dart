import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather_app/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:the_weather_app/features/location/data/repositories/location_repo_impl.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:the_weather_app/features/weather/data/data_sources/weather_local_data_source.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_weather_use_case.dart';

import '../features/language/presentation/bloc/language_bloc.dart';
import '../features/location/data/data_sources/location_local_data_source.dart';
import '../features/location/domain/use_cases/autocomplete_search_location_use_case.dart';
import '../features/location/domain/use_cases/get_current_location_use_case.dart';
import '../features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';
import '../features/location/domain/use_cases/get_save_current_location_use_case.dart';
import '../features/location/domain/use_cases/save_current_location_use_case.dart';
import '../features/weather/data/data_sources/weather_remote_data_source.dart';
import '../features/weather/data/repositories/weather_repo_impl.dart';
import '../features/weather/domain/repositories/weather_repo.dart';

import '../features/weather/presentation/bloc/weather_bloc.dart';
import 'package:location/location.dart';


final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => LanguageBloc());
  sl.registerFactory(() => WeatherBloc(sl()));
  sl.registerFactory(() => LocationBloc(sl(),sl(),sl(),sl(),sl()));

// UseCases

  sl.registerLazySingleton(() => GetWeatherUseCase(sl()));
  sl.registerLazySingleton(() => GetLocationFromCoordinatesUseCase(sl()));
  sl.registerLazySingleton(() => SaveCurrentLocationUseCase(sl()));
  sl.registerLazySingleton(() => GetSavedCurrentLocationUseCase(sl()));
  sl.registerLazySingleton(() => AutoCompleteSearchLocationUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentLocationUseCase(sl(),sl()));


// Repository

  sl.registerLazySingleton<WeatherRepo>(() => WeatherRepoImpl(sl(),sl()));
  sl.registerLazySingleton<LocationRepo>(() => LocationRepoImpl(sl(),sl()));

// DataSources

  sl.registerLazySingleton<WeatherRemoteDataSource>(
          () => WeatherRemoteDatSourceImpl());
  sl.registerLazySingleton<WeatherLocalDataSource>(
          () => WeatherLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl());
  sl.registerLazySingleton<LocationLocalDataSource>(
          () => LocationLocalDataSourceImpl(sharedPreferences: sl()));
//! Core

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => Location());
}
