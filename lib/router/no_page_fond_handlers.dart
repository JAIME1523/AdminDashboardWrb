import 'package:admin_dashboard/ui/views/no_page_fond_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFondHandlers {
  static Handler noPageFond = Handler(handlerFunc: ((context, parameters) {
    return const NotPageFondView();
  }));
}
