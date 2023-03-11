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

  List<LocationEntity> autoCompleteList = [];
  LocationEntity? location = LocationEntity(lat: '30.0444', lon: '31.2357');
  LocationEntity? userCurrentLocation;

  LocationBloc(this._autoCompleteSearchLocationUseCase,
      this._getLocationFromCoordinatesUseCase, this._getCurrentLocationUseCase)
      : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      if (event is LocationInitialEvent) {
        add(GetCurrentLocation());
      } else if (event is GetCurrentLocation) {
        emit(LocationLoading(event));
        final result = await _getCurrentLocationUseCase(NoParams());
        printDebug("_getCurrentLocationUseCase $result");
        result.fold((failure) => emit(LocationFailure(event, failure: failure)),
            (success) {
          location = success;
          userCurrentLocation = success;
          emit(LocationSuccess(event, userCurrentLocation: success));
          emit(SetLocationState(location: location));
          add(GetLocationFromCoordinates(GetLocationFromCoordinatesParams(
              lat: location?.lat ?? "", lon: location?.lon ?? "")));
        });
      } else if (event is SetLocation) {
        if (event.location == null) {
          add(GetCurrentLocation());
        } else {
          emit(SetLocationState(location: location));
        }
      } else if (event is AutoCompleteSearchLocation) {
        emit(LocationLoading(event));
        final result = await _autoCompleteSearchLocationUseCase(event.input);
        result.fold((failure) => emit(LocationFailure(event, failure: failure)),
            (success) {
          autoCompleteList = success;
          emit(LocationSuccess(event, autoCompleteSearchLocation: success));
        });
      } else if (event is GetLocationFromCoordinates) {
        await _getLocationFromCoordinates(emit, event);
      }
    });
  }

  Future<void> _getLocationFromCoordinates(
      Emitter<LocationState> emit, GetLocationFromCoordinates event) async {
    emit(LocationLoading(event));
    final result = await _getLocationFromCoordinatesUseCase(event.params);
    printDebug("_getLocationFromCoordinatesUseCase $result");
    result.fold((failure) => emit(LocationFailure(event, failure: failure)),
        (success) {
      location = success;
      emit(LocationSuccess(event, locationFromCoordinates: success,userCurrentLocation: userCurrentLocation));
    });
  }
}
