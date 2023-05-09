import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:the_weather_app/core/error/exceptions.dart';
import 'package:the_weather_app/core/utils.dart';

class Network{

  static Future<http.Response> post({required String url,Map<String, String>? header,Map? body}) async {
    Uri uri = Uri.parse(url);
    printDebug("[url] start"+url,);
    http.Response response;
    try{
      response = await http.post(uri, headers: header, body: body);
      if(response.statusCode!=200){
        throw ServerException(message: response.body.toString());
      }
    }catch (exception){
      if(exception is ServerException){
        throw exception;
      }else{
        throw ServerException(message: exception.toString());
      }
    }
    printDebug("[url] "+url,);
    printDebug("[header] "+"${header??""}",);
    printDebug("[body] "+"${body??""}",);
    printDebug("[response body] ${response.body}",);
    printDebug("[statusCode] "+"${response.statusCode}",);
    return response;
  }

  static Future<http.Response> get({required String url,Map<String, String>? header}) async {
    Uri uri = Uri.parse(url);
    printDebug("[url] start"+url,);
    http.Response response;
    try{
      response = await http.get(uri, headers: header,);
      if(response.statusCode!=200){
        throw ServerException(message: response.body.toString());
      }
    }catch (exception){
      if(exception is ServerException){
        throw exception;
      }else{
        throw ServerException(message: exception.toString());
      }
    }
    printDebug("[url] "+url,);
    printDebug("[header] "+"$header");
    printDebug("[response body] ${response.body}",);
    printDebug("[statusCode] ${response.statusCode}");
    return response;
  }

}