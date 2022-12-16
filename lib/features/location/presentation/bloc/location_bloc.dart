import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_current_location_use_case.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';

import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/location.dart';
import '../../domain/use_cases/autocomplete_search_location_use_case.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final AutoCompleteSearchLocationUseCase autoCompleteSearchLocationUseCase;
  final GetLocationFromCoordinatesUseCase getLocationFromCoordinatesUseCase;
  final GetCurrentLocationUseCase getCurrentLocationUseCase;

  List<LocationEntity> autoCompleteList = [];
  LocationEntity? location;
  LocationEntity? userCurrentLocation;

  LocationBloc(this.autoCompleteSearchLocationUseCase,
      this.getLocationFromCoordinatesUseCase, this.getCurrentLocationUseCase)
      : super(LocationInitial()) {
    on<LocationEvent>((event, emit) {
      on<LocationInitialEvent>((event, emit) {
        //TODO
      });
      on<GetLocationFromCoordinates>((event, emit) async {
        emit(LocationLoading(event));
        final result = await getLocationFromCoordinatesUseCase(event.params);
        result.fold(
            (failure) => emit(LocationFailure(event, failure: failure)),
            (success) =>
                emit(LocationSuccess(event, locationFromCoordinates: success)));
      });
      on<AutoCompleteSearchLocation>((event, emit) async {
        emit(LocationLoading(event));
        final result = await autoCompleteSearchLocationUseCase(event.input);
        result.fold((failure) => emit(LocationFailure(event, failure: failure)),
            (success) {
          autoCompleteList = success;
          emit(LocationSuccess(event, autoCompleteSearchLocation: success));
        });
      });
      on<SetLocation>((event, emit) {
        if (event.location == null) {
          add(GetCurrentLocation());
        } else {
          emit(SetLocationState(location: location));
        }
      });
      on<GetCurrentLocation>((event, emit) async {
        emit(LocationLoading(event));
        final result = await getCurrentLocationUseCase(NoParams());
        result.fold((failure) => emit(LocationFailure(event, failure: failure)),
            (success) {
          location = success;
          userCurrentLocation = success;
          emit(LocationSuccess(event, userCurrentLocation: success));
          emit(SetLocationState(location: location));
        });
      });
    });
  }
}
