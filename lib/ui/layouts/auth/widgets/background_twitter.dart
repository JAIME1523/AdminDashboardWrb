import 'package:flutter/material.dart';

class BackgorundTwitter extends StatelessWidget {
  const BackgorundTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),

    child: Container(
      //expanda en todo pero no mayor a 400
      constraints: const BoxConstraints(maxWidth: 400),
      child:const Center(

      child:Padding(
        padding: EdgeInsets.symmetric(horizontal:30),
        child: Image(
          image:AssetImage('assets/twitter-white-logo.png'),
          width:400,
        ),
      )
      )
    ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
          
            image: AssetImage('assets/twitter-bg.png'), fit: BoxFit.cover));
  }
}
