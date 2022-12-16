import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:the_weather_app/core/error/exceptions.dart';

class Network{

  static Future<http.Response> post({required String url,Map<String, String>? header,Map? body}) async {
    Uri uri = Uri.parse(url);
    developer.log(url,name: "url - post request");
    developer.log("${header??""}",name: "header - post request");
    developer.log("${body??""}",name: "body - post request");
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
    developer.log("$response",name: "body - post request");
    return response;
  }

  static Future<http.Response> get({required String url,Map<String, String>? header}) async {
    Uri uri = Uri.parse(url);
    developer.log(url,name: "url - get request");
    developer.log("$header",name: "header - get request");
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
    developer.log("$response",name: "body - get request");
    return response;
  }

}