import 'package:clone_whatsapp/src/modules/auth/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = TextEditingController();
  final passwordController = TextEditingController();

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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            print(userController.text);
          }),
    );
  }
}
