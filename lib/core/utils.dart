import 'dart:developer';

import 'package:flutter/foundation.dart';

void printDebug(Object? message){
  if(kDebugMode){
    print(message);
  }else{
    log(message.toString());
  }
}