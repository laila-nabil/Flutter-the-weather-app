import '../../domain/entities/location.dart';

class LocationModel extends LocationEntity {
  const LocationModel(
      {double? lon,
      double? lat,
      String? city,
      String? countryCode,
      String? country,
      String? timezone,
      })
      : super(
            lon: lon,
            lat: lat,
            city: city,
            country: country,
            countryCode: countryCode,
            timezone: timezone,
  );

  factory LocationModel.fromJson(dynamic json) {
    return LocationModel(
      lon: json['properties']['lon'],
      lat: json['properties']['lat'],
      city: json['properties']['city'],
      country: json['properties']['country'],
    );
  }

  factory LocationModel.bigDataCloudFromJson(Map<String, dynamic> json) {
    String timezone = "Africa/Cairo";
    if(json['localityInfo']!=null){
      if(json['localityInfo']["informative"]!=null){
        timezone =
            (json['localityInfo']["informative"] as List<Map<String, String>>)
                .firstWhere((element) => element["description"] == "time zone")
                .toString();
      }
    }
    return LocationModel(
        lon: json['longitude'],
        lat: json['latitude'],
        city: json['city'].toString(),
        country: json['countryName'].toString(),
        countryCode: json['countryCode'].toString(),
        timezone: timezone
    );
  }
}
