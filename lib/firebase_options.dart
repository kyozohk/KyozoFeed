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
      apiKey: "AIzaSyBn0nbZ1XQsxkiD9Cefj_FTGNpK3VhTpMY",
      authDomain: "kyozoverse.firebaseapp.com",
      projectId: "kyozoverse",
      storageBucket: "kyozoverse.firebasestorage.app",
      messagingSenderId: "1061297794599",
      appId: "1:1061297794599:web:23a0dd107dc36cff44a802",
      measurementId: "G-33S7RT90CJ"
    );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyCb8qVZuZX3v6dGOcbOK8XZP7mz0xVZZSs",
      authDomain: "kyozoverse.firebaseapp.com",
      projectId: "kyozoverse",
      storageBucket: "kyozoverse.firebasestorage.app",
      messagingSenderId: "1061297794599",
      appId: "1:1061297794599:android:8a651e78d1aea24f44a802",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCxhuYBAHRaD62jOShsLa_zLFkienl4dlA",
    authDomain: "kyozoverse.firebaseapp.com",
    projectId: "kyozoverse",
    storageBucket: "kyozoverse.firebasestorage.app",
    messagingSenderId: "1061297794599",
    appId: "1:1061297794599:ios:1d096be4933c197d44a802",
    iosBundleId: 'com.kyozo.kyozoFeed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyCxhuYBAHRaD62jOShsLa_zLFkienl4dlA",
    authDomain: "kyozoverse.firebaseapp.com",
    projectId: "kyozoverse",
    storageBucket: "kyozoverse.firebasestorage.app",
    messagingSenderId: "1061297794599",
    appId: "1:1061297794599:ios:1d096be4933c197d44a802",
    iosBundleId: 'com.kyozo.kyozoFeed',
  );
}
