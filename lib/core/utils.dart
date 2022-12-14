import 'dart:developer';

import 'package:flutter/foundation.dart';

void printK(Object? message){
  if(kDebugMode){
    print(message);
  }else{
    log(message.toString());
  }
}