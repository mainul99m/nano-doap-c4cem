import 'dart:convert';

PlasticUploadModel plasticUploadModelFromJson(String str) => PlasticUploadModel.fromJson(json.decode(str));

String plasticUploadModelToJson(PlasticUploadModel data) => json.encode(data.toJson());

class PlasticUploadModel {
  String imageUrl;
  String country;
  String updatedBy;
  DateTime createdAt;
  List<double> coordinates;

  PlasticUploadModel({
    required this.imageUrl,
    required this.country,
    required this.updatedBy,
    required this.createdAt,
    required this.coordinates,
  });

  factory PlasticUploadModel.fromJson(Map<String, dynamic> json) => PlasticUploadModel(
    imageUrl: json["imageUrl"],
    country: json["country"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "country": country,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
