import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapi/models/character.dart';
import 'package:rickandmortyapi/models/characters_response.dart';
import 'package:rickandmortyapi/models/search_characters.dart';

class CharactersProvider extends ChangeNotifier {

  final String _baseUrl = 'rickandmortyapi.com';

  //* Listas
  List<Character> charactersResult = [];
  List<Character> nextCharacters = [];
  int _page = 0;

  CharactersProvider(){
    getCharacters();
    getNextCharacters();
  }
  //* argumentos posicionales son obligatorios por defecto por el page lo hicimos opcional app
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

  getNextCharacters() async {
    _page++;
    final jsonData = await _getJsonData('/api/character', _page);
    final responseNextCharacters = CharactersResponse.fromJson(jsonData);
    // nextCharacters = responseNextCharacters.results;
    nextCharacters = [...nextCharacters, ...responseNextCharacters.results];
    notifyListeners();

  }

  //* para realizar la busqueda
  Future<List<Character>> searchCharacters(String query) async {

    //* https://rickandmortyapi.com/api/character?name=rick

    final url = Uri.https(_baseUrl, "/api/character", {
      'name': query
    });

    //* Realizamos la petición
    final response = await http.get(url);

    if(response.statusCode != 200) {
      return [];
    }
    //* response.body; //* JSON DE STRING
    final searchResponse = SearchCharacters.fromJson(response.body);
    return searchResponse.results;
    
  }
} 