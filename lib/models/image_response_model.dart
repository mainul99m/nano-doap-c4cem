import 'dart:convert';

ImageResponse imageResponseFromJson(String str) => ImageResponse.fromJson(json.decode(str));

String imageResponseToJson(ImageResponse data) => json.encode(data.toJson());

class ImageResponse {
  String status;
  String message;
  String key;

  ImageResponse({
    required this.status,
    required this.message,
    required this.key,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
    status: json["status"],
    message: json["message"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "key": key,
  };
}