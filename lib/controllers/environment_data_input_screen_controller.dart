import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EnvironmentDataInputScreenController extends GetxController{
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController salinityController = TextEditingController();
  final TextEditingController transparencyController = TextEditingController();
  final TextEditingController oxygenController = TextEditingController();
  final TextEditingController phController = TextEditingController();

  @override
  void onClose() {
    temperatureController.dispose();
    salinityController.dispose();
    transparencyController.dispose();
    oxygenController.dispose();
    phController.dispose();
    super.onClose();
  }

  void submitData(){
    print('Temperature: ${temperatureController.text}');
    print('Salinity: ${salinityController.text}');
    print('Transparency: ${transparencyController.text}');
    print('Oxygen: ${oxygenController.text}');
    print('PH: ${phController.text}');
  }
}