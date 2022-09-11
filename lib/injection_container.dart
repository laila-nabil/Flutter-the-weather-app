import 'package:get_it/get_it.dart';
import 'package:the_weather_app/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:the_weather_app/features/location/data/repositories/location_repo_impl.dart';
import 'package:the_weather_app/features/location/domain/repositories/location_repo.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => LocationBloc());

// UseCases

  sl.registerLazySingleton(() => GetLocationFromCoordinatesUseCase(sl()));

// Repository

  sl.registerLazySingleton<LocationRepo>(() => LocationRepoImpl(sl()));

// DataSources

  sl.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl());

//! Core

//! External
}
