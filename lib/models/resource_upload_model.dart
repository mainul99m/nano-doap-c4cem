import 'dart:convert';

ResourceUploadModel resourceUploadModelFromJson(String str) => ResourceUploadModel.fromJson(json.decode(str));

String resourceUploadModelToJson(ResourceUploadModel data) => json.encode(data.toJson());

class ResourceUploadModel {
  String name;
  String imageUrl;
  String country;
  String updatedBy;
  DateTime createdAt;
  List<double> coordinates;

  ResourceUploadModel({
    required this.name,
    required this.imageUrl,
    required this.country,
    required this.updatedBy,
    required this.createdAt,
    required this.coordinates,
  });

  factory ResourceUploadModel.fromJson(Map<String, dynamic> json) => ResourceUploadModel(
    name: json["name"],
    imageUrl: json["imageUrl"],
    country: json["country"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "country": country,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
