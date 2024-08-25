import 'package:image_picker/image_picker.dart';

class ImageService {
  static Future<String?> getImagePathFromCamera() async {

    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if(image != null){
      return image.path;
    }
    return null;
  }

  static Future<String?> saveImageAsFile(String path) async {
    return path;
  }

  static Future<bool> deleteImage(String path) async {
    return true;
  }
}