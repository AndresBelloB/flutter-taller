import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapi/pages/pages.dart';
import 'package:rickandmortyapi/provider/characters_provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(const AppState());
}

//* Creamos un nuevo widget que va ser el que maneje el estado del provider
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => CharactersProvider(), lazy: false)
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'detail': (context) => const DetailPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //* home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}