import 'package:flutter/material.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:gestor_estado/detalle_page.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      // home: HomePage(),
      routes: {
        '/': (context) => HomePage(),
        '/detalle': (context) => DetallePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  // final controller = ContadorController();
  final controller = Get.put(ContadorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${controller.contador}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 12334,
            onPressed: () {
              // Add your onPressed code here!
              controller.contador++;
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 123,
            onPressed: () {
              Navigator.of(context).pushNamed('/detalle');
            },
            child: const Icon(Icons.arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}
