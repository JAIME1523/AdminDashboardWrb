import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // width: 600,
        // height: double.infinity,
        // color: Colors.black,
        child: Column(children: [
          Image.asset(
            'assets/twitter-white-logo.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Hapening Now',
            style: GoogleFonts.montserrat(
                fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ]));
  }
}
