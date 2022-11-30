
import 'package:flutter/material.dart';

class CharacterSearchDelegate extends SearchDelegate {

  @override
  String? get searchFieldLabel => 'Buscar personajes';

  //* Método para mostrar una imagen cuando aun no se ha escrito nada.
  Widget _emptyContainer() {
    return const Center(
      child: FadeInImage(
        placeholder: AssetImage('assets/search.png'), 
        image: AssetImage('assets/search.png'),
        width: 300,
        height: 300,
        ),
    );
  }

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
    if(query.isEmpty) return  _emptyContainer();

    return Center(
     child: Column(
      children: [
        const SizedBox(height: 80),
        const Image(image: AssetImage('assets/giphy.gif'),),
        Text(
          "Buscando personaje: $query", 
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900
            )),
      ]
      ),
    );

    
  }

}
