import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labes.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Blank View',
            style: CustomLabes.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                width: 170,
                title: 'ac_unit_outlined',
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                ),
              ),
              WhiteCard(
                width: 170,
                title: 'abc',
                child: Center(
                  child: Icon(Icons.abc),
                ),
              ),
              WhiteCard(
                width: 170,
                title: 'access_alarm_rounded',
                child: Center(
                  child: Icon(Icons.access_alarm_rounded),
                ),
              ),
              WhiteCard(
                width: 170,
                title: 'account_balance_outlined',
                child: Center(
                  child: Icon(Icons.account_balance_outlined),
                ),
              ),
              WhiteCard(
                width: 170,
                title: 'remember_me_outlined',
                child: Center(
                  child: Icon(Icons.remember_me_outlined),
                ),
              ),
              WhiteCard(
                width: 170,
                title: 'reply_all_sharp',
                child: Center(
                  child: Icon(Icons.reply_all_sharp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
