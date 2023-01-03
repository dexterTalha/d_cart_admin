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
    apiKey: 'AIzaSyAFDdm0zJIkFF8pb_KbGzntcvYgAeYh0do',
    appId: '1:870921369118:web:ea1ba9ea9caf4c00dc600f',
    messagingSenderId: '870921369118',
    projectId: 'dcartapps',
    authDomain: 'dcartapps.firebaseapp.com',
    storageBucket: 'dcartapps.appspot.com',
    measurementId: 'G-MTJ5D54BSB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4OKlKNMROq45cjQWkktIaqw12jihhew0',
    appId: '1:870921369118:android:849b6e9cb463defedc600f',
    messagingSenderId: '870921369118',
    projectId: 'dcartapps',
    storageBucket: 'dcartapps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtLok9LCJhxEjm_l5D3oY98r5n_QqKrFk',
    appId: '1:870921369118:ios:d8d5947b42d2b9eedc600f',
    messagingSenderId: '870921369118',
    projectId: 'dcartapps',
    storageBucket: 'dcartapps.appspot.com',
    iosClientId: '870921369118-rg39bnc679thoi8v17rno1valtbuun3c.apps.googleusercontent.com',
    iosBundleId: 'com.dexter.dCartAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtLok9LCJhxEjm_l5D3oY98r5n_QqKrFk',
    appId: '1:870921369118:ios:d8d5947b42d2b9eedc600f',
    messagingSenderId: '870921369118',
    projectId: 'dcartapps',
    storageBucket: 'dcartapps.appspot.com',
    iosClientId: '870921369118-rg39bnc679thoi8v17rno1valtbuun3c.apps.googleusercontent.com',
    iosBundleId: 'com.dexter.dCartAdmin',
  );
}
