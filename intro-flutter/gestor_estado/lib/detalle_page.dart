import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:gestor_estado/models/album.dart';
import 'package:get/get.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key});

  // final ContadorController controller = ContadorController();
  final controller = Get.find<ContadorController>();
  // final controller = Get.put<ContadorController>(ContadorController());

  @override
  Widget build(BuildContext context) {
    final CollectionReference ref =
        FirebaseFirestore.instance.collection('albumes');

    //     final ref = FirebaseFirestore.instance.collection('albumes').withConverter<Album>(
    //   fromFirestore: (snapshot, _) => Album.fromJson(snapshot.data()!),
    //   toFirestore: (movie, _) => movie.toJson(),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.addNum(controller.numeros.length + 1);
          // print(controller.numeros);

          final nuevoAlbum = Album(
            nombreBanda: 'Iron Maiden',
            nombreAlbum: 'The Number of the Beast',
            anio: 1982,
          );

          ref.add(nuevoAlbum.toJson());
        },
        child: const Icon(Icons.add),
      ),
      body:
          //  FutureBuilder(
          StreamBuilder(
        // future: ref.get(),
        stream: ref.snapshots(),
        builder: (BuildContext contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            //Un widget personalziado que detalle el error
            return const Center(child: Text('Error'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos'));
          }

          final listaAlbumes = snapshot.data!.docs.map((itemAlbum) {
            return Album.fromJson(itemAlbum.data() as Map<String, dynamic>);
          }).toList();

          return ListView.builder(
            itemCount: listaAlbumes.length,
            itemBuilder: (context, index) {
              final album = listaAlbumes[index];

              return ListTile(
                title: Text('Banda: ${album.nombreBanda}'),
                subtitle: Text('Album: ${album.nombreAlbum}'),
                trailing: Text('Año: ${album.anio}'),
              );
            },
          );
        },
      ),
    );
  }
}


/*
Obx(() => ListView.builder(
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
           */