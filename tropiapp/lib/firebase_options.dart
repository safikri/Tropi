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
    apiKey: 'AIzaSyCIQLxpEfZmZDwfa-QqDXFTEmWCz6aS6Fk',
    appId: '1:853544998176:web:dd4894a590780ce0927345',
    messagingSenderId: '853544998176',
    projectId: 'tropiapp-jaggo',
    authDomain: 'tropiapp-jaggo.firebaseapp.com',
    storageBucket: 'tropiapp-jaggo.appspot.com',
    measurementId: 'G-4K05WZJMMM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsKUB8kC--khwAAjFzPhCcBIcNWReFgIE',
    appId: '1:853544998176:android:714267ff404af4ed927345',
    messagingSenderId: '853544998176',
    projectId: 'tropiapp-jaggo',
    storageBucket: 'tropiapp-jaggo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVQDLXGIWf-GnjUG3GqXlD2LumYe1247s',
    appId: '1:853544998176:ios:9248f5dfab105344927345',
    messagingSenderId: '853544998176',
    projectId: 'tropiapp-jaggo',
    storageBucket: 'tropiapp-jaggo.appspot.com',
    androidClientId: '853544998176-hfo392lu4brigmnbqvku05a36hhoeotb.apps.googleusercontent.com',
    iosClientId: '853544998176-07pft2bi3ok223inec99nm52k6idk3dj.apps.googleusercontent.com',
    iosBundleId: 'com.jaggo.tropiapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVQDLXGIWf-GnjUG3GqXlD2LumYe1247s',
    appId: '1:853544998176:ios:9248f5dfab105344927345',
    messagingSenderId: '853544998176',
    projectId: 'tropiapp-jaggo',
    storageBucket: 'tropiapp-jaggo.appspot.com',
    androidClientId: '853544998176-hfo392lu4brigmnbqvku05a36hhoeotb.apps.googleusercontent.com',
    iosClientId: '853544998176-07pft2bi3ok223inec99nm52k6idk3dj.apps.googleusercontent.com',
    iosBundleId: 'com.jaggo.tropiapp',
  );
}
