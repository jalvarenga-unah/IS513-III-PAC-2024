import 'package:flutter/material.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:gestor_estado/detalle_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
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
