import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:nano_doap_c4cem/utils/shared_prefs_constants.dart';
import 'package:path_provider/path_provider.dart';
import '../main.dart';
import '../models/image_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';
import '../utils/api_endpoint.dart';

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


  static Future<void> deleteImageFile(String filePath) async {
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



  static Future<String?> postImage(String imagePath) async {
    final imageExt = imagePath.split('.').last;
    final endpoint = ApiEndpoint.imageUrl + 'post';
    // final token = sharedPrefs.get(SharedPrefsConstants.TOKEN);
    final username = sharedPrefs.getString(SharedPrefsConstants.USER_ID);

    final imageName = '$username-${DateTime.now().millisecondsSinceEpoch}.$imageExt';

    var mediaType = MediaType('image', imageExt);

    final image = File(imagePath);

    var stream = new http.ByteStream(image.openRead());
    stream.cast();

    var length = await image.length();

    var url = Uri.parse(endpoint);
    var request = http.MultipartRequest('POST', url);

    var multipart = http.MultipartFile(
        'image', stream, length,
        filename: imageName,
        contentType: mediaType
    );

    request.files.add(multipart);
    // request.headers['Authorization'] = 'Bearer $token';

    var response = await request.send();

    if(response.statusCode == 200){
      final responseByteArray = await response.stream.toBytes();
      var jsonResponse = json.decode(utf8.decode(responseByteArray));

      var imageRes = ImageResponse.fromJson(jsonResponse);
      if(imageRes.status == "success") {
        print("image uploaded");
        return imageRes.key;
      } else {
        return null;
      }
    }else{
      return null;
    }
  }
}