import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.not_interested,
              size: 150,
              color: Colors.blueGrey,
            ),
            Text('Ruta no encontrada :( '),
          ],
        ),
      ),
    );
  }
}
