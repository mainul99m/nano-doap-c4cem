import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nano_doap_c4cem/main.dart';
import 'package:nano_doap_c4cem/models/fish_upload_model.dart';
import 'package:nano_doap_c4cem/services/image_service.dart';
import 'package:nano_doap_c4cem/utils/custom_message.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:nano_doap_c4cem/views/select_fish_list_screen.dart';

class FishDataInputScreenController extends GetxController {

  var selectedFish = "".obs;
  var imagePath = "".obs;
  var currentPageIndex = 0.obs;
  var isBusy = false.obs;

  Position? currentLocation;


  /// text editing controller
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController fishingTimeController = TextEditingController();

  // Hive fish box
  final _fishBox = Hive.box(SharedPrefsConstants.FISH_BOX);

  var coordinates = [0.0, 0.0];

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
    if(currentLocation != null){
      coordinates = [currentLocation!.longitude, currentLocation!.latitude];
    }
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

  void submitBtnPressed() async{
    isBusy.value = true;
    if(selectedFish.value.isEmpty){
      CustomMessage.showErrorMessage(
          title: "Fish not selected",
          message: "Please select a fish"
      );
      isBusy.value = false;
      return;
    }
    String savedLocation = await ImageService.saveImage(File(imagePath.value));
    final String? country = sharedPrefs.getString(SharedPrefsConstants.USER_COUNTRY);
    final String updatedBy = sharedPrefs.getString(SharedPrefsConstants.USER_NAME) ?? "N/A";

    print(lengthController.text);
    print(weightController.text);

    final FishUploadModel fishData = FishUploadModel(
      name: selectedFish.value,
      imageUrl: savedLocation,
      length: double.parse(lengthController.text) ?? 0.0,
      weight: double.parse(weightController.text) ?? 0.0,
      country: country ?? "N/A",
      updatedBy: updatedBy,
      coordinates: coordinates,
      createdAt: DateTime.now()
    );
    print(fishUploadModelToJson(fishData));
    await _fishBox.add(fishUploadModelToJson(fishData));
    print(_fishBox.length);
    isBusy.value = false;
    Get.back();
  }


}