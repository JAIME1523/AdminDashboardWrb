import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/widget/logo.dart';
import 'package:admin_dashboard/ui/shared/widget/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widget/text_separator.dart';

import 'package:admin_dashboard/providers/providers.dart';


class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(
            text: 'Main',
          ),
          MyMenuItem(
              text: 'Dashboar',
              icon: Icons.compass_calibration_outlined,
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MyMenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Analitics',
            icon: Icons.show_chart_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
            onPressed: () => navigateTo(Flurorouter.categoriesRoute),
          ),
          MyMenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Discount',
            icon: Icons.money_off_csred_sharp,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Customer',
            icon: Icons.people_alt_outlined,
           isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
            onPressed: () => navigateTo(Flurorouter.usersRoute),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(
            text: 'UI Elements',
          ),
          MyMenuItem(
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              onPressed: () => navigateTo(Flurorouter.iconsRoute)),
          MyMenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(
            text: 'Exit',
          ),
          MyMenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {
              Provider.of<AuthPorvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff092044),
          Color(0xff092035),
        ]),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]);
  }
}
