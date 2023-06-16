import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labes.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthPorvider>(context).user;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Dashboard View',
            style: CustomLabes.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          WhiteCard(
            title: user!.nombre,
            child: const Text('Hola'),
          ),
        ],
      ),
    );
  }
}
