import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nano_doap_c4cem/models/plankton_upload_model.dart';
import '../main.dart';
import '../services/image_service.dart';
import '../utils/custom_message.dart';
import '../utils/shared_prefs_constants.dart';

class PlanktonDataInputScreenController extends GetxController{
  final TextEditingController numberOfPlanktonController = TextEditingController();

  final _planktonBox = Hive.box(SharedPrefsConstants.PLANKTON_BOX);

  Position? currentLocation;
  var coordinates = [0.0, 0.0];

  var imagePath = "".obs;
  var isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    requestLocation();
  }

  @override
  void onClose() {
    numberOfPlanktonController.dispose();
    super.onClose();
  }

  void requestLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();
    if(currentLocation != null){
      print("coordinate updated");
      coordinates = [currentLocation!.longitude, currentLocation!.latitude];
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

  void submitBtnPressed() async {
    isBusy.value = true;
    var numberOfPlankton = int.parse(numberOfPlanktonController.text);
    String savedLocation = await ImageService.saveImage(File(imagePath.value));
    final String country = sharedPrefs.getString(SharedPrefsConstants.USER_COUNTRY) ?? "N/A";
    final String updatedBy = sharedPrefs.getString(SharedPrefsConstants.USER_NAME) ?? "N/A";

    final plankton = PlanktonUploadModel(
        imageUrl: savedLocation,
        count: numberOfPlankton,
        country: country,
        updatedBy: updatedBy,
        coordinates: coordinates,
        createdAt: DateTime.now()
    );

    await _planktonBox.add(planktonUploadModelToJson(plankton));
    print(_planktonBox.length);
    isBusy.value = false;
    Get.back();
  }
}