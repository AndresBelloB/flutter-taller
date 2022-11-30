
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapi/models/character.dart';
import 'package:rickandmortyapi/provider/characters_provider.dart';

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
    final providerSearchCharacter = Provider.of<CharactersProvider>(context, listen: false);

    return FutureBuilder(
      future: providerSearchCharacter.searchCharacters(query),
      builder:(context, AsyncSnapshot<List<Character>> snapshot) {
        //* Si no hay data
        if(!snapshot.hasData) return _emptyContainer();

        final characters = snapshot.data!; //* characteres es una lista con todos los personajes

        return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) => _CharacterItem(character: characters[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) return  _emptyContainer();

    return Center(
     child: Column(
      children: [
        const SizedBox(height: 70),
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

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({super.key, required this.character });
  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(character.image),
        width: 60,
        fit: BoxFit.contain
      ),
      title: Text(character.name),
      subtitle: Text(character.status),
      onTap: () => Navigator.pushNamed(context, 'detail', arguments: character)

    );
  }
}