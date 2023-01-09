import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

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
                        Expanded(child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: widget.child,
                        ))
                      ],
                    ),
                  ),

        
                ],
              ),
              if (size.width < 700)
                AnimatedBuilder(
                    animation: SideMenuProvider.menuController,
                    builder: (context, _) => Stack(
                          children: [
                            //TODO: background
                            if (SideMenuProvider.isOPen)
                              AnimatedOpacity(
                                  opacity: SideMenuProvider.opacity.value,
                                  duration: const Duration(milliseconds: 200),
                                  child: GestureDetector(
                                    onTap: () => SideMenuProvider.closeMenu(),
                                    child: Container(
                                      width: size.width,
                                      height: size.height,
                                      color: Colors.black26,
                                    ),
                                  )),
                            Transform.translate(
                              offset:
                                  Offset(SideMenuProvider.movement.value, 0),
                              child: const Sidebar(),
                            ),
                          ],
                        ))
            ],
          )),
    );
  }
}
