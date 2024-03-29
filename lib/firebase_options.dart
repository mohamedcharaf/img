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
    apiKey: 'AIzaSyB5eEGxzInXqxA8wmuRS5j8Pm93FsnO8aw',
    appId: '1:1097289392896:web:39bedb9f883a60e16bc9e5',
    messagingSenderId: '1097289392896',
    projectId: 'image-adafb',
    authDomain: 'image-adafb.firebaseapp.com',
    storageBucket: 'image-adafb.appspot.com',
    measurementId: 'G-SFKC8ZYCCL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0zURjlO3pajyqfNEa_1N90cMuFXHDNR4',
    appId: '1:1097289392896:android:5a523043863e0cbb6bc9e5',
    messagingSenderId: '1097289392896',
    projectId: 'image-adafb',
    storageBucket: 'image-adafb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEVDtgshrc23YGBtKNoqwxscokdoVeAvg',
    appId: '1:1097289392896:ios:b2d8db86291a46c46bc9e5',
    messagingSenderId: '1097289392896',
    projectId: 'image-adafb',
    storageBucket: 'image-adafb.appspot.com',
    iosBundleId: 'com.example.img',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEVDtgshrc23YGBtKNoqwxscokdoVeAvg',
    appId: '1:1097289392896:ios:b2d8db86291a46c46bc9e5',
    messagingSenderId: '1097289392896',
    projectId: 'image-adafb',
    storageBucket: 'image-adafb.appspot.com',
    iosBundleId: 'com.example.img',
  );
}
