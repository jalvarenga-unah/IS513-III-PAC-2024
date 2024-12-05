import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estado/models/album.dart';

class AdminAlbum extends StatelessWidget {
  AdminAlbum({super.key});

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController artistaController = TextEditingController();
  final TextEditingController anioController = TextEditingController();
  final colecctionRef = FirebaseFirestore.instance.collection('albumes');

  getInfo(String id) async {
    final docSnap = await colecctionRef.doc(id).get();
    final albumEdit = Album.fromJson(docSnap.data() as Map<String, dynamic>);

    tituloController.text = albumEdit.nombreAlbum;
    artistaController.text = albumEdit.nombreBanda;
    anioController.text = albumEdit.anio.toString();
  }

  @override
  Widget build(BuildContext context) {
    final docId = ModalRoute.of(context)!.settings.arguments as String?;
    if (docId != null) getInfo(docId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Album'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: 'nombre album',
              ),
            ),
            TextField(
              controller: artistaController,
              decoration: InputDecoration(
                labelText: 'Banda',
              ),
            ),
            TextField(
              controller: anioController,
              decoration: InputDecoration(
                labelText: 'Año lazamiento',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final nuevoAlbum = Album(
                  nombreBanda: artistaController.text,
                  nombreAlbum: tituloController.text,
                  anio: int.parse(anioController.text),
                );

                if (docId != null) {
                  //acutalizar
                  colecctionRef.doc(docId).update(nuevoAlbum.toJson());
                } else {
                  colecctionRef.add(nuevoAlbum.toJson());
                }
              },
              child: Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
