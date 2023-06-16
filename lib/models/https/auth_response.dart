// To parse this JSON data, do
//
//     final atuhResponse = atuhResponseFromMap(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/models/usuario.dart';

class AtuhResponse {
    AtuhResponse({
        required this.usuario,
        required this.token,
    });

    final Usuario? usuario;
    final String? token;

    factory AtuhResponse.fromJson(String str) => AtuhResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AtuhResponse.fromMap(Map<String, dynamic> json) => AtuhResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario!.toMap(),
        "token": token,
    };
}
