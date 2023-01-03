import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_fond_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth router
  static String loginRoute = '/auth/login';
  static  String registerRoute = '/auth/register';

  //Dashboar
  static  String dashboardRoute = '/auth/dashboard';
  static void configureRoutes(){

    //auth Routes

    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    //404

    router.notFoundHandler = NoPageFondHandlers.noPageFond;

  }
  
}
