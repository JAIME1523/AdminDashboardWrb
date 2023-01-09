import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/views/no_page_fond_view.dart';

class NoPageFondHandlers {
  static Handler noPageFond = Handler(handlerFunc: ((context, parameters) {
    Provider.of<SideMenuProvider>(context!).setCurrentPageUrl('/404');
    return const NotPageFondView();
  }));
}
