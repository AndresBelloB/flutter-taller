// To parse this JSON data, do
//
//     final photos = photosFromMap(jsonString);

import 'dart:convert';

class Photos {
  Photos({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  dynamic id;
  String title;
  String url;
  String thumbnailUrl;

  factory Photos.fromJson(String str) => Photos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photos.fromMap(Map<String, dynamic> json) => Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toMap() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
