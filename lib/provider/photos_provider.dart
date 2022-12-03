import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapi/models/character.dart';
import 'package:rickandmortyapi/models/characters_response.dart';
import 'package:rickandmortyapi/models/photos.dart';
import 'package:rickandmortyapi/models/search_characters.dart';
import 'package:rickandmortyapi/models/users.dart';
import 'package:rickandmortyapi/pages/users_page.dart';

import '../models/users_response.dart';

class PhotosProvider extends ChangeNotifier {
  final String _baseUrl = 'jsonplaceholder.typicode.com';

  //* Listas
  List<Photos> photosResult = [];
  List<Users> users = [];
  int _page = 0;

  PhotosProvider() {
    getPhotos();
    getUsers();
  }
  //* argumentos posicionales son obligatorios por defecto por el page lo hicimos opcional app
  Future<String> _getJsonData(String segmentUrl) async {
    //* Construyendo la url de la petición
    final url = Uri.https(_baseUrl, segmentUrl);

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return 'Error en la peticion';
    }
    return response.body;
  }

//* https://rickandmortyapi.com/api/character
  getPhotos() async {
    final jsonData = await _getJsonData('/photos');
    print(jsonData);

    final charactersResponse = PhotosResponse.fromJson(jsonData);
    photosResult = charactersResponse.results;

    //* les avisa a los widgets que estan escuchando que sucede con la data en caso de cambios y los widgets que estan escuchando se vuelven a renderizar o redibujar
    notifyListeners();
  }

  getUsers() async {
    final jsonData = await _getJsonData('/users');

    final charactersResponse = UserResponse.fromJson(jsonData);
    users = charactersResponse.results;

    //* les avisa a los widgets que estan escuchando que sucede con la data en caso de cambios y los widgets que estan escuchando se vuelven a renderizar o redibujar
    notifyListeners();
  }
}
