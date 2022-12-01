import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/models.dart';

class SwiperContainer extends StatelessWidget {

  const SwiperContainer({super.key, required this.characters});
  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    //* Obteniendo las dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    //* 1000 * 0.5 = ?? 500
    //* Si la información aun no esta disponible ( a los personajes)

    if(characters.isEmpty){
      return SizedBox(
        width: double.infinity, //* va tomar todo el ancho disponible
        height: size.height * 0.5 ,
        child: const Center(
          child: CircularProgressIndicator()
        )
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: characters.length, //* la cantidad de cards
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.77,
        itemHeight: size.height * 0.42,
        itemBuilder: (context, index) {
          final character = characters[index];
          character.characterId = 'swiper-${character.id}';
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: character),
            child: Hero(
              tag: character.characterId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(character.image),
                  fit: BoxFit.fill //* forzamos a la imagen que se adecue al contenedor
                  )
              ),
            ),
          );
        },
      )
    );
  }
}