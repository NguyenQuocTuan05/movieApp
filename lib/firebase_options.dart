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
    apiKey: 'AIzaSyDm9JNuKYk7gFw3C0Z3wO2i2wwOYp9GXVM',
    appId: '1:331809086433:web:44554ea6a95ea731ba50a0',
    messagingSenderId: '331809086433',
    projectId: 'movieapp-dae39',
    authDomain: 'movieapp-dae39.firebaseapp.com',
    storageBucket: 'movieapp-dae39.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApSUIvomQdAhqPLcts6m9KuMKcDxpClV4',
    appId: '1:331809086433:android:7e0f74bc8b3c0ee9ba50a0',
    messagingSenderId: '331809086433',
    projectId: 'movieapp-dae39',
    storageBucket: 'movieapp-dae39.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtTulQU4KLb5svJiY8QnOdcSeMLww3_bI',
    appId: '1:331809086433:ios:3cec1524ed56a83cba50a0',
    messagingSenderId: '331809086433',
    projectId: 'movieapp-dae39',
    storageBucket: 'movieapp-dae39.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtTulQU4KLb5svJiY8QnOdcSeMLww3_bI',
    appId: '1:331809086433:ios:3cec1524ed56a83cba50a0',
    messagingSenderId: '331809086433',
    projectId: 'movieapp-dae39',
    storageBucket: 'movieapp-dae39.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDm9JNuKYk7gFw3C0Z3wO2i2wwOYp9GXVM',
    appId: '1:331809086433:web:b64cb14346b4562dba50a0',
    messagingSenderId: '331809086433',
    projectId: 'movieapp-dae39',
    authDomain: 'movieapp-dae39.firebaseapp.com',
    storageBucket: 'movieapp-dae39.firebasestorage.app',
  );
}
