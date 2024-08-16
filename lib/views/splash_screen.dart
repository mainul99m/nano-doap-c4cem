import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nano_doap_c4cem/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreenController controller = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/common/logo_t.png', fit: BoxFit.contain, height: 150, width: 150),
                Image.asset('assets/common/logo_nano_doap_white.jpg', fit: BoxFit.contain, height: 100, width: 270),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Text(
              'version 2.0',
              style: GoogleFonts.fredoka(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
