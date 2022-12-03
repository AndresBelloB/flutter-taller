import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapi/provider/photos_provider.dart';
import 'package:rickandmortyapi/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getCharacterProvider =
        Provider.of<PhotosProvider>(context, listen: true);
    // getCharacterProvider.nextCharacters;
    // print(getCharacterProvider.charactersResult);
    // getCharacterProvider.getNextCharacters();
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu de usuarios',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              title: const Text('Ir a listado de usuarios'),
              onTap: () {
                Navigator.pushNamed(context, 'users');
              },
            ),
          ],
        )),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "App Photos",
          ),
          elevation: 10,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SwiperContainer(photos: getCharacterProvider.photosResult),
            CharacterSlider(
              photos: getCharacterProvider.photosResult,
              title: 'Photos totales',
            ),
          ],
        )));
  }
}
