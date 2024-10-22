import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Widgets sin estado: StatelessWidget
// Widgets con estado: StatefullWidget

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double size = 24.0;

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    print('Cambió el estado');
    final estilo = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w200,
      color: Colors.blueGrey,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // centerTitle: false,
          backgroundColor: Colors.teal,
          title: Text(
            'Mi primer app',
            style: TextStyle(
              color: Colors.teal[50],
              fontSize: size,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Hola Mundo',
                style: estilo.copyWith(
                  fontSize: size,
                ),
              ),
            ),
            Center(
              child: Text(
                '$contador',
                style: estilo.copyWith(
                  fontSize: 40,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            contador++;
            size++;
            setState(() {});
          },
        ),
      ),
    );
  }
}
