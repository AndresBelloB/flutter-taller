import 'dart:convert';

class Photo {
  Photo({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String? type;
  String gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  //! Este id lo utilizamos para las animaciones con el widget Hero(), es lo que va ir en el tag
  String? characterId;

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
