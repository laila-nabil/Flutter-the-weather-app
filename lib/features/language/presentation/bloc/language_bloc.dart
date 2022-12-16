
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/localization/localization.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {
      if(event is SelectLanguage){
        emit(SelectLanguageState(event.language));
      }
    });
  }
}
