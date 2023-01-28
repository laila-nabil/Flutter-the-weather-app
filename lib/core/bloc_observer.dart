import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:the_weather_app/core/utils.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    printDebug('BlocObserver onCreate => ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printDebug('BlocObserver onEvent => ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printDebug('BlocObserver onChange => (${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printDebug('BlocObserver onError => ${bloc.runtimeType}, $error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    printDebug('BlocObserver onClose => ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}