import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Widgets sin estado: StatelessWidget
// Widgets con estado: StatefullWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Text('Hola mundo'),
        ),
      ),
    );
  }
}
