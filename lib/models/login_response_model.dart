import 'dart:convert';
import 'package:nano_doap_c4cem/models/user_model.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  String status;
  String token;
  String? message;
  UserModel? user;

  LoginResponseModel({
    required this.status,
    required this.token,
    this.message,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    token: json["token"],
    message: json["message"],
    user: UserModel.fromJson(json["user"]),
  );
}

