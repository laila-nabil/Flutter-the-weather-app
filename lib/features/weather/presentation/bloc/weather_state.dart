part of 'weather_bloc.dart';

enum WeatherStatus {initial,loading,todayOverviewSuccess,todayOverviewFailure}

class WeatherState extends Equatable {
  final WeatherStatus weatherStatus;
  TodayOverview? todayOverview;

  WeatherState copyWith({
    required WeatherStatus weatherStatus,
    TodayOverview? todayOverview,
    Failure? todayOverviewFailure,
  }) {
    return WeatherState(
        weatherStatus : weatherStatus,
        todayOverview : todayOverview ?? this.todayOverview,
        todayOverviewFailure :
            todayOverviewFailure ?? this.todayOverviewFailure
    );
  }

  Failure? todayOverviewFailure;

  WeatherState(
      {required this.weatherStatus, this.todayOverview, this.todayOverviewFailure});



  @override
  List<Object?> get props => [this.weatherStatus, this.todayOverview, this.todayOverviewFailure];
}
