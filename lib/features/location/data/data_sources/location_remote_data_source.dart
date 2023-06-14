import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:the_weather_app/core/Network/network.dart';
import 'package:the_weather_app/core/utils.dart';
import 'package:the_weather_app/features/location/domain/use_cases/get_location_from_coordinates_use_case.dart';

import '../models/location_model.dart';

abstract class LocationRemoteDataSource{
  Future<LocationModel> getLocationFromCoordinates({required GetLocationFromCoordinatesParams params});

  Future<List<LocationModel>> autoCompleteSearchLocation(String input);
}
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource{
  @override

  Future<LocationModel> getLocationFromCoordinates({required GetLocationFromCoordinatesParams params}) async{
    final result = await Network.get(
        url:
            'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${params.lat}&longitude=${params.lon}&localityLanguage=${'locale'.tr().toString()}');
    final locationDetails = json.decode(result.body);
    return LocationModel.bigDataCloudFromJson(locationDetails);
  }

  @override
  Future<List<LocationModel>> autoCompleteSearchLocation(String input) async{
    List<LocationModel> result = [];
    var url =
        'https://api.geoapify.com/v1/geocode/autocomplete?text=$input&limit=20&apiKey=2c66c649cf9042658a69266136c59284';
    final response = await Network.get(url: url);
    final body = json.decode(response.body);
    final List listResults = body['features'];
    for (var element in listResults) {
      result.add(LocationModel.fromJsonGeoapify(element));

    }
    printDebug("result $result");
    return result;
  }
}

