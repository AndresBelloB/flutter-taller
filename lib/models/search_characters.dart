import 'dart:convert';
import 'package:rickandmortyapi/models/character.dart';

class SearchCharacters {
  SearchCharacters({
    // required this.info,
    required this.results,
  });

  // Info info;
  List<Photo> results;

  factory SearchCharacters.fromJson(String str) =>
      SearchCharacters.fromMap(json.decode(str));

  factory SearchCharacters.fromMap(Map<String, dynamic> json) =>
      SearchCharacters(
        // info: Info.fromMap(json["info"]),
        results: List<Photo>.from(json["results"].map((x) => Photo.fromMap(x))),
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

