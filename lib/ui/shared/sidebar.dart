import 'package:admin_dashboard/ui/shared/widget/logo.dart';
import 'package:admin_dashboard/ui/shared/widget/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widget/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            isActive: false,
            onPressed: () {
              print('dashboard');
            },
          ),
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
            text: 'Products',
            icon: Icons.layers_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Discount',
            icon: Icons.dashboard_outlined,
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Customer',
            icon: Icons.people_alt_outlined,
            onPressed: () {},
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
            onPressed: () {},
          ),
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
            onPressed: () {},
          ),
          MyMenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {},
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
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]);
  }
}
