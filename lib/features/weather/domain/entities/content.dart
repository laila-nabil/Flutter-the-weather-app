import 'package:equatable/equatable.dart';

class Content extends Equatable {
  final CurrentWeatherContent currentWeatherContent;
  final CompareWeatherContent compareWeatherContent;
  final TimelineWeatherContent timelineWeatherContent;

  Content(
      {required this.currentWeatherContent,
      required this.compareWeatherContent,
      required this.timelineWeatherContent});

  @override
  List<Object?> get props => [
        this.currentWeatherContent,
        this.compareWeatherContent,
        this.timelineWeatherContent
      ];
}

class CurrentWeatherContent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CompareWeatherContent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TimelineWeatherContent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
