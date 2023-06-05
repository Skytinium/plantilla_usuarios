import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:plantilla_usuarios/model/usuarios.dart';

class UserProvider extends ChangeNotifier {
  final String _baseUrl =
      'https://usuarios-849b6-default-rtdb.europe-west1.firebasedatabase.app';

  List<Usuarios> usuarios = [];

  UserProvider() {
    print('User Provider inicializado');
    getUsers();
  }

  getUsers() async {
    print('getUsers');
    var url = Uri.parse('$_baseUrl/usuarios.json');
    final response = await http.get(url);
    final data = json.decode(response.body);

    if (data != null) {
      usuarios = (data as Map<String, dynamic>)
          .values
          .map((json) => Usuarios.fromMap(json))
          .toList();
    }

    notifyListeners();
  }

  addUser(Usuarios newUser) async {
    var url = Uri.parse('$_baseUrl/usuarios.json');
    final response = await http.post(
      url,
      body: json.encode(newUser.toMap()),
    );

    if (response.statusCode == 200) {
      // Si la solicitud de creación fue exitosa, agregamos el nuevo usuario a la lista local
      newUser.name = json.decode(response.body)['name'];
      usuarios.add(newUser);
      notifyListeners();
    } else {
      // Si ocurrió algún error en la solicitud, puedes manejarlo aquí
      print('Error al crear el usuario');
    }
  }

  removeUser(Usuarios user) async {
    var url = Uri.parse('$_baseUrl/usuarios/${user.name}.json');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // Si la solicitud de eliminación fue exitosa, removemos el usuario de la lista local
      usuarios.remove(user);
      notifyListeners();
    } else {
      // Si ocurrió algún error en la solicitud, puedes manejarlo aquí
      print('Error al eliminar el usuario');
    }
  }
}
