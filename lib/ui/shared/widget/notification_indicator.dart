import 'package:flutter/material.dart';

class NotificationINdicator extends StatelessWidget {
  const NotificationINdicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      const  Icon(Icons.notifications_none_outlined),
        Positioned(
          left: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        )
      ],
    );
  }
}
