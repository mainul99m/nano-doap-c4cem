import 'dart:convert';

FishUploadModel fishUploadModelFromJson(String str) => FishUploadModel.fromJson(json.decode(str));

String fishUploadModelToJson(FishUploadModel data) => json.encode(data.toJson());

class FishUploadModel {
  String name;
  String imageUrl;
  double length;
  double weight;
  String country;
  String updatedBy;
  DateTime createdAt;
  List<double> coordinates;

  FishUploadModel({
    required this.name,
    required this.imageUrl,
    required this.length,
    required this.weight,
    required this.country,
    required this.updatedBy,
    required this.coordinates,
    required this.createdAt
  });

  factory FishUploadModel.fromJson(Map<String, dynamic> json) => FishUploadModel(
    name: json["name"],
    imageUrl: json["imageUrl"],
    length: json["length"],
    weight: json["weight"]?.toDouble(),
    country: json["country"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "length": length,
    "weight": weight,
    "country": country,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
