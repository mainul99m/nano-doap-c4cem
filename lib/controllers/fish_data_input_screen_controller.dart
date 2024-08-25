import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nano_doap_c4cem/utils/custom_message.dart';
import 'package:nano_doap_c4cem/views/select_fish_list_screen.dart';

class FishDataInputScreenController extends GetxController {

  var selectedFish = "".obs;
  var imagePath = "".obs;
  var currentPageIndex = 0.obs;

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
    String? res = await Get.to(()=> SelectFishListScreen());
    print(res);
    if(res != null){
      selectedFish.value = res;
    } else {
      selectedFish.value = "";
    }
  }

  void cameraButtonPressed() async{
    try{
      XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image != null){
        imagePath.value = image.path;
      }
    } catch(e){
      CustomMessage.showErrorMessage(
          title: "Camera Error",
          message: "An error occurred while taking the photo"
      );
    }
  }


}