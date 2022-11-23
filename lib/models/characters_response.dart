import 'dart:convert';
import 'package:rickandmortyapi/models/character.dart';

class CharactersResponse {
  
    CharactersResponse({
        required this.info,
        required this.results,
    });

    Info info;
    List<Character> results;

    factory CharactersResponse.fromJson(String str) => CharactersResponse.fromMap(json.decode(str));

    factory CharactersResponse.fromMap(Map<String, dynamic> json) => CharactersResponse(
        info: Info.fromMap(json["info"]),
        results: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
    );

}

class Info {
    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    int count;
    int pages;
    String next;
    dynamic prev;

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

