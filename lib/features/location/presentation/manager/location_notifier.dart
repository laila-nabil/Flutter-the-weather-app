import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:the_weather_app/core/constants.dart';
import 'package:the_weather_app/core/injection_container.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/domain/entities/location.dart';
import 'package:the_weather_app/features/location/domain/use_cases/autocomplete_search_location_use_case.dart';
import 'package:the_weather_app/main.dart';

import '../../data/models/location_model.dart';
import '../../domain/use_cases/get_current_location_use_case.dart';
import '../../domain/use_cases/get_location_from_coordinates_use_case.dart';
import '../../domain/use_cases/get_save_current_location_use_case.dart';
import '../../domain/use_cases/save_current_location_use_case.dart';

final locationNotifierProvider =
    AsyncNotifierProvider.autoDispose<LocationNotifier, LocationState?>(() =>
        LocationNotifier.new(
            autoCompleteSearchLocationUseCase:
                sl<AutoCompleteSearchLocationUseCase>(),
            getLocationFromCoordinatesUseCase:
                sl<GetLocationFromCoordinatesUseCase>(),
            getCurrentLocationUseCase: sl<GetCurrentLocationUseCase>(),
            getSavedCurrentLocationUseCase:
                sl<GetSavedCurrentLocationUseCase>(),
            saveCurrentLocationUseCase: sl<SaveCurrentLocationUseCase>()));

class LocationNotifier extends AutoDisposeAsyncNotifier<LocationState?> {
  final AutoCompleteSearchLocationUseCase _autoCompleteSearchLocationUseCase;
  final GetLocationFromCoordinatesUseCase _getLocationFromCoordinatesUseCase;
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final SaveCurrentLocationUseCase _saveCurrentLocationUseCase;
  final GetSavedCurrentLocationUseCase _getSavedCurrentLocationUseCase;

  LocationNotifier(
      {required AutoCompleteSearchLocationUseCase
          autoCompleteSearchLocationUseCase,
      required GetLocationFromCoordinatesUseCase
          getLocationFromCoordinatesUseCase,
      required GetCurrentLocationUseCase getCurrentLocationUseCase,
      required SaveCurrentLocationUseCase saveCurrentLocationUseCase,
      required GetSavedCurrentLocationUseCase getSavedCurrentLocationUseCase})
      : _autoCompleteSearchLocationUseCase = autoCompleteSearchLocationUseCase,
        _getLocationFromCoordinatesUseCase = getLocationFromCoordinatesUseCase,
        _getCurrentLocationUseCase = getCurrentLocationUseCase,
        _saveCurrentLocationUseCase = saveCurrentLocationUseCase,
        _getSavedCurrentLocationUseCase = getSavedCurrentLocationUseCase;

  @override
  FutureOr<LocationState?> build() async {
    state = AsyncLoading();
    final result = await _getSavedCurrentLocationUseCase(NoParams());
    printDebug("/// _getSavedCurrentLocationUseCase $result");
    return result.fold((l) => getCurrentLocation(),
        (r) => LocationState(userCurrentLocation: r));
  }

  FutureOr<LocationState?> getLocationFromCoordinates(
      {required GetLocationFromCoordinatesParams params}) async {
    state = AsyncLoading();
    final result = await _getLocationFromCoordinatesUseCase(params);
    printDebug("_getLocationFromCoordinatesUseCase $result");
    return result.fold((failure) async {
      if (enableAnalytics) {
        analytics.logEvent(name: "error in location notifier", parameters: {
          "release": kReleaseMode.toString(),
          "isWeb": kIsWeb.toString(),
          "error": failure.message.toString(),
        });
      }
      state = AsyncError(failure, StackTrace.current);
      return null;
    }, (success) async {
      final saveResult =
          await _saveCurrentLocationUseCase(success as LocationModel);
      printDebug("_saveCurrentLocationUseCase $saveResult ");
      var locationState = LocationState(
          userCurrentLocation: success,
          autoCompleteList: state.value?.autoCompleteList);
      state = AsyncData(locationState);
      return locationState;
    });
  }

  FutureOr<void> autoCompleteSearchLocation(
      {required String input}) async {
    state = AsyncLoading();
    final result = await _autoCompleteSearchLocationUseCase(input);
    printDebug("result use case $result");
    return result.fold((failure) {
      if (enableAnalytics) {
        analytics.logEvent(name: "error in location notifier", parameters: {
          "release": kReleaseMode.toString(),
          "isWeb": kIsWeb.toString(),
          "error": failure.message.toString(),
        });
      }
      state = AsyncError(failure, StackTrace.current);
    }, (autoCompleteList) {
      state = AsyncData(LocationState(
          userCurrentLocation: state.value!.userCurrentLocation,
          autoCompleteList: autoCompleteList
              .where((element) =>
          element.city?.isNotEmpty == true &&
              element.country?.isNotEmpty == true)
              .toList()));
    });
  }

  FutureOr<void> setLocation(
      {LocationEntity? location, void Function()? goHomePage}) async {
    if (goHomePage != null) {
      goHomePage();
    }
    if (location == null) {
      getCurrentLocation(goHomePage: goHomePage);
    } else {
      var userCurrentLocation = location;
      final saveResult = await _saveCurrentLocationUseCase(
          userCurrentLocation as LocationModel);
      printDebug("_saveCurrentLocationUseCase $saveResult");
      state = AsyncData(LocationState(userCurrentLocation: userCurrentLocation));
    }
  }

  FutureOr<LocationState?> getCurrentLocation(
      {void Function()? goHomePage}) async {
    state = AsyncLoading();
    final result = await _getCurrentLocationUseCase(NoParams());
    printDebug("/// _getCurrentLocationUseCase $result");
    return result.fold((failure) {
      if (enableAnalytics) {
        analytics.logEvent(name: "error in location notifier", parameters: {
          "release": kReleaseMode.toString(),
          "isWeb": kIsWeb.toString(),
          "error": failure.message.toString(),
        });
      }
      state = AsyncError(failure, StackTrace.current);
      return null;
    }, (success) {
      return getLocationFromCoordinates(
        params: GetLocationFromCoordinatesParams(
            lat: success.lat.toString(), lon: success.lon.toString()),
      );
    });
  }
}

const defaultLocation = LocationEntity(
    lat: 30.0444,
    lon: 31.2357,
    city: "Cairo",
    country: "Egypt",
    countryCode: "EG",
    timezone: "Africa/Cairo"

    ///Africa and Cairo must start with capital letter
    );

class LocationState extends Equatable {
  final List<LocationEntity>? autoCompleteList;
  final LocationEntity userCurrentLocation;

  const LocationState({
    this.autoCompleteList,
    this.userCurrentLocation = defaultLocation,
  });

  @override
  List<Object?> get props => [
        autoCompleteList,
        userCurrentLocation,
      ];
}
