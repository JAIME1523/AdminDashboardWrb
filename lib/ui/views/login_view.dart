import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/longin_from_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/bouttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/bouttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_imputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthPorvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFromProvider(),
      child: Builder(builder: (context) {
        final loginFromProvider =
            Provider.of<LoginFromProvider>(context, listen: false);
        return Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 370),
              child: Form(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: loginFromProvider.fromKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          onFieldSubmitted: (_) {
                            onFormSubmit(loginFromProvider, authProvider);
                          },
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no valido';
                            }

                            return null;
                          },
                          onChanged: ((value) {
                            loginFromProvider.email = value;
                          }),
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
                          onFieldSubmitted: (_) {
                            onFormSubmit(loginFromProvider, authProvider);
                          },
                          onChanged: ((value) {
                            loginFromProvider.pasword = value;
                          }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contrañsena';
                            }
                            if (value.length < 6) {
                              return 'Contraseña mayor a 6 caracteres';
                            }

                            return null;
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
                            onFormSubmit(loginFromProvider, authProvider);
                          },
                          text: 'Ingresar',
                          // isFilled: true,
                          // color: Colors.purple,
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Nueva cuenta',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Flurorouter.registerRoute);
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

  void onFormSubmit(
      LoginFromProvider loginFromProvider, AuthPorvider authProvider) {
    final isValid = loginFromProvider.validateFrom();
    if (isValid) {
      authProvider.login(loginFromProvider.email, loginFromProvider.pasword);
    }
  }
}
