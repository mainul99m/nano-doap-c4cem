import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var isLocationServiceEnabled = true.obs;
  @override
  void onInit() {
    super.onInit();
    isLocationServiceEnabled.value = false;
  }
}