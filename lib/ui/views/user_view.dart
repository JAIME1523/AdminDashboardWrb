// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_imputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labes.dart';

import 'package:admin_dashboard/providers/providers.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (
          _,
        ) =>
                UserViewProvider(uid)),
        // ChangeNotifierProvider(create: (_) => UserFormProvider()),
      ],
      child: Builder(builder: (context) {
        final userProvider = Provider.of<UserViewProvider>(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'User View',
                style: CustomLabes.h1,
              ),
              const SizedBox(
                height: 10,
              ),
              userProvider.isCharge
                  ? WhiteCard(
                      child: Container(
                          alignment: Alignment.center,
                          height: 300,
                          child: const CircularProgressIndicator()))
                  : userProvider.user == null
                      ? const WhiteCard(child: Text('El Usuario no existe'))
                      : _UserViewBody(userProvider: userProvider),
            ],
          ),
        );
      }),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    Key? key,
    required this.userProvider,
  }) : super(key: key);

  final UserViewProvider userProvider;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(250),
      },
      //ancho de la col
      children: [
        TableRow(children: [
          //Avatar
          const _AvatarContainer(),

          //Formulario

          _UserViewFrom(
            userProvider: userProvider,
          )
        ])
      ],
    );
  }
}

class _UserViewFrom extends StatelessWidget {
  const _UserViewFrom({
    Key? key,
    required this.userProvider,
  }) : super(key: key);
  final UserViewProvider userProvider;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Informacion general ${userProvider.user!.correo}',
      child: Form(
        key: userProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: userProvider.user!.nombre,
              decoration: CustomInputs.forInpuDecoration(
                  label: 'Nombre',
                  hint: 'Nombre del usuario',
                  icon: Icons.supervised_user_circle_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Inregrese un nombre';
                }
                if (value.length < 2) {
                  return 'el nombre debe de ser de 2 letras minimo';
                }
                return null;
              },
              onChanged: (value) => userProvider.copyUserwith(nombre: value),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) => userProvider.copyUserwith(correo: value),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) {
                  return 'Email no valido';
                }

                return null;
              },
              initialValue: userProvider.user!.correo,
              decoration: CustomInputs.forInpuDecoration(
                  label: 'Correo',
                  hint: 'Correo del usuario',
                  icon: Icons.mark_email_read_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 110,
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () async {
                    final saved = await userProvider.updateUser();
                    if (saved) {
                      NotificationsService.showSnackbar('Usuario actualizado');
                      Provider.of<UsersProvider>(context, listen: false)
                          .refreshUser(userProvider.user!);
                      //actulizar susuarios
                    } else {
                      NotificationsService.showSnackbar(
                          'no se pudo guardar Usuario');
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.save_outlined),
                      Text('Guardar')
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewProvider>(context);
    final image = (userProvider.user!.img == null)
        ? const Image(image: AssetImage('assets/no-image.jpg'))
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif', image: userProvider.user!.img!);

    return WhiteCard(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: CustomLabes.h2,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 150,
            height: 160,
            child: Stack(
              children: [
                ClipOval(child: image),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png', 'jpeg'],
                            allowMultiple: false,
                          );

                          if (result != null) {
                            NotificationsService.showBusyIndicator(context);
                            PlatformFile file = result.files.first;

                            await userProvider.uploadImage(file.bytes!);
                            Provider.of<UsersProvider>(context, listen: false)
                                .refreshUser(userProvider.user!);
                            Navigator.pop(context);
                          } else {
                            // User canceled the picker
                            NotificationsService.showSnackbar(
                                'No se selecciono imagen');
                          }
                        },
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        )),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            userProvider.user!.nombre!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
