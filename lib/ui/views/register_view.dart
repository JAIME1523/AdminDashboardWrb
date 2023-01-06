import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/bouttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/bouttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_imputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegsiterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegsiterFormProvider>(context, listen: false);
        return Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 370),
              child: Form(
                  key: registerFormProvider.fromKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return 'Ingresar nombre';
                            return null;
                          },
                          onChanged: (value) {
                            registerFormProvider.name = value;
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoratoin(
                              hint: 'Ingrese su nombre',
                              icon: Icons.supervisor_account_rounded,
                              label: 'nombre'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          // validator: (value) {},
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no valido';
                            }
                  
                            return null;
                          },
                          onChanged: (value) {
                            registerFormProvider.email = value;
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoratoin(
                              hint: 'Ingrese su correo',
                              icon: Icons.email,
                              label: 'Email'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contrañsena';
                            }
                            if (value.length < 6) {
                              return 'Contraseña mayor a 6 caracteres';
                            }
                  
                            return null;
                          },
                          onChanged: (value) {
                            registerFormProvider.name = value;
                          },
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoratoin(
                              hint: 'Ingrese su contraseña',
                              icon: Icons.lock,
                              label: 'Contraseña'),
                        ),
                        const SizedBox(height: 20),
                        CustomOutlineButtom(
                          onPressed: () {
                            registerFormProvider.validateFrom();
                          },
                          text: 'Ingresar',
                          // isFilled: true,
                          // color: Colors.purple,
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Ir login',
                          onPressed: () {
                            Navigator.pushNamed(context, Flurorouter.loginRoute);
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      }),
    );
  }
}
