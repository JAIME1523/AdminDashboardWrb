import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffEDF1F2),
          body: Stack(
            children: [
              
              Row(
                children: [
                  //TODO: esto depende sies mas de 700px
                  if (size.width >= 700) const Sidebar(),
                  Expanded(
                    child: Column(
                      children: [
                        //navar
                        const Navbar(),
                        //View
                        Expanded(child: child)
                      ],
                    ),
                  ),

             
                  //  const Positioned(
                  //   left: 1,
                  //   child: Sidebar()),
                 

                  //Contenedor de nuestra view
                ],
              ),
              if(size.width < 700) const  Sidebar()
            ],
          )),
    );
  }
}
