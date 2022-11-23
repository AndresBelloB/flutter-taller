import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapi/models/character.dart';
import 'package:rickandmortyapi/models/characters_response.dart';

class CharactersProvider extends ChangeNotifier {

  final String _baseUrl = 'rickandmortyapi.com';

  //* Listas
  List<Character> charactersResult = [];
  int _page = 0;

  CharactersProvider(){
    getCharacters();
  }
  //* argumentos posicionales son obligatorios por defecto por el page lo hicimos opcional
  Future<String> _getJsonData(String segmentUrl, [int page = 1]) async {

    //* Construyendo la url de la petición
    final url = Uri.https(_baseUrl, segmentUrl, {
      'page': '$page'
    });

    final response = await http.get(url);

    if(response.statusCode != 200) {
      return 'Error en la peticion';
    }
    return response.body;
  }
//* https://rickandmortyapi.com/api/character
  getCharacters() async {
    final jsonData = await _getJsonData('/api/character');
    print(jsonData);
    print(jsonData is String); //* True

    final charactersResponse = CharactersResponse.fromJson(jsonData);

    charactersResult = charactersResponse.results;
    //* les avisa a los widgets que estan escuchando que sucede con la data en caso de cambios y los widgets que estan escuchando se vuelven a renderizar o redibujar
    notifyListeners();
    
  }
}