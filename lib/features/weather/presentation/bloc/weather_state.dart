part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  todayOverviewSuccess,
  todayOverviewFailure,
  weatherTimelineSuccess,
  weatherTimelineFailure
}

class WeatherState extends Equatable {
  final WeatherStatus weatherStatus;
  TodayOverview? todayOverview;
  WeatherTimeline? weatherTimeline;
  Failure? todayOverviewFailure;
  Failure? weatherTimelineFailure;
  String? compareTodayYesterday;
  WeatherState copyWith(
      {required WeatherStatus weatherStatus,
      TodayOverview? todayOverview,
      Failure? todayOverviewFailure,
      WeatherTimeline? weatherTimeline,
      Failure? weatherTimelineFailure,
        String? compareTodayYesterday
      }) {
    return WeatherState(
        weatherStatus: weatherStatus,
        todayOverview: todayOverview ?? this.todayOverview,
        todayOverviewFailure: todayOverviewFailure ?? this.todayOverviewFailure,
        weatherTimeline: weatherTimeline ?? this.weatherTimeline,
        weatherTimelineFailure:
            weatherTimelineFailure ?? this.weatherTimelineFailure,
        compareTodayYesterday: compareTodayYesterday??this.compareTodayYesterday
    );
  }

  // Day? get yesterday => weatherTimeline?.days?.elementAt(4);
  //
  // ///TODO
  // String? get compareTodayYesterday {
  //   if(todayOverview == null || yesterday == null){
  //     return null;
  //   }
  //   final diffDay = todayOverview!.day!.tempmax! > yesterday!.tempmax!
  //       ? "warmer".tr().toString()
  //       : "colder".tr().toString();
  //   final diffNight = todayOverview!.day!.tempmin! > yesterday!.tempmin!
  //       ? "warmer".tr().toString()
  //       : "colder".tr().toString();
  //   final diffMax = todayOverview!.day!.tempmax! - yesterday!.tempmax!;
  //   final diffMin = todayOverview!.day!.tempmin! - yesterday!.tempmin!;
  //   return 'lang'.tr().toString().contains('EN')
  //       ? 'Today is $diffDay than yesterday by ${diffMax.toStringAsFixed(2)} °' +
  //           'deg'.tr().toString() +
  //           ' at day and is $diffNight by ${diffMin.toStringAsFixed(2)} °' +
  //           'deg'.tr().toString() +
  //           ' at night'
  //       : 'اليوم $diffDay من الأمس ب${diffMax.toStringAsFixed(2)} °' +
  //           'deg'.tr().toString() +
  //           ' في النهار و$diffNight ب${diffMin.toStringAsFixed(2)} °' +
  //           'deg'.tr().toString() +
  //           ' في الليل';
  // }

  WeatherState(
      {required this.weatherStatus,
      this.todayOverview,
      this.todayOverviewFailure,
      this.weatherTimeline,
      this.weatherTimelineFailure,
      this.compareTodayYesterday
      });

  @override
  List<Object?> get props => [
        weatherStatus,
        todayOverview,
        todayOverviewFailure,
        weatherTimeline,
        weatherTimelineFailure,
        compareTodayYesterday
      ];
}
