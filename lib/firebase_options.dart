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
    apiKey: 'AIzaSyCYC1LnjGU_Vy8vuluHX4wRrVdaMPsZApM',
    appId: '1:367278216578:web:c48d7124451404e5cdab9b',
    messagingSenderId: '367278216578',
    projectId: 'studentjourney-ae2bd',
    authDomain: 'studentjourney-ae2bd.firebaseapp.com',
    storageBucket: 'studentjourney-ae2bd.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaKiG00Hs8efhAIb2GtadiU7Gk-07985Q',
    appId: '1:367278216578:android:f11fa1f97ac16ff8cdab9b',
    messagingSenderId: '367278216578',
    projectId: 'studentjourney-ae2bd',
    storageBucket: 'studentjourney-ae2bd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZbEIgy4eYQEd-GHQg6xdteNLxqVro9O4',
    appId: '1:367278216578:ios:adc1775190e76752cdab9b',
    messagingSenderId: '367278216578',
    projectId: 'studentjourney-ae2bd',
    storageBucket: 'studentjourney-ae2bd.firebasestorage.app',
    iosBundleId: 'com.example.drawer',
  );
}