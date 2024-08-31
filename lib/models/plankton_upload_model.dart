import 'dart:convert';

PlanktonUploadModel planktonUploadModelFromJson(String str) => PlanktonUploadModel.fromJson(json.decode(str));

String planktonUploadModelToJson(PlanktonUploadModel data) => json.encode(data.toJson());

class PlanktonUploadModel {
  String imageUrl;
  int count;
  String country;
  String updatedBy;
  List<double> coordinates;
  DateTime createdAt;

  PlanktonUploadModel({
    required this.imageUrl,
    required this.count,
    required this.country,
    required this.updatedBy,
    required this.coordinates,
    required this.createdAt,
  });

  factory PlanktonUploadModel.fromJson(Map<String, dynamic> json) => PlanktonUploadModel(
    imageUrl: json["imageUrl"],
    count: json["count"],
    country: json["country"],
    updatedBy: json["updatedBy"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "count": count,
    "country": country,
    "updatedBy": updatedBy,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
  };
}
