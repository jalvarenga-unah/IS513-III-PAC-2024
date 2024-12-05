import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estado/admin_album.dart';
import 'package:gestor_estado/controllers/contador_controller.dart';
import 'package:gestor_estado/models/album.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key});

  // final ContadorController controller = ContadorController();
  final controller = Get.find<ContadorController>();
  // final controller = Get.put<ContadorController>(ContadorController());
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('albumes');

  @override
  Widget build(BuildContext context) {
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AdminAlbum()));
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
            final temp = itemAlbum.data() as Map<String, dynamic>;
            temp['id'] = itemAlbum.id;
            return Album.fromJson(temp);
          }).toList();

          return ListView.builder(
            itemCount: listaAlbumes.length,
            itemBuilder: (context, index) {
              final album = listaAlbumes[index];

              return Dismissible(
                key: ValueKey(album.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.red[100],
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.edit,
                    color: Colors.green[100],
                  ),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminAlbum(),
                        settings: RouteSettings(arguments: album.id)));

                    return Future.value(false);
                  }

                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirmación"),
                        content: Text(
                            "Seguro que quiere eliminar ${album.nombreAlbum}?"),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                "Eliminar",
                                style: TextStyle(color: Colors.red),
                              )),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Cancelar"),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    //navegar a la pantalla de edición
                    print('editar');
                  } else {
                    //eliminar el documento
                    // final docRef = ref.doc(  snapshot.data!.docs[index].id    );
                    ref.doc(album.id).delete();
                  }
                },
                child: ListTile(
                  title: Text('Banda: ${album.nombreBanda}'),
                  subtitle: Text('Album: ${album.nombreAlbum}'),
                  trailing: Text('Año: ${album.anio}'),
                ),
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
