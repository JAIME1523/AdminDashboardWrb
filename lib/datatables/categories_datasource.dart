import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/categorie_modal.dart';


class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);
  @override
  DataRow? getRow(int index) {
    final categoria = categorias[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        Text(categoria.id!),
      ),
      DataCell(
        Text(categoria.nombre!),
      ),
      DataCell(
        Text(categoria.usuario!.nombre!),
      ),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoriesModal(
                          categoria: categoria,
                        ));
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text('¿Estas seguro de borrarlo?'),
                  content: Text('¿Borrar definitivamnete ${categoria.nombre}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () async {
                          final categoryPrvider =
                              Provider.of<CategoriesProvider>(context,
                                  listen: false);
                          await categoryPrvider.deleteCategory(categoria.id!);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
                        child:const  Text('Si')),
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red.withOpacity(0.8),
              )),
          // IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined, color: ,)),
        ],
      )),
    ]);
  }

  @override
  //aproximado de datos
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
