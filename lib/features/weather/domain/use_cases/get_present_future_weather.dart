import 'package:equatable/equatable.dart';



class GetPresentFutureWeatherParams extends Equatable{
  final String latitude;
  final String longitude;
  final String language;

  GetPresentFutureWeatherParams(
      {required this.latitude,
      required this.longitude,
      required this.language});

  @override
  List<Object?> get props => [latitude,longitude,language];
}