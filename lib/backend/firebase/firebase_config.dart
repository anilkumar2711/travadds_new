import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCePoG6fYS4V2jHPxab_GjEtRyH9LGQng0",
            authDomain: "travadds-39c38.firebaseapp.com",
            projectId: "travadds-39c38",
            storageBucket: "travadds-39c38.appspot.com",
            messagingSenderId: "321645917427",
            appId: "1:321645917427:web:ab32875bd5fe2dfef47386"));
  } else {
    await Firebase.initializeApp();
  }
}
