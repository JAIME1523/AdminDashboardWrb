import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserViewProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UserViewProvider(String uid) {
    getUserBy(uid);
  }
  bool isCharge = true;
  Usuario? user;

  getUserBy(String uid) async {
    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      user = Usuario.fromMap(resp);

      isCharge = false;
    } catch (e) {
      isCharge = false;
    }
    notifyListeners();
  }
  //pensar como actulizar al usuario

  copyUserwith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
        rol: rol ?? user!.rol,
        estado: estado ?? user!.estado,
        google: google ?? user!.google,
        nombre: nombre ?? user!.nombre,
        correo: correo ?? user!.correo,
        img: img ?? user!.img,
        uid: uid ?? user!.uid);
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_validForm()) return;
    final data = {'nombre': user!.nombre, 'correo': user!.correo};

    try {
      await CafeApi.httpPut('/usuarios/${user!.uid}', data);

      return true;
    } on DioError catch (e) {
      throw ('error en el put $e');
    }
  }

  Future<Usuario> uploadImage(Uint8List bytes) async {
    try {
      final resp =
          await CafeApi.uploadFile('/uploads/usuarios/${user!.uid}', bytes);

      user = Usuario.fromMap(resp);
      getUserBy(user!.uid!);
      notifyListeners();
      return user!;
    } catch (e) {
      throw 'error en uploadImage';
    }
  }
}
