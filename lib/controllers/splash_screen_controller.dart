import 'package:get/get.dart';
import 'package:nano_doap_c4cem/main.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:nano_doap_c4cem/views/home_screen.dart';
import 'package:nano_doap_c4cem/views/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      if(sharedPrefs.getString(SharedPrefsConstants.ACCESS_TOKEN)!= null){
        Get.offAll(()=>HomeScreen());
      }
      else {
        Get.offAll(()=>LoginScreen());
      }
    });
  }
}