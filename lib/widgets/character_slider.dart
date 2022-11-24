import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/models.dart';

class CharacterSlider extends StatefulWidget {

  const CharacterSlider({super.key, required this.characters, this.title, required this.onNextPage});

  //* Propiedades de clase
  final List<Character> characters;
  final String? title;
  final Function onNextPage;

  @override
  State<CharacterSlider> createState() => _CharacterSliderState();
}

class _CharacterSliderState extends State<CharacterSlider> {

  final ScrollController scrollController = ScrollController();
  

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 
     
    });
    print(scrollController.position.pixels);
    print(scrollController.position.maxScrollExtent);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('character slider'),
    );
  }
}