import 'package:flutter/widgets.dart';

class AuthPorvider extends ChangeNotifier {
  String? _token;

  login(String email, password) {
    //TODO:peticion http
    _token = 'asdasda.asdasd.asdasd';
    print('almacenar el JWT: $_token');

    //TODO:Navegar al Dashboard
    notifyListeners();
  }
}
