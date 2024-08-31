import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nano_doap_c4cem/models/fish_upload_model.dart';
import 'package:nano_doap_c4cem/models/image_response_model.dart';
import 'package:nano_doap_c4cem/models/login_response_model.dart';
import 'package:nano_doap_c4cem/models/plankton_upload_model.dart';
import 'package:nano_doap_c4cem/models/resource_upload_model.dart';
import 'package:nano_doap_c4cem/models/response_model.dart';
import 'package:nano_doap_c4cem/services/image_service.dart';
import 'package:nano_doap_c4cem/utils/custom_message.dart';
import '../main.dart';
import '../utils/api_endpoint.dart';
import '../utils/shared_prefs_constants.dart';

class RemoteService {

  static Future<LoginResponseModel?> login ({required String email, required String password}) async {
    final url = ApiEndpoint.baseUrl + ApiEndpoint.auth.login;

    print(url);

    final data = {
      'email': email,
      'password': password
    };

    try{
      print("trying to login");
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type'
          },
          body: jsonEncode(data)
      );
      print("Got response");
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 200){
        var jsonString = response.body;
        return loginResponseModelFromJson(jsonString);
      }else if(response.statusCode == 400 || response.statusCode == 401){
        CustomMessage.showErrorMessage(
            title: "Login Failed",
            message: "Email or Password is incorrect"
        );
      }
    } catch(error){
      print(error);
      CustomMessage.showErrorMessage(
          title: "Error",
          message: "Something went wrong. Please check your internet connection"
      );
      return null;
    }
  }


  static Future<bool> updateFishData({required FishUploadModel fish}) async{
    final endpoint = ApiEndpoint.baseUrl + ApiEndpoint.post.fish;

    try{
      String? imageLocation = await ImageService.postImage(fish.imageUrl);
      if(imageLocation != null){
        fish.imageUrl = "https://assets.c4cem.org/$imageLocation";
      }
      if(imageLocation == null){
        print("fish image upload failed");
        return false;
      }
    } catch(e){
      print("fish image upload failed");
      return false;
    }

    final token = sharedPrefs.getString(SharedPrefsConstants.ACCESS_TOKEN);
    var url = Uri.parse(endpoint);
    print(token);

    try{
      final data = fish.toJson();

      var response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Authorization' : 'Bearer $token'
          },
          body: jsonEncode(data)
      );

      if(response.statusCode == 201){
        return true;
      }else if(response.statusCode == 400){
        ResponseModel responseModel = responseModelFromJson(response.body);
        print(responseModel.message);
        return false;
      }else if(response.statusCode == 500){
        ResponseModel responseModel = responseModelFromJson(response.body);
        print(responseModel.message);
        return false;
      } else {
        print("something went wrong");
        return false;
      }
    } catch(e){
      CustomMessage.showErrorMessage(
          title: "Error",
          message: "Something went wrong. Please check your internet connection"
      );
      return false;
    }
    return false;
  }

  static Future<bool> updatePlanktonData({required PlanktonUploadModel plankton}) async{
    final endpoint = ApiEndpoint.baseUrl + ApiEndpoint.post.plankton;

    try{
      String? imageLocation = await ImageService.postImage(plankton.imageUrl);
      if(imageLocation != null){
        plankton.imageUrl = "https://assets.c4cem.org/$imageLocation";
      }
      if(imageLocation == null){
        print("Plankton image upload failed");
        return false;
      }
    } catch(e){
      print("Plankton image upload failed");
      return false;
    }

    final token = sharedPrefs.getString(SharedPrefsConstants.ACCESS_TOKEN);
    var url = Uri.parse(endpoint);
    print(token);

    try{
      final data = plankton.toJson();

      var response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Authorization' : 'Bearer $token'
          },
          body: jsonEncode(data)
      );

      if(response.statusCode == 201){
        return true;
      }else if(response.statusCode == 400){
        ResponseModel responseModel = responseModelFromJson(response.body);
        print(responseModel.message);
        return false;
      }else if(response.statusCode == 500){
        ResponseModel responseModel = responseModelFromJson(response.body);
        print(responseModel.message);
        return false;
      } else {
        print("something went wrong");
        return false;
      }
    } catch(e){
      CustomMessage.showErrorMessage(
          title: "Error",
          message: "Something went wrong. Please check your internet connection"
      );
      return false;
    }
    return false;
  }

  static Future<bool> updateResourceData({required ResourceUploadModel resource}) async{
    final endpoint = ApiEndpoint.baseUrl + ApiEndpoint.post.resource;

    try{
      String? imageLocation = await ImageService.postImage(resource.imageUrl);
      if(imageLocation != null){
        resource.imageUrl = "https://assets.c4cem.org/$imageLocation";
      }
      if(imageLocation == null){
        print("Resource image upload failed");
        return false;
      }
    } catch(e){
      print("Resource image upload failed");
      return false;
    }

    final token = sharedPrefs.getString(SharedPrefsConstants.ACCESS_TOKEN);
    var url = Uri.parse(endpoint);
    print(token);

    try{
      final data = resource.toJson();

      var response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Authorization' : 'Bearer $token'
          },
          body: jsonEncode(data)
      );

      if(response.statusCode == 201){
        return true;
      }else if(response.statusCode == 400){
        ResponseModel responseModel = responseModelFromJson(response.body);
        print(responseModel.message);
        return false;
      }else if(response.statusCode == 500){
        ResponseModel responseModel = responseModelFromJson(response.body);
        print(responseModel.message);
        return false;
      } else {
        print("something went wrong");
        return false;
      }
    } catch(e){
      CustomMessage.showErrorMessage(
          title: "Error",
          message: "Something went wrong. Please check your internet connection"
      );
      return false;
    }
    return false;
  }

}