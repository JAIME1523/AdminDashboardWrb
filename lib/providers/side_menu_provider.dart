import 'package:flutter/material.dart';

class SideMenuProvider {
  static late AnimationController menuController;
  static bool isOPen = false;

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOPen = true;
    //play en la animacion
    menuController.forward();
  }

  static void closeMenu() {
    isOPen = true;
    //play en la animacion
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOPen) ? menuController.reverse() : menuController.forward();

    isOPen = !isOPen;
  }
}
