

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'ui/layouts/dashboard/dashboard_layout.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthPorvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      scaffoldMessengerKey: NotificationsService.messagerKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        final authProvider = Provider.of<AuthPorvider>(context);
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (BuildContext context) {
              return authProvider.authStatus == AuthStatus.checking
                  ? const SplashLayout()
                  : authProvider.authStatus == AuthStatus.authenticated
                      ? DashboardLayout(child: child!)
                      : AuthLayout(child: child!);
            })
          ],
        );
        // authProvider.authStatus == AuthStatus.checking
        //     ? const SplashLayout()
        //     : authProvider.authStatus == AuthStatus.authenticated
        //         ? DashboardLayout(child: child!)
        //         : AuthLayout(child: child!);

        // return AuthLayout(child: child!);
        // return DashboardLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(.60)))),
    );
  }
}
