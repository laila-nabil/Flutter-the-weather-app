import 'package:the_weather_app/features/weather/data/data_sources/weather_remote_data_source.dart';

import 'package:the_weather_app/features/weather/domain/repositories/weather_repo.dart';


class WeatherRepoImpl extends WeatherRepo{
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepoImpl(this.weatherRemoteDataSource);

}