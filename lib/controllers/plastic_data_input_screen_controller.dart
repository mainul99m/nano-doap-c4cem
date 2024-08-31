import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nano_doap_c4cem/models/plastic_upload_model.dart';
import 'package:nano_doap_c4cem/services/image_service.dart';

import '../main.dart';
import '../utils/custom_message.dart';
import '../utils/shared_prefs_constants.dart';

class PlasticDataInputScreenController extends GetxController{
  var imagePath = "".obs;
  var isBusy = false.obs;

  Position? currentLocation;
  var coordinates = [0.0, 0.0];

  final _plasticBox = Hive.box(SharedPrefsConstants.PLASTIC_BOX);

  @override
  void onInit() {
    super.onInit();
    requestLocation();
  }

  void requestLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();
    if(currentLocation != null){
      print("coordinate updated");
      coordinates = [currentLocation!.longitude, currentLocation!.latitude];
    }
  }

  void submitButtonPressed() async{
    isBusy.value = true;

    String savedLocation = await ImageService.saveImage(File(imagePath.value));
    final String country = sharedPrefs.getString(SharedPrefsConstants.USER_COUNTRY) ?? "N/A";
    final String updatedBy = sharedPrefs.getString(SharedPrefsConstants.USER_NAME) ?? "N/A";

    final plastic = PlasticUploadModel(
        imageUrl: savedLocation,
        country: country,
        updatedBy: updatedBy,
        createdAt: DateTime.now(),
        coordinates: coordinates
    );

    await _plasticBox.add(plasticUploadModelToJson(plastic));
    print(_plasticBox.length);

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