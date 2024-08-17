import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nano_doap_c4cem/views/fish_list_screen.dart';

class FishDataInputScreenController extends GetxController {

  var selectedFish = "".obs;
  Position? currentLocation;


  /// text editing controller
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController fishingTimeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    requestLocation();
  }

  @override
  void onClose() {
    weightController.dispose();
    lengthController.dispose();
    fishingTimeController.dispose();
    super.onClose();
  }

  void requestLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();
  }

  void selectFishTFPressed() async{
    print('SelectFish Tapped');
    String? res = await Get.to(()=> FishListScreen());
    print(res);
    if(res != null){
      selectedFish.value = res;
    } else {
      selectedFish.value = "";
    }
  }

}