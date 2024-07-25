import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Shopsie",
              style: GoogleFonts.playfairDisplay(
                color: Color(0xff5F6AFF),
                fontSize: 65,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "The best way to style your life.",
              style: GoogleFonts.lato(
                color: Color(0xff7E7B77),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
