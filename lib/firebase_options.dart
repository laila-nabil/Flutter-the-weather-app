// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALRKLjTuBlVGSHi6q12f0TV8kSzUizCdc',
    appId: '1:139996546585:web:804a011d61734325d98c88',
    messagingSenderId: '139996546585',
    projectId: 'weather-app-d1c77',
    authDomain: 'weather-app-d1c77.firebaseapp.com',
    storageBucket: 'weather-app-d1c77.appspot.com',
    measurementId: 'G-LJMLFSKD16',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfPWP-p4vn1CVcuHQZEnqUiV0ij33dZ2U',
    appId: '1:139996546585:android:40554b093fce7f26d98c88',
    messagingSenderId: '139996546585',
    projectId: 'weather-app-d1c77',
    storageBucket: 'weather-app-d1c77.appspot.com',
  );
}