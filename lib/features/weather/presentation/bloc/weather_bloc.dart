import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/extensions.dart';
import 'package:the_weather_app/core/localization/localization.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:the_weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_history_weather.dart';
import 'package:the_weather_app/features/weather/domain/use_cases/get_present_future_weather.dart';

import '../../../language/presentation/bloc/language_bloc.dart';
import '../../domain/entities/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetPresentFutureWeatherUseCase _getPresentFutureWeatherUseCase;
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetHistoryWeatherUseCase _getHistoryWeatherUseCase;
  final LocationBloc locationBloc;
  final LanguageBloc languageBloc;
  languagesEnum selectedLangEnum = languagesEnum.en;
  String get selectedLang => selectedLangEnum.name;
  StreamSubscription? _locationSubscription;
  StreamSubscription? _languageSubscription;
  CurrentWeather? currentWeather;
  List<Weather>? historyWeather;
  List<Weather>? presentFutureWeather;
  String compareTodayYesterday = "";
  WeatherBloc(
      this._getPresentFutureWeatherUseCase,
      this._getCurrentWeatherUseCase,
      this._getHistoryWeatherUseCase,
      this.locationBloc, this.languageBloc)
      : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      ///TODO NOT WORKING AS INTENDED
      if(_locationSubscription == null){
        _locationSubscription = locationBloc.stream.listen((state) async {
          if (state is SetLocationState) {
            final longitude = state.location?.lon ?? "";
            final latitude = state.location?.lat ?? "";
            await getCurrentWeather(
                emit: emit,
                event: event,
                params: GetCurrentWeatherParams(
                    language: selectedLang,
                    longitude: longitude,
                    latitude: latitude));
            await getHistoryWeather(
                emit: emit,
                event: event,
                params: GetHistoryWeatherParams(
                    language: selectedLang,
                    longitude: longitude,
                    latitude: latitude,
                    unixTimestamp: 0));
            await getPresentFutureWeather(
                emit: emit,
                event: event,
                params: GetPresentFutureWeatherParams(
                    language: selectedLang,
                    longitude: longitude,
                    latitude: latitude));
          }
        });
      }
      if(_languageSubscription == null){
        _languageSubscription = languageBloc.stream.listen((state) {
          printDebug("listen languageBloc in weatherBloc");
          if (state is SelectLanguageState) {
            printDebug("selectedLangEnum $selectedLangEnum");
            selectedLangEnum = state.language;
          }
        });
      }
      if (event is WeatherRefreshEvent) {
        final location = locationBloc.location;
        final longitude = location?.lon ?? "";
        final latitude = location?.lat ?? "";

        ///TODO
        await getCurrentWeather(
            emit: emit,
            event: event,
            params: GetCurrentWeatherParams(
                language: selectedLang, longitude: longitude, latitude: latitude));
        await getHistoryWeather(
            emit: emit,
            event: event,
            params: GetHistoryWeatherParams(
                language: selectedLang,
                longitude: longitude,
                latitude: latitude,
                unixTimestamp: 0));
        await getPresentFutureWeather(
            emit: emit,
            event: event,
            params: GetPresentFutureWeatherParams(
                language: selectedLang, longitude: longitude, latitude: latitude));
        updateCompareTodayYesterday(emit: emit,
            event: event,
            todayWeather :presentFutureWeather.tryFirst,
            historyWeather: historyWeather);
      } else if (event is WeatherInitialEvent) {
        ///TODO
        /*
        *  if (_isInit) {
//       //printDebug('didChangeDependencies');
//       _isLoading = true;
//       try {
//         await Provider.of<WeatherProvider>(context, listen: false)
//             .getCurrentWeatherAPI();
//         await Provider.of<WeatherProvider>(context, listen: false)
//             .getPresentFutureWeatherAPI();
//         await Provider.of<WeatherProvider>(context, listen: false)
//             .getAllHistoryWeatherUTC();
//
//         setState(() {
//           _isLoading = false;
//           _isInit = false;
//         });
//       } catch (error) {
//         //printDebug('error in did change $error');
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('An error occurred! did $error')));
//       }
//
//       cron = Cron();
//       //printDebug('Alarm set');
//       //https://crontab.guru/
//       //'01/30 * * * *'
//       //“At minute 1 and 30.”
//       cron.schedule(Schedule.parse('01,30 * * * *'), () async {
//         //printDebug('01,30 * * * * ${DateTime.now()}');
//         try {
//           if (Provider.of<WeatherProvider>(context, listen: false).isLoading) {
//             //printDebug('cron can\'t since isLoading in true');
//           } else {
//             await Provider.of<WeatherProvider>(context, listen: false)
//                 .getCurrentWeatherAPI();
//           }
//
//           setState(() {
//             //printDebug('update');
//           });
//         } catch (error) {
//           //printDebug(error);
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('An error occurred!')));
//         }
//       });
//       cron.schedule(Schedule.parse('01 0 * * *'), () async {
//         //printDebug('01 0 * * * ${DateTime.now()}');
//         try {
//           await Provider.of<WeatherProvider>(context, listen: false)
//               .getPresentFutureWeatherAPI();
//           // await Provider.of<WeatherProvider>(context, listen: false)
//           //     .getAllHistoryWeather();
//           setState(() {
//             //printDebug('update');
//           });
//         } catch (error) {
//           //printDebug(error);
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('An error occurred!')));
//         }
//       });
//     }*/
        final location = locationBloc.location;
        final longitude = location?.lon ?? "";
        final latitude = location?.lat ?? "";

        ///TODO unixTimestamp
        await getCurrentWeather(
            emit: emit,
            event: event,
            params: GetCurrentWeatherParams(
                language: selectedLang, longitude: longitude, latitude: latitude));
        await getHistoryWeather(
            emit: emit,
            event: event,
            params: GetHistoryWeatherParams(
                language: selectedLang,
                longitude: longitude,
                latitude: latitude,
                unixTimestamp: 0));
        await getPresentFutureWeather(
            emit: emit,
            event: event,
            params: GetPresentFutureWeatherParams(
                language: selectedLang, longitude: longitude, latitude: latitude));
        updateCompareTodayYesterday(emit: emit,
            event: event,
            todayWeather:presentFutureWeather.tryFirst,
            historyWeather: historyWeather);
      } else if (event is _GetCurrentWeather) {
        var params = event.params;
        await getCurrentWeather(emit: emit, event: event, params: params);
      } else if (event is _GetHistoryWeather) {
        var params = event.params;
        await getHistoryWeather(emit: emit, event: event, params: params);
      } else if (event is _GetPresentFutureWeather) {
        var params = event.params;
        await getPresentFutureWeather(emit: emit, event: event, params: params);
      }
    });
  }

  Future<void> getPresentFutureWeather(
      {required Emitter<WeatherState> emit,
      required WeatherEvent event,
      required GetPresentFutureWeatherParams params}) async {
    emit(WeatherLoading(event));
    final result = await _getPresentFutureWeatherUseCase(params);
    result.fold((failure) => emit(WeatherFailure(event, failure: failure)),
        (success) {
      presentFutureWeather = success;
      emit(WeatherSuccess(event, presentFutureWeather: success));
    });
  }

  Future<void> getHistoryWeather(
      {required Emitter<WeatherState> emit,
      required GetHistoryWeatherParams params,
      required WeatherEvent event}) async {
    emit(WeatherLoading(event));
    final result = await _getHistoryWeatherUseCase(params);
    result.fold((failure) => emit(WeatherFailure(event, failure: failure)),
        (success) {
      historyWeather = success;
      emit(WeatherSuccess(event, historyWeather: success));
    });
  }

  Future<void> getCurrentWeather(
      {required Emitter<WeatherState> emit,
      required GetCurrentWeatherParams params,
      required WeatherEvent event}) async {
    emit(WeatherLoading(event));
    final result = await _getCurrentWeatherUseCase(params);
    result.fold((failure) => emit(WeatherFailure(event, failure: failure)),
        (success) {
      currentWeather = success;
      emit(WeatherSuccess(event, currentWeather: success));
    });
  }

  void updateCompareTodayYesterday(
      {required Emitter<WeatherState> emit,
      required Weather? todayWeather,
      List<Weather>? historyWeather,
      required WeatherEvent event}) {
    if (historyWeather != null &&
        historyWeather.isNotEmpty == true &&
        todayWeather != null) {
      var yesterdayMaxTemp =
          double.parse(historyWeather.tryFirst?.tempMax ?? "");
      var yesterdayMinTemp =
          double.parse(historyWeather.tryFirst?.tempMin ?? "");
      var todayMinTemp = double.parse(todayWeather.tempMin);
      var todayMaxTemp = double.parse(todayWeather.tempMax);

      var warmerText = LocalizationImpl().translate("warmer");
      var colderText = LocalizationImpl().translate("colder");
      final diffDay = todayMaxTemp > yesterdayMaxTemp ? warmerText : colderText;
      final diffNight =
          todayMinTemp > yesterdayMinTemp ? warmerText : colderText;
      final diffMax = (todayMaxTemp - yesterdayMaxTemp).toString();
      final diffMin = (todayMinTemp - yesterdayMinTemp).toString();
      compareTodayYesterday =
          LocalizationImpl().translate("compareWeather", namedArguments: {
        "diffDay": diffDay,
        "diffNight": diffNight,
        "diffMin": diffMin,
        "diffMax": diffMax
      });
      printDebug("compareTodayYesterday $compareTodayYesterday");
    }
    else {
      printDebug(
          "compareTodayYesterday else ${historyWeather != null} ${historyWeather?.isNotEmpty == true} ${todayWeather != null} $compareTodayYesterday");
      compareTodayYesterday = "";
    }
    emit(WeatherSuccess(event, compareTodayYesterday: compareTodayYesterday));
  }

  @override
  Future<void> close() {
    _languageSubscription?.cancel();
    _locationSubscription?.cancel();
    return super.close();
  }

}
