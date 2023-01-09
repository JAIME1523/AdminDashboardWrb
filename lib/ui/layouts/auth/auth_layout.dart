import 'package:admin_dashboard/ui/layouts/auth/links_bar.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController(keepScrollOffset: true,initialScrollOffset: 0);
    return Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: ListView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              children: [
                //desktop
                size.width >= 1000
                    ? _DesktopBody(child: child)
                    :
          
                    //mobile
                    _MobikeBody(child: child),
          
                //linksBar
               const LinksBar()
              ],
            ),
          ),
        ));
  }
}

class _MobikeBody extends StatelessWidget {
  const _MobikeBody({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
        // height: size.height * 0.90,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
        const  CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
        const  SizedBox(
            width: double.infinity,
            height: 400,
            child:   BackgorundTwitter()
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.95,
      width: size.width,
      // color: Colors.red,
      child: Row(
        children: [
          //twitter background
          const Expanded(child: BackgorundTwitter()),

          //ViewContainer
          Container(
              width: 600,
              height: double.infinity,
              color: Colors.black,
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                const CustomTitle(),
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: child),
              ])

              // child: //vista,

              )
        ],
      ),
    );
  }
}
