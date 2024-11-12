import 'package:clone_whatsapp/src/modules/auth/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = TextEditingController(text: 'admin');
  final passwordController = TextEditingController(text: 'admon');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomInput(
                title: 'usuario',
                userController: userController,
              ),
              CustomInput(
                title: 'contraseña',
                userController: passwordController,
                keyboardType: TextInputType.visiblePassword,
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text('Hola soy un bottomSheet'),
                                ],
                              ),
                            );
                          }));
                },
                child: Text('Mostrar bottomSheet'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            if (userController.text.isEmpty ||
                passwordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ingrese los campos solicitados'),
                  // duration: const Duration(days: 2),
                  onVisible: () => print('Snackbar visible'),
                  action: SnackBarAction(
                      label: 'OK',
                      onPressed: () =>
                          ScaffoldMessenger.of(context).hideCurrentSnackBar()),
                ),
              );

              return;
            }

            if (userController.text == 'admin') {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Bienvenido'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hola soy una alerta'),
                      CustomInput(
                          userController: TextEditingController(),
                          title: 'codigo de verificacion')
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Elimnar',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.teal[50]),
                      ),

                      // ButtonStyle(
                      //   backgroundColor: WidgetStateProperty.all(Colors.teal),
                      // ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
