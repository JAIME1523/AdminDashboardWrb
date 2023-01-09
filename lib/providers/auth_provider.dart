import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/https/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthrnticated }

class AuthPorvider extends ChangeNotifier {
  AuthPorvider() {
    isAuthenticated();
  }
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  login(String email, String password) {
    final data = {
      "correo": email,
      "password": password,
    };
    CafeApi.httpPost('/auth/login', data).then((json) {
      print(json);
      final authResponse = AtuhResponse.fromMap(json);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      CafeApi.configureDio();

      LocalStorage.prefs!.setString('token', authResponse.token!);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Verificar sus credencialesa $e');
    });

    // //TODO:peticion http
    // _token = 'asdasda.asdasd.asdasd';
    // LocalStorage.prefs!.setString('token', _token!);
    // print('almacenar el JWT: $_token');

    // //TODO:Navegar al Dashboard
    // authStatus = AuthStatus.authenticated;
    // NavigationService.replaceTo(Flurorouter.dashboardRoute);
    // notifyListeners();
    // // isAuthenticated();
  }

  registrer(String email, password, name) {
    final data = {
      "nombre": name,
      "correo": email,
      "password": password,
    };
    CafeApi.httpPost('/usuarios', data).then((json) {
      print(json);
      final authResponse = AtuhResponse.fromMap(json);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;

      LocalStorage.prefs!.setString('token', authResponse.token!);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackbarError('Verificar sus credencialesa');
    });

    // //TODO:peticion http
    // _token = 'asdasda.asdasd.asdasd';
    // LocalStorage.prefs!.setString('token', _token!);
    // print('almacenar el JWT: $_token');

    // //TODO:Navegar al Dashboard
    // authStatus = AuthStatus.authenticated;
    // NavigationService.replaceTo(Flurorouter.dashboardRoute);
    // notifyListeners();
    // // isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs!.getString('token') == null) {
      authStatus = AuthStatus.notAuthrnticated;
      notifyListeners();

      return false;
    }

    //TODO: IR al back end a ver si esxiste el JWT

    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AtuhResponse.fromMap(response);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs!.setString('token', authResponse.token!);
      notifyListeners();
    } catch (e) {
      authStatus = AuthStatus.notAuthrnticated;
      notifyListeners();
      return false;
    }
    // await Future.delayed(Duration(milliseconds: 5));
    // authStatus = AuthStatus.authenticated;
    // notifyListeners();

    return true;
  }

  logout() {
    LocalStorage.prefs!.remove('token');
    authStatus = AuthStatus.notAuthrnticated;
    notifyListeners();
  }
}
