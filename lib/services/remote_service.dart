import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nano_doap_c4cem/models/login_response_model.dart';
import 'package:nano_doap_c4cem/utils/custom_message.dart';
import '../utils/api_endpoint.dart';

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

  static Future<http.Response> fetchPosts() {
    return http.get(Uri.parse('posts'));
  }


}