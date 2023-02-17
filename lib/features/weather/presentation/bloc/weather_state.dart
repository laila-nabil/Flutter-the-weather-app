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

  WeatherState copyWith(
      {required WeatherStatus weatherStatus,
      TodayOverview? todayOverview,
      Failure? todayOverviewFailure,
      WeatherTimeline? weatherTimeline,
      Failure? weatherTimelineFailure}) {
    return WeatherState(
        weatherStatus: weatherStatus,
        todayOverview: todayOverview ?? this.todayOverview,
        todayOverviewFailure: todayOverviewFailure ?? this.todayOverviewFailure,
        weatherTimeline: weatherTimeline ?? this.weatherTimeline,
        weatherTimelineFailure:
            weatherTimelineFailure ?? this.weatherTimelineFailure);
  }

  WeatherState(
      {required this.weatherStatus,
      this.todayOverview,
      this.todayOverviewFailure,
      this.weatherTimeline,
      this.weatherTimelineFailure});

  @override
  List<Object?> get props => [
        weatherStatus,
        todayOverview,
        todayOverviewFailure,
        weatherTimeline,
        weatherTimelineFailure
      ];
}
