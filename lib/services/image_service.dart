import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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

  static Future<String> saveImage(File imageFile) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final filePath = appDirectory.path + '/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await imageFile.copy(filePath);
    return filePath;
  }

  Future<void> deleteImageFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      } else {
        print('Image file not found: $filePath');
      }
    } catch (error) {
      print('Error deleting image file: $error');
    }
  }
}