import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

class UserDataSourse extends DataTableSource {
  final List<Usuario> users;

  UserDataSourse(this.users);
  @override
  DataRow? getRow(int index) {
    final Usuario user = users[index];
    final image = user.img == null
        ? const Image(
            image: AssetImage(
              'assets/no-image.jpg',
            ),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
           width: 35,
            height: 35,
            placeholder: 'assets/loader.gif', image: user.img!);

    return DataRow.byIndex(index: index, cells: [
       DataCell(ClipOval(child: image)),
      DataCell(Text('${user.nombre}')),
      DataCell(Text('${user.correo}')),
      DataCell(Text('${user.uid}')),
      DataCell(IconButton(
        onPressed: () {
          NavigationService.navigateTo('/dashboard/users/${user.uid}');
        },
        icon: const Icon(Icons.edit_outlined),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
