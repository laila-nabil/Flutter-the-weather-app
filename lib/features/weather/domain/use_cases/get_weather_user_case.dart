import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_weather_app/core/error/failures.dart';
import 'package:the_weather_app/core/use_case/use_case.dart';
import 'package:the_weather_app/features/weather/domain/entities/content.dart';

class GetWeatherUseCase extends UseCase<Content, GetWeatherParams> {
  @override
  Future<Either<Failure, Content>> call(GetWeatherParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetWeatherParams extends Equatable {
  final String latitude;
  final String longitude;
  final String language;

  GetWeatherParams(
      {required this.latitude,
        required this.longitude,
        required this.language});

  @override
  List<Object?> get props => [latitude, longitude, language];

}