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
    apiKey: 'AIzaSyCjIPRSQTNZW0aw7vxoECHiEZewstIN_LY',
    appId: '1:1051250058842:web:05e771e9e7cf1688ae5a63',
    messagingSenderId: '1051250058842',
    projectId: 'newsly-3bb76',
    authDomain: 'newsly-3bb76.firebaseapp.com',
    storageBucket: 'newsly-3bb76.firebasestorage.app',
    measurementId: 'G-B1VSK9W3FZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtQ9BAT05rbRyoH50wuOwhUTGymGFPleE',
    appId: '1:1051250058842:android:d472d0280aa56f32ae5a63',
    messagingSenderId: '1051250058842',
    projectId: 'newsly-3bb76',
    storageBucket: 'newsly-3bb76.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeXhE66jtTn-ZDiHQAfJRUIsz_741l2Ag',
    appId: '1:1051250058842:ios:9f4e9fea2c797e1cae5a63',
    messagingSenderId: '1051250058842',
    projectId: 'newsly-3bb76',
    storageBucket: 'newsly-3bb76.firebasestorage.app',
    iosBundleId: 'com.example.newaletterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeXhE66jtTn-ZDiHQAfJRUIsz_741l2Ag',
    appId: '1:1051250058842:ios:9f4e9fea2c797e1cae5a63',
    messagingSenderId: '1051250058842',
    projectId: 'newsly-3bb76',
    storageBucket: 'newsly-3bb76.firebasestorage.app',
    iosBundleId: 'com.example.newaletterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCjIPRSQTNZW0aw7vxoECHiEZewstIN_LY',
    appId: '1:1051250058842:web:5efdc05ae8c624b4ae5a63',
    messagingSenderId: '1051250058842',
    projectId: 'newsly-3bb76',
    authDomain: 'newsly-3bb76.firebaseapp.com',
    storageBucket: 'newsly-3bb76.firebasestorage.app',
    measurementId: 'G-YE4FFDE5SM',
  );
}
