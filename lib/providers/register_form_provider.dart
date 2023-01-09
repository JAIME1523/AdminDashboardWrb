import 'package:flutter/material.dart';

class RegsiterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String email = '';
  String pasword = '';
  String name = '';

  validateFrom() {
    if (fromKey.currentState!.validate()) {
      print('Login');
      print(email);
      print(pasword);
      return true;
    } else {
      print('No valido');
      return false;
    }
  }
}
