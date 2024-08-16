import 'package:get/get.dart';
import 'package:nano_doap_c4cem/views/home_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(()=>HomeScreen());
    });
  }
}