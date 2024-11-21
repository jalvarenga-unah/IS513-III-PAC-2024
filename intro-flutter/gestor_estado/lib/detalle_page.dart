import 'package:flutter/material.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:get/get.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key});

  // final ContadorController controller = ContadorController();
  final controller = Get.find<ContadorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Detalle Page',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Obx(
              () => Text(
                '${controller.contador}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
