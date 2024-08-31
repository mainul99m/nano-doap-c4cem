// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String name;
  String email;
  String phone;
  bool isVerified;
  String institution;
  String address;
  String country;
  String role;
  int v;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isVerified,
    required this.institution,
    required this.address,
    required this.country,
    required this.role,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    isVerified: json["isVerified"],
    institution: json["institution"],
    address: json["address"],
    country: json["country"],
    role: json["role"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "isVerified": isVerified,
    "institution": institution,
    "address": address,
    "country": country,
    "role": role,
    "__v": v,
  };
}
