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
    apiKey: 'AIzaSyBQA_FhJ4HPiq9Gddsl0PwykZtPwb3BwDM',
    appId: '1:868203876827:web:e694b18332d335274c57fe',
    messagingSenderId: '868203876827',
    projectId: 'to-do-app-22ddd',
    authDomain: 'to-do-app-22ddd.firebaseapp.com',
    storageBucket: 'to-do-app-22ddd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBkOTk50msjBE2bV9ysxtkHaIVyqPXP7c',
    appId: '1:868203876827:android:582aa65f90c0f10b4c57fe',
    messagingSenderId: '868203876827',
    projectId: 'to-do-app-22ddd',
    storageBucket: 'to-do-app-22ddd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtc2Sg8SX9y6-QWa91sfBq-HRQVAUmenA',
    appId: '1:868203876827:ios:67754684a7ac05b84c57fe',
    messagingSenderId: '868203876827',
    projectId: 'to-do-app-22ddd',
    storageBucket: 'to-do-app-22ddd.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtc2Sg8SX9y6-QWa91sfBq-HRQVAUmenA',
    appId: '1:868203876827:ios:32cd386a5d7797354c57fe',
    messagingSenderId: '868203876827',
    projectId: 'to-do-app-22ddd',
    storageBucket: 'to-do-app-22ddd.appspot.com',
    iosBundleId: 'com.example.todoapp.RunnerTests',
  );
}
