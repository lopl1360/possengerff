import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDtQ6sma5iBMUT1tJcLJAeFe2MIChRlC2E",
            authDomain: "possenger-dev.firebaseapp.com",
            projectId: "possenger-dev",
            storageBucket: "possenger-dev.appspot.com",
            messagingSenderId: "213528841856",
            appId: "1:213528841856:web:0e32ae8e2fc00edbfce065",
            measurementId: "G-MJF7DE6477"));
  } else {
    await Firebase.initializeApp();
  }
}
