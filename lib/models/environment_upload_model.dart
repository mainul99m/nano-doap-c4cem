import 'dart:convert';

EnvironmentUploadModel environmentUploadModelFromJson(String str) => EnvironmentUploadModel.fromJson(json.decode(str));

String environmentUploadModelToJson(EnvironmentUploadModel data) => json.encode(data.toJson());

class EnvironmentUploadModel {
  double temperature;
  double salinity;
  double ph;
  double dissolvedOxygen;
  double transparency;
  String updatedBy;
  DateTime createdAt;
  String country;
  List<double> coordinates;

  EnvironmentUploadModel({
    required this.temperature,
    required this.salinity,
    required this.ph,
    required this.dissolvedOxygen,
    required this.transparency,
    required this.updatedBy,
    required this.createdAt,
    required this.country,
    required this.coordinates,
  });

  factory EnvironmentUploadModel.fromJson(Map<String, dynamic> json) => EnvironmentUploadModel(
    temperature: json["temperature"]?.toDouble(),
    salinity: json["salinity"]?.toDouble(),
    ph: json["ph"]?.toDouble(),
    dissolvedOxygen: json["dissolvedOxygen"]?.toDouble(),
    transparency: json["transparency"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    country: json["country"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "temperature": temperature,
    "salinity": salinity,
    "ph": ph,
    "dissolvedOxygen": dissolvedOxygen,
    "transparency": transparency,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "country": country,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
