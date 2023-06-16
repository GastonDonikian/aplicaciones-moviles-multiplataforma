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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyAoXGF9ot-OljxiQt53IbXZT_-t9PG-3uU',
    appId: '1:69815020399:web:fc7c2268e96bf44072d69a',
    messagingSenderId: '69815020399',
    projectId: 'sermanos-f8b2f',
    authDomain: 'sermanos-f8b2f.firebaseapp.com',
    storageBucket: 'sermanos-f8b2f.appspot.com',
    measurementId: 'G-H7VF83HWW1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeHzsSiFEZLL_LznRAq9NwOsk4-HLBMDQ',
    appId: '1:69815020399:android:69e0698aec0a851c72d69a',
    messagingSenderId: '69815020399',
    projectId: 'sermanos-f8b2f',
    storageBucket: 'sermanos-f8b2f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsaOozSvGe-JsMR3IMrDYIToJYoGTVt0Q',
    appId: '1:69815020399:ios:44512d2c770d353e72d69a',
    messagingSenderId: '69815020399',
    projectId: 'sermanos-f8b2f',
    storageBucket: 'sermanos-f8b2f.appspot.com',
    iosClientId: '69815020399-1i71qbmmphfbut5t3sbqpaqvqdl4l5gg.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsaOozSvGe-JsMR3IMrDYIToJYoGTVt0Q',
    appId: '1:69815020399:ios:44512d2c770d353e72d69a',
    messagingSenderId: '69815020399',
    projectId: 'sermanos-f8b2f',
    storageBucket: 'sermanos-f8b2f.appspot.com',
    iosClientId: '69815020399-1i71qbmmphfbut5t3sbqpaqvqdl4l5gg.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}