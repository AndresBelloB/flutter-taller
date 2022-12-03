import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/models.dart';
import 'package:rickandmortyapi/models/photos.dart';

class CharacterSlider extends StatefulWidget {
  const CharacterSlider({super.key, required this.photos, this.title});

  //* Propiedades de clase
  final List<Photos> photos;
  final String? title;

  @override
  State<CharacterSlider> createState() => _CharacterSliderState();
}

class _CharacterSliderState extends State<CharacterSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //* El scrollController nos permite crear en el initState un listener
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, //* para que tome todo el ancho posible
        height: 260,
        child: Column(
          children: [
            if (widget.title != null)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.photos.length,
              itemBuilder: (context, index) => _CharacterPoster(
                photo: widget.photos[index],
                photoId: '${widget.title}-${index}-${widget.photos[index].id}',
              ),
            ))
          ],
        ));
  }
}

//* Poster del Personaje

class _CharacterPoster extends StatelessWidget {
  const _CharacterPoster(
      {super.key, required this.photo, required this.photoId});
  final Photos photo;
  final String photoId;
  @override
  Widget build(BuildContext context) {
    photo.id = photoId;
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'detail', arguments: photo),
              child: Hero(
                tag: photo.id!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // * ClipRRect nos permite agregar bordes rendondeados
                  child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage('${photo.url}.jpg'),
                      width: 130,
                      height: 190,
                      fit: BoxFit.cover),
                ),
              )),
          const SizedBox(height: 5),
          Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
