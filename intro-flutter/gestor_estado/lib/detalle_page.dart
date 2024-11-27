import 'package:flutter/material.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:get/get.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key});

  // final ContadorController controller = ContadorController();
  final controller = Get.find<ContadorController>();
  // final controller = Get.put<ContadorController>(ContadorController());

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
              return Dismissible(
                key: ValueKey(controller.numeros[index].toString()),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: const Icon(Icons.delete),
                ),
                // confirmDismiss: (direction) {
                //   if (direction == DismissDirection.endToStart) {
                //     return Future.value(true);
                //   }
                //   return Future.value(false);
                // },
                secondaryBackground: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.edit),
                ),
                onDismissed: (direction) {
                  //TODO: alerta para confirmar la eliminación
                  if (direction == DismissDirection.startToEnd) {
                    controller.deleteNumber(index);
                  }
                },
                child: ListTile(
                  title: Text('Número: ${controller.numeros[index]}'),
                  onLongPress: () {
                    controller.deleteNumber(index);
                  },
                ),
              );
            },
          )),
    );
  }
}
