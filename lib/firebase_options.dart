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
    apiKey: 'AIzaSyANSMOUOLTuaaf8XA6e8zBzfV9WNbhlUbI',
    appId: '1:364894055848:web:2787ec3ebfd59a18d2819d',
    messagingSenderId: '364894055848',
    projectId: 'nerulendingsoftware-7d3d1',
    authDomain: 'nerulendingsoftware-7d3d1.firebaseapp.com',
    storageBucket: 'nerulendingsoftware-7d3d1.appspot.com',
    measurementId: 'G-G5Z7P9NLXQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPiZ-6ysR-Zjkc80IfxUtNO4mynsjlyGM',
    appId: '1:364894055848:android:bc3b183480de2c5cd2819d',
    messagingSenderId: '364894055848',
    projectId: 'nerulendingsoftware-7d3d1',
    storageBucket: 'nerulendingsoftware-7d3d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSagaj77kP4AKK4P2bAaq00Gpd9dENDc4',
    appId: '1:364894055848:ios:6957ff0c788d033ad2819d',
    messagingSenderId: '364894055848',
    projectId: 'nerulendingsoftware-7d3d1',
    storageBucket: 'nerulendingsoftware-7d3d1.appspot.com',
    iosBundleId: 'com.example.nerulendings',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSagaj77kP4AKK4P2bAaq00Gpd9dENDc4',
    appId: '1:364894055848:ios:6957ff0c788d033ad2819d',
    messagingSenderId: '364894055848',
    projectId: 'nerulendingsoftware-7d3d1',
    storageBucket: 'nerulendingsoftware-7d3d1.appspot.com',
    iosBundleId: 'com.example.nerulendings',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyANSMOUOLTuaaf8XA6e8zBzfV9WNbhlUbI',
    appId: '1:364894055848:web:98614761f7f88033d2819d',
    messagingSenderId: '364894055848',
    projectId: 'nerulendingsoftware-7d3d1',
    authDomain: 'nerulendingsoftware-7d3d1.firebaseapp.com',
    storageBucket: 'nerulendingsoftware-7d3d1.appspot.com',
    measurementId: 'G-QCFYY0KRF8',
  );
}
