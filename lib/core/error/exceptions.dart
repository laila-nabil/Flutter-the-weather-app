class ServerException implements Exception{
  String? message;

  ServerException({this.message});

}

class EmptyCacheException implements Exception {}
