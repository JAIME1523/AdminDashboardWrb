
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/categories_vew.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/user_view.dart';
import 'package:admin_dashboard/ui/views/users_vew.dart';

import 'package:admin_dashboard/providers/providers.dart';





class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authPorvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  }));

  static Handler icons = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authPorvider.authStatus == AuthStatus.authenticated) {
      return const IconsView();
    } else {
      return const LoginView();
    }
  }));

  static Handler blank = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    if (authPorvider.authStatus == AuthStatus.authenticated) {
      return const BlankView();
    } else {
      return const LoginView();
    }
  }));

  static Handler categories = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.categoriesRoute);

    if (authPorvider.authStatus == AuthStatus.authenticated) {
      return const CategoriesView();
    } else {
      return const LoginView();
    }
  }));

  static Handler users = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usersRoute);

    if (authPorvider.authStatus == AuthStatus.authenticated) {
      return const UsersView();
    } else {
      return const LoginView();
    }
  }));

  static Handler user = Handler(handlerFunc: ((context, parameters) {
    final authPorvider = Provider.of<AuthPorvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userRoute);

    if (authPorvider.authStatus == AuthStatus.authenticated) {
      if (parameters['uid']?.first != null) {
        return UserView(
          uid: parameters['uid']!.first,
        );
      } else {
        return const UsersView();
      }
    } else {
      return const LoginView();
    }
  }));
}
