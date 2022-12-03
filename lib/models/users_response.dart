import 'dart:convert';
import 'package:rickandmortyapi/models/photos.dart';
import 'package:rickandmortyapi/models/users.dart';
import 'package:rickandmortyapi/pages/users_page.dart';

class UserResponse {
  UserResponse({
    // required this.info,
    required this.results,
  });

  // Info info;
  List<Users> results;

  factory UserResponse.fromJson(String str) =>
      UserResponse.fromMap(json.decode(str));

  factory UserResponse.fromMap(List<dynamic> json) => UserResponse(
        // info: Info.fromMap(json["info"]),
        results: List<Users>.from(json.map((x) => Users.fromMap(x))),
      );
}
