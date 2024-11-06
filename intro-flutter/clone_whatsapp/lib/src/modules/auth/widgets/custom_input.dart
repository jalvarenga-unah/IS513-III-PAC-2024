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
      decoration: InputDecoration(
          hintText: 'Ingrese su $title',
          label: Text(title),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
          ),
          prefixIcon: Icon(Icons.person),
          suffixIcon: Icon(Icons.remove_red_eye)
          // counter: Text('olii'),
          ),
      maxLength: 15,
    );
  }
}
