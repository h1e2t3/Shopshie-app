import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopsie/Controller/Get_controller.dart';
import 'package:shopsie/View/Screens/Home_Screen.dart';
import 'Login_Screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'name': firstNameController.text.trim(),
          'lastname': lastNameController.text.trim(),
          'password': passwordController.text.trim(), // Storing plain passwords is not recommended.
          'email': emailController.text.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup Successful!')));
        print("Navigation to Homescreen");
        Get.to(HomeScreen());
      } on FirebaseAuthException catch (e) {
        setState(() {
          if (e.code == 'weak-password') {
            _errorMessage = 'The password provided is too weak.';
          } else if (e.code == 'email-already-in-use') {
            _errorMessage = 'The account already exists for that email.';
            print(e.code);
          } else {
            _errorMessage = 'An unknown error occurred.';
            print(e.code);
          }
        });
      } catch (e) {
        setState(() {
          _errorMessage = 'An error occurred. Please try again.';
        });
      }
    }
  }

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
                "Hello! Register to get started",
                style: GoogleFonts.lato(
                  color: Color(0xff1E232C),
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: "First Name",
                  fillColor: Colors.grey.withOpacity(0.12),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: GoogleFonts.lato(color: Color(0xff8391A1)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: "Last Name",
                  fillColor: Colors.grey.withOpacity(0.12),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: GoogleFonts.lato(color: Color(0xff8391A1)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.grey.withOpacity(0.12),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: GoogleFonts.lato(color: Color(0xff8391A1)),
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
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.grey.withOpacity(0.12),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: GoogleFonts.lato(color: Color(0xff8391A1)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 40),
              CupertinoButton(
                color: Color(0xff5F6AFF),
                child: Text(
                  "Register",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onPressed: _signUp,
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
                          style: GoogleFonts.lato(color: Color(0xff6A707C)),
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
                      border: Border.all(color: Colors.black.withOpacity(0.10)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Container(
                    height: Get.height / 15,
                    width: Get.width / 2.4,
                    child: Image.network("http://pngimg.com/uploads/google/google_PNG19635.png"),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.10)),
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
                    "Already have an account?  ",
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 16),
                  ),
                  TextButton(
                    child: Text(
                      "Login Now",
                      style: GoogleFonts.lato(color: Color(0xff5F6AFF), fontSize: 16),
                    ),
                    onPressed: () {
                      Get.to(LoginScreen());
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
