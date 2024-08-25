import 'package:get/get.dart';
import 'package:nano_doap_c4cem/services/image_service.dart';

import '../utils/custom_message.dart';

class PlasticDataInputScreenController extends GetxController{
  var imagePath = "".obs;


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

  void submitButtonPressed() {

  }
}