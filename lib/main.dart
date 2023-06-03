import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello/Screens/addproduct.dart';
import 'package:hello/Screens/all_productts.dart';
import 'package:hello/Screens/delete.dart';
import 'package:hello/Screens/homescreen.dart';
import 'package:hello/Screens/practiceFilePicker.dart';
import 'package:hello/Screens/signInNavBar.dart';
import 'package:hello/Screens/signup.dart';
import 'package:hello/Screens/unlogin.dart';
import 'package:hello/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
