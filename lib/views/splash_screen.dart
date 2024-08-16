import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreenController controller = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'NANO-DOAP C4CEM Splash Screen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent
            ),
        ),
      ),
    );
  }
}
