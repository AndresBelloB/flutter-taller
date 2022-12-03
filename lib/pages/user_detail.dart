import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/users.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = ModalRoute.of(context)?.settings.arguments as Users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de usuario'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RichText(
            text: TextSpan(children: [
          const TextSpan(
              text: 'Name: ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
              text: '${users.name}\n',
              style: const TextStyle(color: Colors.black)),
          const TextSpan(
              text: 'Email: ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
              text: '${users.email}\n',
              style: const TextStyle(color: Colors.black)),
          const TextSpan(
              text: 'Phone: ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
              text: '${users.phone}\n',
              style: const TextStyle(color: Colors.black)),
          const TextSpan(
              text: 'Website: ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
              text: users.website, style: const TextStyle(color: Colors.black))
        ])),
      )),
    );
  }
}
