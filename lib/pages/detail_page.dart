import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/models.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //* vamos a recuperar el argumento de la ruta
    final Character character = ModalRoute.of(context)?.settings.arguments as Character;
   
    return Scaffold(
      body: CustomScrollView(
        //* El CustomScrollView nos va permitir tener un AppBar de tipo Sliver
        slivers: [
          _CustomAppBar(character: character),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(character),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
            ]))
        ],
      ),
    );
  }
}

//* AppBar Sliver
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //* SliverAppBar es muy parecido al Appbar normal, solo que podemos controlar alto y ancho
      backgroundColor: const Color.fromARGB(255, 58, 61, 78),
      expandedHeight: 200,
      pinned: true, //* para que no desaparesca por completo
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            character.name, 
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            )
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/banner.jpg'),
          fit: BoxFit.cover
        ),
      ),


    );
  }
}



class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle(this.character, {super.key});
  final Character character;

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size; //* el tamaño del dispositivo
    print(size);
    print(size.width);
  
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: character.characterId!, //* el detalle es que recibe los id unicos tanto del swiper como del slider
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(character.image),
                height: 150,
                width: 110,
                fit: BoxFit.cover
              ),
            ),
          ),
         const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 170) ,
                child: Text(
                  character.name, 
                  style: textTheme.headline5, 
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2)
              ),
              Text(character.gender, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis,),
              Row(children: [
                const Icon(Icons.photo_album_outlined, size: 15, color: Colors.green),
                const SizedBox(width: 5),
                Text(character.location.name, style: textTheme.caption)
              ])
            ],
          )
        ]
        ),
    );
  }
}

//* Que van los textos de relleno

class _Overview extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: const Text(
        "Cupidatat velit cupidatat dolor minim. Labore officia laboris commodo minim irure sit dolor est nulla magna aute pariatur velit. Labore voluptate proident pariatur tempor eiusmod anim in ipsum laborum veniam minim sit.",
        textAlign: TextAlign.justify,
        ),
    );
  }
}