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
    apiKey: 'AIzaSyATASS5KFvT6Oq2QHJATFXpo03-LNnuobo',
    appId: '1:850550164084:web:3400b8fba1924205229f21',
    messagingSenderId: '850550164084',
    projectId: 'ecommerce-flutter-web',
    authDomain: 'ecommerce-flutter-web.firebaseapp.com',
    storageBucket: 'ecommerce-flutter-web.firebasestorage.app',
    measurementId: 'G-SGNEJC3THG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9P0e0qg7cm8KaOQVtKGqT82Xu6c7xq00',
    appId: '1:850550164084:android:954aec800a3ff180229f21',
    messagingSenderId: '850550164084',
    projectId: 'ecommerce-flutter-web',
    storageBucket: 'ecommerce-flutter-web.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIEo0-alofpfUcaYwBSp_bg5VE-tw3bD8',
    appId: '1:850550164084:ios:6d69915b53fb938e229f21',
    messagingSenderId: '850550164084',
    projectId: 'ecommerce-flutter-web',
    storageBucket: 'ecommerce-flutter-web.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceFlutterWeb',
  );
}
