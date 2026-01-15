import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBXkILagSDixPTM6XfeETu3kXZmn-X7d9s',
    appId: '1:34867834071:web:499afc7dfe2cceff189492',
    messagingSenderId: '34867834071',
    projectId: 'pawme-be065',
    authDomain: 'pawme-be065.firebaseapp.com',
    storageBucket: 'pawme-be065.firebasestorage.app',
    measurementId: 'G-XFDG1M73W9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXkILagSDixPTM6XfeETu3kXZmn-X7d9s',
    appId: '1:34867834071:android:499afc7dfe2cceff189492',
    messagingSenderId: '34867834071',
    projectId: 'pawme-be065',
    storageBucket: 'pawme-be065.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXkILagSDixPTM6XfeETu3kXZmn-X7d9s',
    appId: '1:34867834071:ios:499afc7dfe2cceff189492',
    messagingSenderId: '34867834071',
    projectId: 'pawme-be065',
    storageBucket: 'pawme-be065.firebasestorage.app',
    iosBundleId: 'com.kyozo.kyozoFeed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXkILagSDixPTM6XfeETu3kXZmn-X7d9s',
    appId: '1:34867834071:ios:499afc7dfe2cceff189492',
    messagingSenderId: '34867834071',
    projectId: 'pawme-be065',
    storageBucket: 'pawme-be065.firebasestorage.app',
    iosBundleId: 'com.kyozo.kyozoFeed',
  );
}
