import 'dart:convert';

import 'package:http/http.dart' as http;

class location{
  final String lon;
  final String lat;
  String city = 'no where';
  location({this.lon,this.lat});

  Future<Map> getCityFromCoordinates() async {
    var url =
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=$lat&longitude=$lon&localityLanguage=en';
    final response = await http.get(Uri.parse(url));
    final locationDetails = json.decode(response.body);
    // print('locationDetails $locationDetails');
    city = locationDetails['city'];
    return locationDetails;

  }

}