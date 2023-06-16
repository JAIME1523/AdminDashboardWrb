import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/views/no_page_fond_view.dart';
import 'package:admin_dashboard/providers/providers.dart';


class NoPageFondHandlers {
  static Handler noPageFond = Handler(handlerFunc: ((context, parameters) {
    Provider.of<SideMenuProvider>(context!).setCurrentPageUrl('/404');
    return const NotPageFondView();
  }));
}
