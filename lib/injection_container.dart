import 'package:get_it/get_it.dart';
import 'package:the_weather_app/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:the_weather_app/features/location/data/repositories/location_repo_impl.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';

import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/weather/data/data_sources/weather_remote_data_source.dart';
import 'features/weather/data/repositories/weather_repo_impl.dart';
import 'features/weather/domain/repositories/weather_repo.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => LanguageBloc());
  sl.registerFactory(() => WeatherBloc());
  sl.registerFactory(() => LocationBloc(sl(),sl(),sl()));

// UseCases



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
