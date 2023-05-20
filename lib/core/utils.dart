import 'dart:developer';

import 'package:flutter/foundation.dart';

void printDebug(Object? message){
  if(kDebugMode){
    print(message);
  }
}