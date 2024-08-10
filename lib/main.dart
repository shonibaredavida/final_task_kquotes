import 'package:final_task_kquotes/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      /*  options: FirebaseOptions(
          apiKey: "AIzaSyA3RH_ainaNXxQ2RA48Cu2x_OtQr2qQBKs",
          authDomain: "kquotes-4d7d8.firebaseapp.com",
          projectId: "kquotes-4d7d8",
          storageBucket: "kquotes-4d7d8.appspot.com",
          messagingSenderId: "279421399084",
          appId: "1:279421399084:web:3c627415f52d31f7552189") */
      );
  runApp(const MyApp());
}
