import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handers.dart';
import 'package:admin_dashboard/router/no_page_fond_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboar
  static String dashboardRoute = '/dashboard';

  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  

  static void configureRoutes() {
    //auth Routes

    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboar
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);

    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);


    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn);


    //404

    router.notFoundHandler = NoPageFondHandlers.noPageFond;
  }
}
