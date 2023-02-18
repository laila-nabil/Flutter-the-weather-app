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
    city = json['city'];
    country = json['countryName'];
    countryCode = json['countryCode'];
  }
}
