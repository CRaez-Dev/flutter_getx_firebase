// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['ANDROID_apiKey']!,
    appId: dotenv.env['ANDROID_appId']!,
    messagingSenderId: dotenv.env['ANDROID_messagingSenderId']!,
    projectId: dotenv.env['ANDROID_projectId']!,
    storageBucket: dotenv.env['ANDROID_storageBucket']!,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['IOS_apiKey']!,
    appId: dotenv.env['IOS_appId']!,
    messagingSenderId: dotenv.env['IOS_messagingSenderId']!,
    projectId: dotenv.env['IOS_projectId']!,
    storageBucket: dotenv.env['IOS_storageBucket']!,
    iosBundleId: dotenv.env['IOS_iosBundleId']!,
  );
}
