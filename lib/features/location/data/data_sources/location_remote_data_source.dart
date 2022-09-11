import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:the_weather_app/core/Network/Network.dart';

abstract class LocationRemoteDataSource{
  Future<String> getLocationFromCoordinates({required String lat,required String lon});
}
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource{
  @override

  Future<String> getLocationFromCoordinates({required String lat,required String lon}) async{
    String location = "";
    final result = await Network.get(
        url:
            'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${lat}&longitude=${lon}&localityLanguage=${'locale'.tr().toString()}');
    final locationDetails = json.decode(result.body);
    if (locationDetails != null) {
      location = locationDetails['city'].toString().isNotEmpty
          ? '${locationDetails['city']},${locationDetails['countryCode']}'
          : '${locationDetails['principalSubdivision']},${locationDetails['countryCode']}';
    }
    return location;
  }
/*
* Future<Map> getLocationFromCoordinates() async {
    var url =
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${_todayWeather.lat}&longitude=${_todayWeather.lon}&localityLanguage=${'locale'.tr().toString()}';
    final response = await http.get(Uri.parse(url));

    final locationDetails = json.decode(response.body);
    //print('locationDetails $locationDetails');
    if (locationDetails != null) {
      location = locationDetails['city'].toString().isNotEmpty
          ? '${locationDetails['city']},${locationDetails['countryCode']}'
          : '${locationDetails['principalSubdivision']},${locationDetails['countryCode']}';
    }
    notifyListeners();
    return locationDetails;
  }*/
}

