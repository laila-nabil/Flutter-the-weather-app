import 'package:equatable/equatable.dart';



class GetHistoryWeatherParams extends Equatable{
  final String latitude;
  final String longitude;
  final String language;
  final int unixTimestamp;
  GetHistoryWeatherParams(
      {required this.latitude,
      required this.longitude,
      required this.unixTimestamp,
      required this.language});

  @override
  List<Object?> get props => [latitude,longitude,language,unixTimestamp];
}