import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.userController,
    required this.title,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController userController;
  final String title;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: userController,
      keyboardType: keyboardType,
      obscureText: keyboardType == TextInputType.visiblePassword,
      // style: TextStyle(color: Colors.teal),
      decoration: InputDecoration(
          hintText: 'Ingrese su $title',
          // labelStyle: TextStyle(color: Colors.red),
          label: Text(title),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
          ),
          prefixIcon: const Icon(Icons.person),
          suffixIcon: const Icon(Icons.remove_red_eye)
          // counter: Text('olii'),
          ),
      maxLength: 15,
    );
  }
}
