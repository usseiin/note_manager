import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDacXwJdGEirhmb99cISXUkH88DByqT2-g",
            authDomain: "noteskeeper-rge.firebaseapp.com",
            projectId: "noteskeeper-rge",
            storageBucket: "noteskeeper-rge.appspot.com",
            messagingSenderId: "445074585046",
            appId: "1:445074585046:web:f5bbd690cfe958c400a077"));
  } else {
    await Firebase.initializeApp();
  }
}
