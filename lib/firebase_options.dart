import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASvoiAu2X2-C-uMSKChK2UD7LDuXh5aEs',
    appId: '1:365058967814:android:aaa2c8582fb6a9269a7687',
    messagingSenderId: '365058967814',
    projectId: 'eshop-2210d',
    databaseURL: 'https://eshop-2210d.firebaseio.com',
    storageBucket: 'eshop-2210d.appspot.com',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAL5fpg6ptmwGRWlGTC9kI6_dqxuKqChZc',
    appId: '1:365058967814:ios:3cbab6f4955b17d69a7687',
    messagingSenderId: '365058967814',
    projectId: 'eshop-2210d',
    databaseURL: 'https://eshop-2210d.firebaseio.com',
    storageBucket: 'eshop-2210d.appspot.com',
    androidClientId:
        '365058967814-0ui2rsgofdu5fioj0e7uoapco13g6i6k.apps.googleusercontent.com',
    iosClientId:
        '365058967814-6nrkjtfh0u9b3dgqvep9k70q1ncennak.apps.googleusercontent.com',
    iosBundleId: 'com.wrteam.eshop',
  );
}
