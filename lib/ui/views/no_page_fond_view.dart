import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotPageFondView extends StatelessWidget {
  const NotPageFondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '404 - Página no encontrada ',
        style: GoogleFonts.montserratAlternates(
          color: Colors.white,
            fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }
}
