import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNyUZqUK_uu2KoZA_dUMSdnoIS5IyVUro",
            authDomain: "movie-bingo.firebaseapp.com",
            projectId: "movie-bingo",
            storageBucket: "movie-bingo.appspot.com",
            messagingSenderId: "188304975040",
            appId: "1:188304975040:web:f47052c3c0d2ab7557b925",
            measurementId: "G-WCS9T0CGPN"));
  } else {
    await Firebase.initializeApp();
  }
}
