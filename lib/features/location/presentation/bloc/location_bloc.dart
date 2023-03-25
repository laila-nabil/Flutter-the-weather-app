import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_current_location_use_case.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';

import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/location.dart';
import '../../domain/use_cases/autocomplete_search_location_use_case.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final AutoCompleteSearchLocationUseCase _autoCompleteSearchLocationUseCase;
  final GetLocationFromCoordinatesUseCase _getLocationFromCoordinatesUseCase;
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  // LocationEntity? location = LocationEntity(lat: '30.0444', lon: '31.2357');

  LocationBloc(this._autoCompleteSearchLocationUseCase,
      this._getLocationFromCoordinatesUseCase, this._getCurrentLocationUseCase)
      : super(LocationState(status: LocationStatus.initial)) {
    on<LocationEvent>((event, emit) async {
      if (event is LocationInitialEvent) {
        add(GetCurrentLocation());
      } else if (event is GetCurrentLocation) {
        emit(LocationState(status: LocationStatus.loading));
        final result = await _getCurrentLocationUseCase(NoParams());
        printDebug("_getCurrentLocationUseCase $result");
        result.fold((failure) => emit(LocationState(status: LocationStatus.failure,failure: failure)),
            (success) {
          emit(LocationState(status: LocationStatus.success,userCurrentLocation: success));
          add(GetLocationFromCoordinates(GetLocationFromCoordinatesParams(
              lat: success.lat ?? "", lon: success.lon ?? "")));
        });
      } else if (event is SetLocation) {
        if (event.location == null) {
          add(GetCurrentLocation());
        }
      } else if (event is AutoCompleteSearchLocation) {
        emit(LocationState(
          status: LocationStatus.success,
          userCurrentLocation: state.userCurrentLocation,
        ));
        final result = await _autoCompleteSearchLocationUseCase(event.input);
        result.fold((failure) => emit(LocationState(status: LocationStatus.failure,failure: failure)),
            (autoCompleteList) {
              emit(LocationState(
                status: LocationStatus.success,
                userCurrentLocation: state.userCurrentLocation,
                autoCompleteList: autoCompleteList
              ));
        });
      } else if (event is GetLocationFromCoordinates) {
        await _getLocationFromCoordinates(emit, event);
      }
    });
  }

  Future<void> _getLocationFromCoordinates(
      Emitter<LocationState> emit, GetLocationFromCoordinates event) async {
    emit(LocationState(
      status: LocationStatus.loading,
      userCurrentLocation: state.userCurrentLocation,
      autoCompleteList: state.autoCompleteList
    ));
    final result = await _getLocationFromCoordinatesUseCase(event.params);
    printDebug("_getLocationFromCoordinatesUseCase $result");
    result.fold((failure) => emit(LocationState(status: LocationStatus.failure)),
        (success) {
          emit(LocationState(
              status: LocationStatus.success,
              userCurrentLocation: success,
              autoCompleteList: state.autoCompleteList
          ));
    });
  }
}
