import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMenuItem extends StatefulWidget {
  const MyMenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.isActive = false,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  @override
  State<MyMenuItem> createState() => _MyMenuItemState();
}

class _MyMenuItemState extends State<MyMenuItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHover
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null :() =>widget.onPressed(),
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  isHover = true;
                });
              },
              onExit: (event) => setState(() {
                isHover = false;
              }),
              child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Icon(widget.icon, color: Colors.white.withOpacity(0.3),
                  ),
                const  SizedBox(height: 19,),
                  Text(widget.text,
                  style: GoogleFonts.roboto(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16
                  ),
                  ),

                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
