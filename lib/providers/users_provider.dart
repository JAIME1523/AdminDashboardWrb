import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/https/users_reponse.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;
  UsersProvider() {
    getPaginateUser();
  }

  getPaginateUser() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');

    final usersResp = UsersResponse.fromMap(resp);
    users = [...?usersResp.usuarios];
    isLoading = false;

    notifyListeners();
  }

  void short<T>(Comparable<T> Function(Usuario user) getFIeld) {
    users.sort(((a, b) {
      final aValue = getFIeld(a);
      final bValue = getFIeld(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    }));
    ascending = !ascending;

    notifyListeners();
  }

  void refreshUser(Usuario nweUser) {
   users =  users.map((user) {
      if (user.uid == nweUser.uid) {
        user = nweUser;
      }
      return user;
    }).toList();
    users;
    notifyListeners();
  }
}
