import 'package:admin_dashboard/providers/providers.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    if (authPorvider.authStatus == AuthStatus.notAuthrnticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  }));

  static Handler register = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    if (authPorvider.authStatus == AuthStatus.notAuthrnticated) {
      return const RegisterView();
    } else {
      return const DashboardView();
    }
  }));
}
