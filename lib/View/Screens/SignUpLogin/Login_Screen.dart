import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopsie/View/Screens/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Controller/Get_controller.dart';
import 'Signup-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       FirebaseAuth.instance.setLanguageCode('en'); // Set the locale to English, you can change it to your preferred locale
  //
  //       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: controller.Email.value.text.trim(),
  //         password: controller.Password.value.text.trim(),
  //       );
  //
  //       DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(userCredential.user!.uid)
  //           .get();
  //
  //       if (userDoc.exists) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Login Successful!')),
  //         );
  //         print("Navigation to Homescreen");
  //         Get.to(HomeScreen());
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('User data not found.')),
  //         );
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       setState(() {
  //         if (e.code == 'user-not-found') {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('No user found for that email.')),
  //           );
  //         } else if (e.code == 'wrong-password') {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('Wrong password provided.')),
  //           );
  //         } else {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('An unknown error occurred.')),
  //           );
  //         }
  //         print(e.code);
  //       });
  //     } catch (e) {
  //       setState(() {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('An error occurred. Please try again.')),
  //         );
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome back! Glad to see you , Again!",
                style: GoogleFonts.lato(
                  color: Color(0xff1E232C),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: controller.Email.value,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  fillColor: Colors.grey.withOpacity(0.12),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: GoogleFonts.lato(
                    color: Color(0xff8391A1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.Password.value,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  fillColor: Colors.grey.withOpacity(0.12),
                  filled: true,
                  suffixIcon: Icon(
                    CupertinoIcons.eye,
                    color: Colors.black.withOpacity(0.60),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: GoogleFonts.lato(
                    color: Color(0xff8391A1),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: Color(0xff5F6AFF),
                child: Text(
                  "Login",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                  ),
                ),
                onPressed:(){
                  Get.to(HomeScreen());
                },
              ),
              SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: Get.height / 30,
                        width: Get.width / 4,
                        color: Colors.white,
                        child: Text(
                          "or Login With",
                          style: GoogleFonts.lato(
                            color: Color(0xff6A707C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height / 15,
                    width: Get.width / 2.4,
                    child: Icon(
                      size: 37,
                      FontAwesomeIcons.facebookF,
                      color: Colors.blue,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.10),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Container(
                    height: Get.height / 15,
                    width: Get.width / 2.4,
                    child: Image.network(
                      "http://pngimg.com/uploads/google/google_PNG19635.png",
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.10),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 16),
                  ),
                  TextButton(
                    child: Text(
                      "Register Now",
                      style: GoogleFonts.lato(
                        color: Color(0xff5F6AFF),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Get.to(SignUp());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
