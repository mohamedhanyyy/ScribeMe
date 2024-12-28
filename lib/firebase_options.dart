import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCG1UypOrBhBAVilZQR2etV-hnynAzpPqo',
    appId: '1:75952330083:android:f560f3530e15828aaeaf56',
    messagingSenderId: '75952330083',
    projectId: 'subcribeme-e5867',
    storageBucket: 'subcribeme-e5867.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCG1UypOrBhBAVilZQR2etV-hnynAzpPqo',
    appId: '1:75952330083:ios:00001d1bec6f6372aeaf56',
    messagingSenderId: '75952330083',
    projectId: 'subcribeme-e5867',
    storageBucket: 'subcribeme-e5867.firebasestorage.app',
    iosBundleId: 'com.scribeme.scribeapp',
  );
}
