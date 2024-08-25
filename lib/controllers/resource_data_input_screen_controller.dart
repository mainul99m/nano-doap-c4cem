import 'package:get/get.dart';

import '../services/image_service.dart';
import '../utils/custom_message.dart';

class ResourceDataInputScreenController extends GetxController {
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
}