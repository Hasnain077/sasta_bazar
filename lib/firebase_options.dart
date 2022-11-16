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
    apiKey: 'AIzaSyCg287A1jnPx9XGeIWK-pu0DgJSVdxtCsQ',
    appId: '1:300961557281:web:b077352de881b74576ac60',
    messagingSenderId: '300961557281',
    projectId: 'sasta-bazar-d6857',
    authDomain: 'sasta-bazar-d6857.firebaseapp.com',
    storageBucket: 'sasta-bazar-d6857.appspot.com',
    measurementId: 'G-1WSF905LP7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLmpE-XCYG1pLg3tSRMEIV0j0oDm9kod4',
    appId: '1:300961557281:android:f1946beadb6afabe76ac60',
    messagingSenderId: '300961557281',
    projectId: 'sasta-bazar-d6857',
    storageBucket: 'sasta-bazar-d6857.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlKonBeWE4t-MCA3yYwT8tbJ7vKdw7Lg4',
    appId: '1:300961557281:ios:e682fe29b19bb2b076ac60',
    messagingSenderId: '300961557281',
    projectId: 'sasta-bazar-d6857',
    storageBucket: 'sasta-bazar-d6857.appspot.com',
    iosClientId: '300961557281-uact49ks7mpmklq6b8qpvcl9i3h9clpd.apps.googleusercontent.com',
    iosBundleId: 'sastabazar.com.adminSastaBazar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlKonBeWE4t-MCA3yYwT8tbJ7vKdw7Lg4',
    appId: '1:300961557281:ios:e682fe29b19bb2b076ac60',
    messagingSenderId: '300961557281',
    projectId: 'sasta-bazar-d6857',
    storageBucket: 'sasta-bazar-d6857.appspot.com',
    iosClientId: '300961557281-uact49ks7mpmklq6b8qpvcl9i3h9clpd.apps.googleusercontent.com',
    iosBundleId: 'sastabazar.com.adminSastaBazar',
  );
}
