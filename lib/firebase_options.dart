// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDJRqp2krcESGN-HpdXsljg5AZrxrDNz1U',
    appId: '1:243700411753:web:4c858deb55073f8ac2a1f8',
    messagingSenderId: '243700411753',
    projectId: 'flutter-firebase-c9651',
    authDomain: 'flutter-firebase-c9651.firebaseapp.com',
    databaseURL: 'https://flutter-firebase-c9651-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-firebase-c9651.firebasestorage.app',
    measurementId: 'G-B3YCN98VR4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2gLT91RGQMYdWdDO4Pqh9A1qZbz1-G1E',
    appId: '1:243700411753:android:2c96c7489d31e714c2a1f8',
    messagingSenderId: '243700411753',
    projectId: 'flutter-firebase-c9651',
    databaseURL: 'https://flutter-firebase-c9651-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-firebase-c9651.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfuEywy-UFFTOMtrNbPG7K6SbTHSpgI6A',
    appId: '1:243700411753:ios:6c30109b28233ee9c2a1f8',
    messagingSenderId: '243700411753',
    projectId: 'flutter-firebase-c9651',
    databaseURL: 'https://flutter-firebase-c9651-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-firebase-c9651.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfuEywy-UFFTOMtrNbPG7K6SbTHSpgI6A',
    appId: '1:243700411753:ios:6c30109b28233ee9c2a1f8',
    messagingSenderId: '243700411753',
    projectId: 'flutter-firebase-c9651',
    databaseURL: 'https://flutter-firebase-c9651-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-firebase-c9651.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJRqp2krcESGN-HpdXsljg5AZrxrDNz1U',
    appId: '1:243700411753:web:88ee0deeb9076165c2a1f8',
    messagingSenderId: '243700411753',
    projectId: 'flutter-firebase-c9651',
    authDomain: 'flutter-firebase-c9651.firebaseapp.com',
    databaseURL: 'https://flutter-firebase-c9651-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-firebase-c9651.firebasestorage.app',
    measurementId: 'G-WWGBE63364',
  );

}