import 'package:flutter/material.dart';

class RegsiterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String email = '';
  String pasword = '';
  String name = '';

  validateFrom() {
    if (fromKey.currentState!.validate()) {
     
      return true;
    } else {
    
      return false;
    }
  }
}
