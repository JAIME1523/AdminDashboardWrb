import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/bouttons/custom_icon_button.dart';

import 'package:admin_dashboard/ui/labels/custom_labes.dart';
import 'package:admin_dashboard/ui/modals/categorie_modal.dart';

import 'package:admin_dashboard/providers/providers.dart';



class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    final verticalScrollController = ScrollController();


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        controller: verticalScrollController,
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Categories View',
            style: CustomLabes.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoría')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS(categorias, context),
            header: const Text(
              'esta es la lista de todas las cetgorias disponibles',
              maxLines: 2,
            ),
            controller: verticalScrollController,
            dataRowHeight: kMinInteractiveDimensionCupertino,
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
          
              CustomIconBotton(
                onPressed: ()async {
                 
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                      context: context, builder: (_) => const CategoriesModal(categoria: null,));
                },
                text: 'Crear',
                icon: Icons.add_outlined,
              )
            ],
          ),
        ],
      ),
    );
  }
}
