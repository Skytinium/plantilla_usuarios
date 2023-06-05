// To parse this JSON data, do
//
//     final usuarios = usuariosFromMap(jsonString);

import 'dart:convert';

class Usuarios {
  String addres;
  String email;
  String name;
  String phone;
  String photo;
  //String? id;

  Usuarios({
    required this.addres,
    required this.email,
    required this.name,
    required this.phone,
    required this.photo,
    // this.id,
  });

  factory Usuarios.fromJson(String str) => Usuarios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuarios.fromMap(Map<String, dynamic> json) => Usuarios(
        //   id: json['id'],
        addres: json["addres"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        //    "id": id,
        "addres": addres,
        "email": email,
        "name": name,
        "phone": phone,
        "photo": photo,
      };
}
