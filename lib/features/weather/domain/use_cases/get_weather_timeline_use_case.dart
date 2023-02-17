import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/weather_timeline.dart';
import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';
class GetWeatherTimelineUseCase implements UseCase<WeatherTimeline,WeatherTimelineParams>{
  final WeatherRepo repo;

  GetWeatherTimelineUseCase(this.repo);
  @override
  Future<Either<Failure, WeatherTimeline>> call(WeatherTimelineParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}


class WeatherTimelineParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}