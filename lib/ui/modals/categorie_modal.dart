import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/bouttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_imputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesModal extends StatefulWidget {
  const CategoriesModal({Key? key, this.categoria}) : super(key: key);
  final Categoria? categoria;

  @override
  State<CategoriesModal> createState() => _CategoriesModalState();
}

class _CategoriesModalState extends State<CategoriesModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    if (widget.categoria != null) {
      id = widget.categoria!.id;
      nombre = widget.categoria!.nombre ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryPrvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding:const EdgeInsets.all(20),
      height: 500,
      width: 300, //expanded
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria != null
                    ? widget.categoria!.nombre!
                    : 'Nueva categoria',
                style: CustomLabes.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
       const   SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: nombre,
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoratoin(
              hint: 'Nombre de la categoria',
              label: 'Categoria ',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlineButtom(
              onPressed: () async {
                try {
                  if (widget.categoria == null) {
                    //crear
                    await categoryPrvider.newCategory(nombre).then((value) {
                      NotificationsService.showSnackbar('$nombre creado!!');
                    });
                  } else {
                    //actulizar
                    await categoryPrvider.editCategory(nombre, id);
                    NotificationsService.showSnackbar('$nombre Actualizado!!');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();

                  NotificationsService.showSnackbar(
                      'No se puedo guardar los cmaios!!');
                }
              },
              text: 'guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color:  Color(0xfff0f2041),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
