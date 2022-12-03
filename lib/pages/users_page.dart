import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/photos_provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final getUsersProvider = Provider.of<PhotosProvider>(context, listen: true);
    final List<dynamic> _users = getUsersProvider.users;

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ReorderableListView.builder(
        onReorder: (oldIndex, newIndex) {
          print('oldIndex: $oldIndex');
          print('newIndex: $newIndex');

          if (oldIndex < newIndex) {
            //* Quiere decir que no estamos moviendo hacia abajo
            //* Ejemplo: movemos 0 al 1, ahora el 1 debe ser el primer elemento y 0 el segundo
            newIndex = newIndex - 1;
          }
          //* remover y trasladarlo a su nuevo posición
          final item = _users.removeAt(
              oldIndex); //* remueve el elemento de una lista pero ademas nos retorna el elemento eliminado
          //* Al elemento eliminado debemos insertarlo en su nueva posición
          _users.insert(newIndex, item);
        },
        itemBuilder: (context, index) {
          final value = _users[index].id;
          return ListTile(
            key: ValueKey<int>(value),
            title: Text('${_users[value - 1].name}',
                style: const TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.pushNamed(context, 'user_detail',
                  arguments: _users[value - 1]);
            },
            leading: const Icon(Icons.person),
          );
        },
        itemCount: _users.length,
      )),
    );
  }
}
