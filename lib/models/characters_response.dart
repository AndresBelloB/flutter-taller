import 'dart:convert';
import 'package:rickandmortyapi/models/photos.dart';

class PhotosResponse {
  PhotosResponse({
    // required this.info,
    required this.results,
  });

  // Info info;
  List<Photos> results;

  factory PhotosResponse.fromJson(String str) =>
      PhotosResponse.fromMap(json.decode(str));

  factory PhotosResponse.fromMap(List<dynamic> json) => PhotosResponse(
        // info: Info.fromMap(json["info"]),
        results: List<Photos>.from(json.map((x) => Photos.fromMap(x))),
      );
}

// class Info {
//     Info({
//         required this.count,
//         required this.pages,
//         required this.next,
//         required this.prev,
//     });

//     int count;
//     int pages;
//     String next;
//     dynamic prev;

//     factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Info.fromMap(Map<String, dynamic> json) => Info(
//         count: json["count"],
//         pages: json["pages"],
//         next: json["next"],
//         prev: json["prev"],
//     );

//     Map<String, dynamic> toMap() => {
//         "count": count,
//         "pages": pages,
//         "next": next,
//         "prev": prev,
//     };
// }

