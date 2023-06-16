import 'package:admin_dashboard/ui/inputs/custom_imputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: buildBoxDecoration(),
        child: Center(
          child: TextField(
            decoration: CustomInputs.searchInputDecoration(
              hit: 'Search',
              icon: Icons.search_outlined,
            ),
          ),
        ));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.withOpacity(0.3),
    );
  }
}
