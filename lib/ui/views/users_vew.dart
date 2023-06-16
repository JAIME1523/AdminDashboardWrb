import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/datatables/user_datasource.dart';
import 'package:admin_dashboard/ui/labels/custom_labes.dart';


class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);

    final usersDataSourse = UserDataSourse(usersProvider.users);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text(
            'USers View',
            style: CustomLabes.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Esta es una pantalla para users'),
          PaginatedDataTable(
              sortAscending: usersProvider.ascending,
              sortColumnIndex: usersProvider.sortColumnIndex,
              columns: [
                const DataColumn(
                  label: Text('Avatar'),
                ),
                DataColumn(
                    label: const Text('Nombre'),
                    onSort: (colIndex, _) {
                      usersProvider.sortColumnIndex = colIndex;
                      usersProvider.short((user) => user.nombre!);
                    }),
                DataColumn(
                    label: const Text('Email'),
                    onSort: (colIndex, _) {
                      usersProvider.sortColumnIndex = colIndex;

                      usersProvider.short((user) => user.correo!);
                    }),
                const DataColumn(
                  label: Text('UID'),
                ),
                const DataColumn(
                  label: Text('Acciones'),
                ),
              ],
              source: usersDataSourse,
              onPageChanged: (page) {})
        ],
      ),
    );
  }
}
