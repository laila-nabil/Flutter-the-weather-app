import 'package:the_weather_app/core/utils.dart';

import '../../domain/entities/location.dart';

class LocationModel extends LocationEntity {
  LocationModel.fromJson(dynamic json) {
    lon = json['properties']['lon'];
    lat = json['properties']['lat'];
    city = json['properties']['city'];
    country = json['properties']['country'];
  }
  LocationModel.bigDataCloudFromJson(Map<String,dynamic> json) {
    lon =json['longitude'];
    lat = json['latitude'];
    city = json['city'].toString();
    country = json['countryName'].toString();
    countryCode = json['countryCode'].toString();
  }
}
