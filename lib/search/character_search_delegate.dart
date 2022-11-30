
import 'package:flutter/material.dart';

class CharacterSearchDelegate extends SearchDelegate {

  @override
  String? get searchFieldLabel => 'Buscar personajes';

  @override
  List<Widget>? buildActions(BuildContext context) {
    //* Botones
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //* boton de volver atras
    return IconButton(
      icon: const Icon(Icons.arrow_back), 
      onPressed: () => close(context, null),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Lo que estas escribiendo es: $query", style: TextStyle(fontSize: 20)),
    );
  }

}
