import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'View/Screens/Appbar_navigations/profile_screen.dart';
import 'View/Screens/Home_Screen.dart';
import 'View/Screens/SignUpLogin/Login_Screen.dart';
import 'View/Screens/SignUpLogin/Signup-screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAqfX6DSAr-PbVCIuVByDKh4WJO_J3QSZ8",
          appId:"shopsie-407c0",
          messagingSenderId: "153617503886",
          projectId: "153617503886"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
