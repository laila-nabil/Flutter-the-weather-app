import 'package:equatable/equatable.dart';



class GetCurrentWeatherParams extends Equatable{
  final String latitude;
  final String longitude;
  final String language;

  GetCurrentWeatherParams(
      {required this.latitude,
      required this.longitude,
      required this.language});

  @override
  List<Object?> get props => [latitude,longitude,language];
}