import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/custom_message.dart';

class PlanktonDataInputScreenController extends GetxController{
  final TextEditingController numberOfPlanktonController = TextEditingController();

  var imagePath = "".obs;

  @override
  void onClose() {
    numberOfPlanktonController.dispose();
    super.onClose();
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