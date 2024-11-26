import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:get/get.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key});

  // final ContadorController controller = ContadorController();
  final controller = Get.find<ContadorController>();
  // final controller = Get.put<ContadorController>(ContadorController());

  late AnimationController animateController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addNum(controller.numeros.length + 1);
          print(controller.numeros);
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.numeros.length,
            itemBuilder: (context, index) {
              return FadeOutLeft(
                manualTrigger: true,
                controller: (controller) => animateController = controller,
                child: ListTile(
                  title: Text('Número: ${controller.numeros[index]}'),
                  onLongPress: () {
                    animateController.forward();
                    // controller.deleteNumber(index);
                  },
                ),
              );
            },
          )),
    );
  }
}
