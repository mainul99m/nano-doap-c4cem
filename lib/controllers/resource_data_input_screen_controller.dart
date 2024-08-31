import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nano_doap_c4cem/models/resource_upload_model.dart';
import '../main.dart';
import '../services/image_service.dart';
import '../utils/custom_message.dart';
import '../utils/shared_prefs_constants.dart';

class ResourceDataInputScreenController extends GetxController {
  var imagePath = "".obs;
  var isBusy = false.obs;


  final TextEditingController resourceTypeController = TextEditingController();
  final _resourceBox = Hive.box(SharedPrefsConstants.RESOURCES_BOX);

  Position? currentLocation;
  var coordinates = [0.0, 0.0];

  @override
  void onInit() {
    super.onInit();
    requestLocation();
  }

  @override
  void onClose() {
    resourceTypeController.dispose();
    super.onClose();
  }

  void requestLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();
    if(currentLocation != null){
      print("coordinate updated");
      coordinates = [currentLocation!.longitude, currentLocation!.latitude];
    }
  }


  void submitBtnPressed() async {
    isBusy.value = true;
    String name = resourceTypeController.text;
    if(name.isEmpty){
      CustomMessage.showErrorMessage(
          title: "Resource Type Error",
          message: "Resource Type cannot be empty"
      );
      isBusy.value = false;
      return;
    }


    String savedLocation = await ImageService.saveImage(File(imagePath.value));
    final String country = sharedPrefs.getString(SharedPrefsConstants.USER_COUNTRY) ?? "N/A";
    final String updatedBy = sharedPrefs.getString(SharedPrefsConstants.USER_NAME) ?? "N/A";

    final resource = ResourceUploadModel(
      name: name,
      imageUrl: savedLocation,
      country: country,
      updatedBy: updatedBy,
      createdAt: DateTime.now(),
      coordinates: coordinates
    );

    await _resourceBox.add(resourceUploadModelToJson(resource));
    print(_resourceBox.length);
    isBusy.value = false;
    Get.back();

  }


  void cameraButtonPressed() async{
    try{
      ImageService.getImagePathFromCamera().then((value) {
        if(value != null){
          imagePath.value = value;
        }
      });
    } catch(e){
      CustomMessage.showErrorMessage(
          title: "Camera Error",
          message: "An error occurred while taking the photo"
      );
    }
  }
}