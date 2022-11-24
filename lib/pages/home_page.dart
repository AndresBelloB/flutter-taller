import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapi/provider/characters_provider.dart';
import 'package:rickandmortyapi/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final getCharacterProvider = Provider.of<CharactersProvider>(context, listen: true);
    // getCharacterProvider.nextCharacters;
    // print(getCharacterProvider.charactersResult);
    // getCharacterProvider.getNextCharacters();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        elevation: 10,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperContainer(characters: getCharacterProvider.charactersResult),
            CharacterSlider(
              characters: getCharacterProvider.nextCharacters, 
              title: 'Personajes', 
              onNextPage: getCharacterProvider.getNextCharacters()
            )
          ],
        )
      )
    );
  }
}