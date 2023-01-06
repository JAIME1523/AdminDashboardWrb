import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/widgets.dart';

enum AuthStatus { checking, authenticated, notAuthrnticated }

class AuthPorvider extends ChangeNotifier {
  AuthPorvider() {
    isAuthenticated();
  }
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  login(String email, password) {
    //TODO:peticion http
    _token = 'asdasda.asdasd.asdasd';
    LocalStorage.prefs!.setString('token', _token!);
    print('almacenar el JWT: $_token');

    //TODO:Navegar al Dashboard
    authStatus = AuthStatus.authenticated;
NavigationService.replaceTo(Flurorouter.dashboardRoute);
    notifyListeners();
    // isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs!.getString('token') == null) {
      authStatus = AuthStatus.notAuthrnticated;
      notifyListeners();

      return false;
    }

    //TODO: IR al back end a ver si esxiste el JWT
    await Future.delayed(Duration(milliseconds: 5));
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
