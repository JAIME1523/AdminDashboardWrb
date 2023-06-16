import 'package:flutter/material.dart';

class LoginFromProvider extends ChangeNotifier {
  LoginFromProvider();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String email = '';
  String pasword = '';

  validateFrom() {
    if (fromKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
