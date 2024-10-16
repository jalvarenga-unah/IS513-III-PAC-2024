import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Widgets sin estado: StatelessWidget
// Widgets con estado: StatefullWidget

class MyApp extends StatelessWidget {
  double size = 24.0;

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          // width: double.infinity,
          color: Colors.red,
          child: const Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Hola Mundo')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Item 1'),
                  Text('Item 2'),
                ],
              ),
              Text(
                'Hola Mundo',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('Hizo clic');
          },
        ),
      ),
    );
  }
}
