import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoratoin(
      {required String hint, required String label, required IconData icon}) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        hintText: hint,
        labelText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey));
  }

  static InputDecoration searchInputDecoration({
    required String hit,
    required IconData icon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hit,
      prefix: Icon(
        icon,
        color: Colors.grey,
      ),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration forInpuDecoration(
      {required String hint, required IconData icon, required String label}) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3)),
        ),
        hintText: hint,
        labelText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey));
  }
}
