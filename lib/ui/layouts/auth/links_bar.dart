import 'package:admin_dashboard/ui/bouttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        color: Colors.black,
        height:   size.width <1000 ? size.height * 0.07:null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children:   [
            LinkText(text: 'Abaout',onPressed: (){print('abasda');}),
            LinkText(text: 'Help center'),
            LinkText(text: 'Terms of service'),
            LinkText(text: 'Privacy Policy'),
            LinkText(text: 'Cookie Policy'),
            LinkText(text: 'Ads info'),
            LinkText(text: 'Blog'),
            LinkText(text: 'Careers'),
            LinkText(text: 'Brand Resources'),
            LinkText(text: 'Marketing'),
          ],
        ));
  }
}
