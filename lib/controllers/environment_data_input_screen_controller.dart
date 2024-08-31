import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nano_doap_c4cem/models/environment_upload_model.dart';

import '../main.dart';
import '../utils/shared_prefs_constants.dart';

class EnvironmentDataInputScreenController extends GetxController{
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController salinityController = TextEditingController();
  final TextEditingController transparencyController = TextEditingController();
  final TextEditingController oxygenController = TextEditingController();
  final TextEditingController phController = TextEditingController();

  final _environmentBox = Hive.box(SharedPrefsConstants.ENVIRONMENT_BOX);

  Position? currentLocation;
  var coordinates = [0.0, 0.0];

  var isBusy = false.obs;

  @override
  void onInit() {
    requestLocation();
    super.onInit();
  }


  void requestLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();
    if(currentLocation != null){
      print("coordinate updated");
      coordinates = [currentLocation!.longitude, currentLocation!.latitude];
    }
  }


  @override
  void onClose() {
    temperatureController.dispose();
    salinityController.dispose();
    transparencyController.dispose();
    oxygenController.dispose();
    phController.dispose();
    super.onClose();
  }

  void submitData() async{
    isBusy.value = true;
    final String country = sharedPrefs.getString(SharedPrefsConstants.USER_COUNTRY) ?? "N/A";
    final String updatedBy = sharedPrefs.getString(SharedPrefsConstants.USER_NAME) ?? "N/A";

    final double temperature = double.parse(temperatureController.text);
    final double salinity = double.parse(salinityController.text);
    final double transparency = double.parse(transparencyController.text);
    final double oxygen = double.parse(oxygenController.text);
    final double ph = double.parse(phController.text);

    final environment = EnvironmentUploadModel(
      temperature: temperature,
      salinity: salinity,
      ph: ph,
      dissolvedOxygen: oxygen,
      transparency: transparency,
      updatedBy: updatedBy,
      createdAt: DateTime.now(),
      country: country,
      coordinates: coordinates
    );

    await _environmentBox.add(environmentUploadModelToJson(environment));
    print(_environmentBox.length);
    isBusy.value = false;
    Get.back();
  }
}